$(function() {
  var FADE_TIME = 150; // ms

  // Initialize variables
  var $window = $(window);
  var $realtime = $('#realtime'); // tbody for realtime
  var $ranking = $('#ranking'); // tbody for ranking list
  var $title = $('#event-title');
  var $date = $('#event-date');

  var horses = {};
  var riders = {};

  // Prompt for setting a username
  var connected = false;
  var socket = io();

    socket.on('connection', function(){
        socket.join("consumer");
    });
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
    socket.on("start", function(data) {
      console.log(JSON.stringify(data));
      socket.join(data.id);
    });

    socket.on("end", function(data) {
        console.log(JSON.stringify(data));
        socket.leave(data.id);
    });

    socket.on("info", function(data) {
        console.log(JSON.stringify(data));
        $title.text(data.eventTitle);
        $date.text(data.eventDate);
    });

    // Whenever the server emits 'login', log the login message
    socket.on('horses', function (data) {
        console.log(JSON.stringify(data));
        for(let horse of data) {
            horses[horse.no] = data;
        }
    });

    socket.on('riders', function (data) {
        console.log(JSON.stringify(data));
        for(let rider of data) {
            riders[rider.no] = data;
        }
    });

    socket.on('ranking', function (data) {
        console.log(JSON.stringify(data));
      data.sort((a, b) => {
        return a.rank < b.rank;
      });

      var index = 1;
        for(let ranking of data) {
            addToRankingList(index++, ranking);
        }
        clearRankingRemains(index);
    });

    socket.on('realtime', function (data) {
        console.log(JSON.stringify(data));
      setRuntimeList(data);
    });

    socket.on('disconnect', function () {
        console.log('you have been disconnected');
    });

    socket.on('reconnect', function () {
        console.log('you have been reconnected');
    });

    socket.on('reconnect_error', function () {
        console.log('attempt to reconnect has failed');
    });


    ///////////////////////////////////////////////////
    // UI management function

    function setRuntimeList(record) {
        var tr = $('#realtime tr');

        tr.children("td:nth-child(1)").html("&nbsp");
        tr.children("td:nth-child(2)").html(record.number);
    }

  function addToRankingList(i, ranking) {
    var tr = $('#ranking tr:nth-child(' + i + ')');
    // tr.hide();
      if(tr.length == 0) {
          $('#ranking').append($('<tr>'));
          tr = $('#ranking tr:last');
          tr.append($('<td>').addClass("col-1").html("&nbsp"));
          tr.append($('<td>').addClass("col-1").html("&nbsp"));
          tr.append($('<td>').addClass("col-2").html("&nbsp"));
          tr.append($('<td>').addClass("col-3").html("&nbsp"));
          tr.append($('<td>').addClass("col-1").html("&nbsp"));
          tr.append($('<td>').addClass("col-1").html("&nbsp"));
          tr.append($('<td>').addClass("col-1").html("&nbsp"));
          tr.append($('<td>').addClass("col-1").html("&nbsp"));
          tr.append($('<td>').addClass("col-1").html("&nbsp"));
      }

      tr.children("td:nth-child(1)").html(ranking.rank);
      tr.children("td:nth-child(2)").html(ranking.no);
  }

    function clearRankingRemains(count) {
      while(1) {
          var tr = $('#ranking tr:nth-child(' + count + ')');
          if(tr.length == 0)
            break;

          tr.remove();
      }
    }

});
