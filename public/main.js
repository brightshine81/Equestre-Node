
$(function () {
    var FADE_TIME = 150; // ms

    // Initialize variables
    var $window = $(window);
    var $title = $('#event-title');
    var $date = $('#event-date');

    // running events
    var events = [];

    // info of current event
    var horses = {};    // number-indexed map
    var riders = {};    // number-indexed map
    var rankings = [];  // ranking list
    var realtime = {};  // live info
    var startlist = []; // startlist
    var rolling_timer;

    // Prompt for setting a username
    var connected = false;
    var socket = io();

    socket.emit("subscribe", "consumer");
//

    //// messages to process
    //   socket.to('consumer').emit('start', { id: event.id} );
    //   socket.to('consumer').emit('end', { id: socket.eventId });
    //   socket.to(event.id).emit('info', event.info);
    //   socket.to(event.id).emit('horses', event.horses);
    //   socket.to(event.id).emit('riders', event.riders);
    //   socket.to(event.id).emit('startlist', event.startlist);
    //   socket.to(event.id).emit('ranking', event.ranking);
    //   socket.to(event.id).emit('realtime', event.realtime);
    //   socket.to(event.id).emit('resume');
    //   socket.to(event.id).emit('pause');
    //   socket.to(event.id).emit('final', event.final);

    // Socket events
    socket.on("events", function(data) {
        console.log("[on] events:" + JSON.stringify(data));
        events = data;
        updateEventList();
        joinToEvent();
    });

    socket.on("start", function (data) {
        console.log("[on] start:" + JSON.stringify(data));
        events.push(data);
        updateEventList();
    });

    socket.on("end", function (data) {
        console.log("[on] end:" + JSON.stringify(data));
        events = events.filter((event) => {
            return event.id !== data;
        });
        updateEventList();
    });

    socket.on("info", function (data) {
        console.log("[on] info:" + JSON.stringify(data));
        $title.text(data.eventTitle);
		var d = new Date(data.eventDate);

		var datestring = ("0" + d.getDate()).slice(-2) + "." + ("0"+(d.getMonth()+1)).slice(-2) + "." + d.getFullYear();
        $date.text(datestring);
    });

    // Whenever the server emits 'login', log the login message
    socket.on('horses', function (data) {
        console.log("[on] horses:" + JSON.stringify(data));
        for (let horse of data) {
            horses[horse.no] = horse;
        }
        updateRankingList();
        updateStartList();

    });

    socket.on('riders', function (data) {
        console.log("[on] riders:" + JSON.stringify(data));
        for (let rider of data) {
            riders[rider.no] = rider;
        }
        updateRankingList();
        updateStartList();

        $('[data-toggle="tooltip"]').tooltip();
    });

    socket.on('startlist', function (data) {
        console.log("[on] startlist:" + JSON.stringify(data));
        startlist = data;
        updateStartList();
    });

    socket.on('ranking', function (data) {
        console.log("[on] ranking:" + JSON.stringify(data));
        data.sort((a, b) => {
            return a.rank - b.rank;
        });

        rankings = data;
        updateRankingList();
    });

    socket.on('realtime', function (data) {
        console.log("[on] realtime:" + JSON.stringify(data));
        realtime = data;

        // update except time
        setRuntimeList(false);
    });

    socket.on('resume', function (data) {
        console.log("[on] resume");

        // start rolling timer
        let started = 0, started_now = Date.now();
        if(realtime.lane == 1) {
            started = realtime.time1;
        } else {
            started = realtime.time2;
        }

        rolling_timer = setInterval(function() {
            updateRuntimeTimer(realtime.lane, started + (Date.now() - started_now));
        }, 100);

        setRuntimeList(true);

        // update atstart when started
        let index = -1;
        for(i = 0 ; i < startlist.length ; i++) {
            if(startlist[i].no === realtime.no) {
                index = i;
            }
        }
        updateLiveAtStart(index + 1);
        updateLiveAtFinish(index - 1);
    });

    socket.on('pause', function (data) {
        console.log("[on] pause");

        // stop rolling timer
        clearInterval(rolling_timer);

        // full update
        setRuntimeList(true);
    });

    socket.on('final', function (data) {
        console.log("[on] final:" + JSON.stringify(data));

        let index = -1;
        for(i = 0 ; i < startlist.length ; i++) {
            if(startlist[i].no === data.no) {
                index = i;
            }
        }

        if(index >= 0) {
            updateLiveAtStart(index + 1);
            updateLiveAtFinish(index);
        }
    });

    socket.on('disconnect', function () {
        console.log('you have been disconnected');
    });

    socket.on('reconnect', function () {
        console.log('you have been reconnected');
        events = [];

        socket.emit("subscribe", "consumer");
    });

    socket.on('reconnect_error', function () {
        console.log('attempt to reconnect has failed');
    });


    ///////////////////////////////////////////////////
    // UI management function
    //  fill the list from index to the atstart list
    function updateLiveAtStart(index) {
        let limit = (index + 3 < startlist.length)?(index + 3):startlist.length;

        var row = 1;
        // load ranking data
        for(i = limit - 1 ; i >= index ; i--) {
            addToRankingList("live-atstart", row++, startlist[i]);
        }
        clearRankingRemains("live-atstart", row);
    }

    // fill the rank from index to the atstart list
    function updateLiveAtFinish(index) {
        let limit = -1; // (index - 3 >= 0)?(index - 3):-1;

        var row = 1;

        // load ranking data
        for(i = index ; i > limit ; i--) {
            number = startlist[i].no;

            ranking = rankings.find(function(ranking) {
                return ranking.no == number;
            });
            if(ranking !== undefined) {
                addToRankingList("live-atfinish", row++, ranking);
            }
        }
        clearRankingRemains("live-atfinish", row);
    }

    function updateRuntimeTimer(lane, value)
    {
        var tr = $('#live-realtime tr');
        if(lane == 1) {
            tr.children("td:nth-child(7)").html((value / 1000).toFixed(1));
        } else {
            tr.children("td:nth-child(9)").html((value / 1000).toFixed(1));
        }
    }

    function setRuntimeList(fullupdate) {
        var tr = $('#live-realtime tr');

        // clear content
        if (realtime.no == 0) {
            clearRuntimeList();
            return;
        }
        tr.children("td:nth-child(1)").html("&nbsp");
        tr.children("td:nth-child(2)").html(realtime.no);
        tr.children("td:nth-child(6)").html((realtime.point1 / 1000).toFixed(2));
        tr.children("td:nth-child(8)").html((realtime.point2 / 1000).toFixed(2));
        if(fullupdate === true) {
            tr.children("td:nth-child(7)").html((realtime.time1 / 1000).toFixed(2));
            tr.children("td:nth-child(9)").html((realtime.time2 / 1000).toFixed(2));
        }

        var horse = horses[realtime.no];
        if (horse !== undefined) {
            tr.children("td:nth-child(3)").html(horse.name);
        } else {
            tr.children("td:nth-child(3)").html("&nbsp");
        }

        var rider = riders[realtime.no];
        if (rider !== undefined) {
            tr.children("td:nth-child(4)").html(rider.lastName + "&nbsp" + rider.firstName);
            tr.children("td:nth-child(5)").css("background", "url('flags/" + rider.nation + ".bmp') center no-repeat").css("background-size", "contain");
            tr.children("td:nth-child(5)").attr("data-toggle", "tooltip").attr("title", rider.nation);
        } else {
            tr.children("td:nth-child(4)").html("&nbsp");
            tr.children("td:nth-child(5)").html("&nbsp");
        }
    }

    function clearRuntimeList() {
        var tds = $('#live-realtime tr td');
        tds.html("&nbsp");
    }

    function updateStartList()
    {
        var index = 1;
        for (let i = 0 ; i < startlist.length ; i++) {
            addToRankingList("startlist", index++, startlist[i]);
        }
        clearRankingRemains("startlist", index);
    }

    function updateRankingList() {
        var index = 1;
        for (let ranking of rankings) {
            addToRankingList("ranking", index++, ranking);
        }
        clearRankingRemains("ranking", index);
    }

    function addToRankingList(tableId, i, ranking) {
        var tr = $('#' + tableId + ' tr:nth-child(' + i + ')');

        if (tr.length == 0) {
            $('#' + tableId).append($('<tr>'));
            tr = $('#' + tableId + ' tr:last');
            tr.append($('<td>').addClass("col-1 center").html("&nbsp"));
            tr.append($('<td>').addClass("col-1 center").html("&nbsp"));
            tr.append($('<td>').addClass("col-2 left").html("&nbsp"));
            tr.append($('<td>').addClass("col-3 left").html("&nbsp"));
            tr.append($('<td>').addClass("col-1 flag").html("&nbsp"));
            tr.append($('<td>').addClass("col-1 right").html("&nbsp"));
            tr.append($('<td>').addClass("col-1 right").html("&nbsp"));
            tr.append($('<td>').addClass("col-1 right").html("&nbsp"));
            tr.append($('<td>').addClass("col-1 right").html("&nbsp"));
        }

        tr.children("td:nth-child(1)").html((ranking.rank===undefined)?"&nbsp":ranking.rank);
        tr.children("td:nth-child(2)").html(ranking.no);

        tr.children("td:nth-child(6)").html(ranking.point1 === undefined?"&nbsp":(ranking.point1 / 1000).toFixed(2));
        tr.children("td:nth-child(7)").html(ranking.time1 === undefined?"&nbsp":(ranking.time1 / 1000).toFixed(2));
        tr.children("td:nth-child(8)").html(ranking.point2 === undefined?"&nbsp":(ranking.point2 / 1000).toFixed(2));
        tr.children("td:nth-child(9)").html(ranking.time2 === undefined?"&nbsp":(ranking.time2 / 1000).toFixed(2));

        var horse = horses[ranking.no];
        if (horse !== undefined) {
            tr.children("td:nth-child(3)").html(horse.name);
        } else {
            tr.children("td:nth-child(3)").html("&nbsp");
        }

        var rider = riders[ranking.no];
        if (rider !== undefined) {
            tr.children("td:nth-child(4)").html(rider.lastName + "&nbsp" + rider.firstName);
            tr.children("td:nth-child(5)").css("background", "url('flags/" + rider.nation + ".bmp') center no-repeat").css("background-size", "contain");
            tr.children("td:nth-child(5)").attr("data-toggle", "tooltip").attr("title", rider.nation);
        } else {
            tr.children("td:nth-child(4)").html("&nbsp");
            tr.children("td:nth-child(5)").html("&nbsp");
        }
    }

    function clearRankingRemains(tableId, count) {
        while (1) {
            var tr = $('#' + tableId + ' tr:nth-child(' + count + ')');
            if (tr.length == 0)
                break;

            tr.remove();
        }
    }

    function updateEventList() {
        for(event of events) {

        }
    }

    function joinToEvent() {
        if(events.length == 0) {
            $("#noevent").show();
            return ;
        }
        $("#noevent").hide();
        socket.emit("subscribe", events[0].id);
    }
});

$(".nav .nav-link").click(function() {
    $(this).parents("ul").find("div.nav-link").removeClass("active");
    $(this).addClass("active");

    var menu_id = $(this).attr("id");

    $("section#sec-live").css("display", "none");
    $("section#sec-startlist").css("display", "none");
    $("section#sec-ranking").css("display", "none");

    if(menu_id == "nav-live") {
        $("section#sec-live").css("display", "block");
    } else if(menu_id == "nav-startlist") {
        $("section#sec-startlist").css("display", "block");
    } else if(menu_id == "nav-ranking") {
        $("section#sec-ranking").css("display", "block");
    }
});


