
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
    var eventInfo = {};     // event info

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

        eventInfo = data;

        // update title
        $title.text(data.eventTitle);
		var d = new Date(data.eventDate);

		var datestring = ("0" + d.getDate()).slice(-2) + "." + ("0"+(d.getMonth()+1)).slice(-2) + "." + d.getFullYear();
        $date.text(datestring);

        // update columns
        updateTableColumns();
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

    // update table columns #live-atstart, #live-realtime, #live-atfinish, #startlist, #ranking, .table-scoreboard
    function updateTableColumns() {
        updateTableHeaderColumns();

        updateTableBodyColumns("live-atstart");
        updateTableBodyColumns("live-realtime");
        updateTableBodyColumns("live-atfinish");
        updateTableBodyColumns("startlist");
        updateTableBodyColumns("ranking");
    }

    function updateTableHeaderColumns() {
        // change header
        var total = 8 + (eventInfo.roundNumber + eventInfo.jumpoffNumber) * 2;
        var percent = 100 / total;

        var headers = $(".table-scoreboard thead tr");
        for(var header of headers) {
            var ths = header.children("th");

            ths[0].css("max-witdh", percent);
            ths[1].css("max-witdh", percent);
            ths[2].css("max-witdh", percent * 2);
            ths[3].css("max-witdh", percent * 3);
            ths[4].css("max-witdh", percent);

            for(i = 0 ; i < 4 ; i++) {
                ths[5 + i * 2].css("max-witdh", percent);
                ths[6 + i * 2].css("max-witdh", percent);

                ths[5 + i * 2].css("display", (i < eventInfo.roundNumber)?"inline-block":"none");
                ths[6 + i * 2].css("display", (i < eventInfo.roundNumber)?"inline-block":"none");

                ths[13 + i * 2].css("max-witdh", percent);
                ths[14 + i * 2].css("max-witdh", percent);

                ths[13 + i * 2].css("display", (i < eventInfo.jumpoffNumber)?"inline-block":"none");
                ths[14 + i * 2].css("display", (i < eventInfo.jumpoffNumber)?"inline-block":"none");
            }
        }
    }


    function updateTableBodyColumns(tableId) {
        // change body
        var total = 8 + (eventInfo.roundNumber + eventInfo.jumpoffNumber) * 2;
        var percent = 100 / total;

        var trs = $('#' + tableId + ' tr');

        for(let tr of trs) {
            var tds = tr.children("td");

            tds[0].css("max-witdh", percent);
            tds[1].css("max-witdh", percent);
            tds[2].css("max-witdh", percent * 2);
            tds[3].css("max-witdh", percent * 3);
            tds[4].css("max-witdh", percent);

            var visibleColumns = (eventInfo.roundNumber + eventInfo.jumpoffNumber) * 2;

            for(i = 0 ; i < 16 ; i++) {
                tds[i].css("max-witdh", percent);
                tds[i].css("display", (i < visibleColumns)?"inline-block": "none");
            }
        }
    }

    //  fill the list from index to the atstart list
    function updateLiveAtStart(index) {
        let limit = (index + 3 < startlist.length)?(index + 3):startlist.length;

        var row = 1;
        // load ranking data
        for(i = limit - 1 ; i >= index ; i--) {
            addToRankingList("live-atstart", row++, startlist[i]);
        }
        clearRankingRemains("live-atstart", row);
        updateTableBodyColumns("live-atstart");
    }

    // fill the rank from index to the atstart list
    function updateLiveAtFinish(index) {
        let limit = (index - 3 >= 0)?(index - 3):-1;

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
        updateTableBodyColumns("live-atfinish");
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

        let curIndex = 6;
        for(i = 1 ; i <= eventInfo.roundNumber ; i++) {
            let point, time;
            if(ranking.points !== undefined) {
                point = ranking.points['-' + i];
            }
            if(ranking.times !== undefined) {
                time = ranking.times['-' + i];
            }
            tr.children("td:nth-child(" + curIndex + ")").html(point === undefined?"&nbsp":(point / 1000).toFixed(2));
            if(fullupdate)
                tr.children("td:nth-child(" + (curIndex + 1) + ")").html(time === undefined?"&nbsp":(time / 1000).toFixed(2));
            curIndex += 2;
        }

        for(i = 1 ; i <= eventInfo.jumpoffNumber ; i++) {
            let point, time;
            if(ranking.points !== undefined) {
                point = ranking.points['' + i];
            }
            if(ranking.times !== undefined) {
                time = ranking.times['' + i];
            }
            tr.children("td:nth-child(" + curIndex + ")").html(point === undefined?"&nbsp":(point / 1000).toFixed(2));
            if(fullupdate)
                tr.children("td:nth-child(" + (curIndex + 1) + ")").html(time === undefined?"&nbsp":(time / 1000).toFixed(2));
            curIndex += 2;
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
        } else {
            tr.children("td:nth-child(4)").html("&nbsp");
            tr.children("td:nth-child(5)").html("&nbsp");
        }

        updateTableBodyColumns("live-realtime");
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
        updateTableBodyColumns("startlist");
    }

    function updateRankingList() {
        var index = 1;
        for (let ranking of rankings) {
            addToRankingList("ranking", index++, ranking);
        }
        clearRankingRemains("ranking", index);
        updateTableBodyColumns("ranking");
    }

    function addToRankingList(tableId, i, ranking) {
        var tr = $('#' + tableId + ' tr:nth-child(' + i + ')');

        if (tr.length == 0) {
            $('#' + tableId).append($('<tr>'));
            tr = $('#' + tableId + ' tr:last');
            tr.append($('<td>').addClass("center").html("&nbsp"));
            tr.append($('<td>').addClass("center").html("&nbsp"));
            tr.append($('<td>').addClass("left").html("&nbsp"));
            tr.append($('<td>').addClass("left").html("&nbsp"));
            tr.append($('<td>').addClass("flag").html("&nbsp"));

            for(i = 0 ; i < 4 * 2 * 4 ; i++) {
                tr.append($('<td>').addClass("right").html("&nbsp"));
            }
        }

        tr.children("td:nth-child(1)").html((ranking.rank===undefined)?"&nbsp":ranking.rank);
        tr.children("td:nth-child(2)").html(ranking.no);

        // fill the time & points
        let curIndex = 6;
        for(i = 1 ; i <= eventInfo.roundNumber ; i++) {
            let point, time;
            if(ranking.points !== undefined) {
                point = ranking.points['-' + i];
            }
            if(ranking.times !== undefined) {
                time = ranking.times['-' + i];
            }
            tr.children("td:nth-child(" + curIndex + ")").html(point === undefined?"&nbsp":(point / 1000).toFixed(2));
            tr.children("td:nth-child(" + (curIndex + 1) + ")").html(time === undefined?"&nbsp":(time / 1000).toFixed(2));
            curIndex += 2;
        }

        for(i = 1 ; i <= eventInfo.jumpoffNumber ; i++) {
            let point, time;
            if(ranking.points !== undefined) {
                point = ranking.points['' + i];
            }
            if(ranking.times !== undefined) {
                time = ranking.times['' + i];
            }
            tr.children("td:nth-child(" + curIndex + ")").html(point === undefined?"&nbsp":(point / 1000).toFixed(2));
            tr.children("td:nth-child(" + (curIndex + 1) + ")").html(time === undefined?"&nbsp":(time / 1000).toFixed(2));
            curIndex += 2;
        }

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


