
$(function () {
    var FADE_TIME = 150; // ms

    // Initialize variables
    var $window = $(window);
    var $title = $('#event-title');
    var $date = $('#event-date');

    // running events
    var events = [];

    // info of current event
    var horses = {};
    var riders = {};
    var rankings = [];

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
    //   socket.to(event.id).emit('ranking', event.ranking);
    //   socket.to(event.id).emit('realtime', event.realtime);
    //   socket.to(event.id).emit('pause');

    // Socket events
    socket.on("events", function(data) {
        console.log("[on] events:" + JSON.stringify(data));
        events = data;
        updateEventList();
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
    });

    socket.on('riders', function (data) {
        console.log("[on] riders:" + JSON.stringify(data));
        for (let rider of data) {
            riders[rider.no] = rider;
        }
        updateRankingList();
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
        setRuntimeList(data);
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

    function setRuntimeList(record) {
        var tr = $('#realtime tr');

        // clear content
        if (record.no == 0) {
            clearRuntimeList();
            return;
        }
        tr.children("td:nth-child(1)").html("&nbsp");
        tr.children("td:nth-child(2)").html(record.no);
        tr.children("td:nth-child(6)").html((record.point1 / 1000).toFixed(2));
        tr.children("td:nth-child(7)").html((record.time1 / 1000).toFixed(2));
        tr.children("td:nth-child(8)").html((record.point2 / 1000).toFixed(2));
        tr.children("td:nth-child(9)").html((record.time2 / 1000).toFixed(2));

        var horse = horses[record.no];
        if (horse !== undefined) {
            tr.children("td:nth-child(3)").html(horse.name);
        } else {
            tr.children("td:nth-child(3)").html("&nbsp");
        }

        var rider = riders[record.no];
        if (rider !== undefined) {
            tr.children("td:nth-child(4)").html(rider.lastName + "&nbsp" + rider.firstName);
            tr.children("td:nth-child(5)").css("background", "url('images/" + rider.nation + ".bmp') center no-repeat").css("background-size", "contain");
        } else {
            tr.children("td:nth-child(4)").html("&nbsp");
            tr.children("td:nth-child(5)").html("&nbsp");
        }
    }

    function clearRuntimeList() {
        var tds = $('#realtime tr td');
        tds.html("&nbsp");
    }

    function updateRankingList() {
        var index = 1;
        for (let ranking of rankings) {
            addToRankingList(index++, ranking);
        }
        clearRankingRemains(index);
    }

    function addToRankingList(i, ranking) {
        var tr = $('#ranking tr:nth-child(' + i + ')');

        if (tr.length == 0) {
            $('#ranking').append($('<tr>'));
            tr = $('#ranking tr:last');
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

        tr.children("td:nth-child(1)").html(ranking.rank);
        tr.children("td:nth-child(2)").html(ranking.no);

        tr.children("td:nth-child(6)").html((ranking.point1 / 1000).toFixed(2));
        tr.children("td:nth-child(7)").html((ranking.time1 / 1000).toFixed(2));
        tr.children("td:nth-child(8)").html((ranking.point2 / 1000).toFixed(2));
        tr.children("td:nth-child(9)").html((ranking.time2 / 1000).toFixed(2));

        var horse = horses[ranking.no];
        if (horse !== undefined) {
            tr.children("td:nth-child(3)").html(horse.name);
        } else {
            tr.children("td:nth-child(3)").html("&nbsp");
        }

        var rider = riders[ranking.no];
        if (rider !== undefined) {
            tr.children("td:nth-child(4)").html(rider.lastName + "&nbsp" + rider.firstName);
            tr.children("td:nth-child(5)").css("background", "url('images/" + rider.nation + ".bmp') center no-repeat").css("background-size", "contain");
        } else {
            tr.children("td:nth-child(4)").html("&nbsp");
            tr.children("td:nth-child(5)").html("&nbsp");
        }
    }

    function clearRankingRemains(count) {
        while (1) {
            var tr = $('#ranking tr:nth-child(' + count + ')');
            if (tr.length == 0)
                break;

            tr.remove();
        }
    }

    function updateEventList() {
        for(event of events) {

        }
    }

    $('.load').click(function() {
        if(events.length == 0) {
            $("#noevent").show();
            return ;
        }
        $("#noevent").hide();
        socket.emit("subscribe", events[0].id);
    });

});

