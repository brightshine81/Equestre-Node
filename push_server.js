require('dotenv').config();

// Setup basic express server
var express = require('express');
var app = express();
var server = require('http').createServer(app);
var io = require('socket.io')(server);
var port = process.env.SOCKETIO_PORT || 21741;

var dbaction = require('./db_actions');
var Q = require('q');

server.listen(port, function () {
    console.log('Server listening at port %d', port);
});

// Routing
app.use(express.static(__dirname + '/public'));

// current running events
var events = [];

io.on('connection', function (socket) {
    socket.on('subscribe', function (room) {
        console.log("subscribe: " + room);

        // send about the event
        if(room === "provider") {
            socket.join(room);
            console.log("joined to: " + room);
        } else if(room === "consumer") {
            socket.join(room);
            console.log("joined to: " + room);

            // send running events
            let eventInfos = events.map((event)=> {
                return { id: event.id, info: event.info };
            });
            console.log("[emit] socket:events");
            socket.emit('events', eventInfos);

            // console.log("[emit] socket:push");
            // socket.emit("push", { cmd:"info", status:"success", data:{id: 0}});
        } else {
            // findout the event
            let event = events.find((event) => {
                return event.id === room;
            });

            if(event === undefined) {
                console.log("cannot find room");
                return ;
            }
            console.log("found event: " );
            if(socket.eventIdJoint === event.id) {
                console.log("already joined.");
                return ;
            }

            // leave from prev and join to new
            if(socket.eventIdJoint !== undefined) {
                console.log("leave from: " + socket.eventIdJoint);
                socket.leave(socket.eventIdJoint);
            }
            console.log("joined to: " + event.id);
            socket.join(event.id);
            socket.eventIdJoint = event.id;

            // send the information
            if(event.info !== undefined) {
                console.log("[emit] socket:info");
                socket.emit('info', event.info);
            }
            if(event.horses !== undefined) {
                console.log("[emit] socket:horses");
                socket.emit('horses', event.horses);
            }
            if(event.riders !== undefined) {
                console.log("[emit] socket:riders");
                socket.emit('riders', event.riders);
            }
            if(event.ranking !== undefined) {
                console.log("[emit] socket:ranking");
                socket.emit('ranking', event.ranking);
            }
            if(event.startlist !== undefined) {
                console.log("[emit] socket:startlist");
                socket.emit('startlist', event.startlist);
            }
            if(event.final !== undefined) {
                console.log("[emit] socket:final " + JSON.stringify(event.final));
                socket.emit('final', event.final)
            }
        }
    });

    function getSocketEvent() {
        if(socket.eventId === 0) {
            console.error('invalid eventId');
            return false;
        }

        // find event
        let event = events.find((event) => {
            return event.id === socket.eventId;
        });

        if(event === undefined) {
            console.error('eventId not found in current list:' + socket.eventId);
            return false;
        }
        return event;
    }
    /////////***   command processors   ***////////////////////////////////////////

    // query and save to database and get eventId
    async function processInfo(command) {
        // command.title
        // command.eventTitle
        // command.startDate
        // command.endDate
        // command.eventDate
		console.log("processInfo: " + JSON.stringify(command));

		try {
            let eventId = await dbaction.findEvent(command.eventTitle, command.eventDate);

            if(eventId === 0) {
                eventId = await dbaction.addEvent(command);
            }

            socket.eventId = eventId;

            // add to the event list
            let event = getSocketEvent();

            if(event === false) {
                event = {id: eventId, info: command};
                events.push(event);
                console.log("new event pushed: ");

                // alarm to all client

                console.log("[emit] consumer:start " + event);
                socket.to("consumer").emit('start', event );
            } else {
                event.info = { ...event.info, ...command };

                // clear realtime information
                event.realtime = {};
                console.log("update event: " + event.info.toString());
            }
            // alarm to client
            console.log("[emit] " + eventId + ":info " + JSON.stringify(event.info));
            socket.to(eventId).emit('info', event.info);

            // return result
            console.log("[emit] socket:push");
            socket.emit("push", { cmd:"info", status:"success", data:{id: eventId}});
            return eventId;
        } catch(error) {
            console.log("processInfo: failed" + JSON.stringify(error));
            return 0;
        }
    }

    // save to database
    async function processHorses(command) {
        console.log("processHorses started.");

        let event = getSocketEvent();
        if(event === false) {
            console.error("horses command: failed.");
            return ;
        }

        console.log("event found: id=" + event.id + ", info=" + JSON.stringify(event.info));

        // save to status
        event.horses = command.list;

        // alarm to client
        console.log("[emit] " + event.id + ":horses ");
        socket.to(event.id).emit('horses', event.horses);

        // save to database
        try {
            await dbaction.deleteHorses(event.id);

            let affected = 0;
            for(let horse of command.list) {
                var success = await dbaction.addHorse(event.id, horse);
                if(success == 1) {
                    affected++;
                }
            }

            console.log("horses command: inserted=" + affected);

        } catch(err) {
            console.log("horses command failed: " + JSON.stringify(err));
        }

        console.log("processHorses finished.");
    }

    async function processRiders(command) {
        console.log("processRiders started.");

        let event = getSocketEvent();
        if(event === false) {
            console.error("riders command: failed.");
            return ;
        }

        // save to status
        event.riders = command.list;

        // alarm to client
        console.log("[emit] " + event.id + ":riders " );
        socket.to(event.id).emit('riders', event.riders);

        // save to database
        try {
            await dbaction.deleteRiders(event.id);

            let affected = 0;
            for(let rider of command.list) {
                var success = await dbaction.addRider(event.id, rider);
                if(success == 1) {
                    affected++;
                }
            }
            console.log("riders command: inserted=" + affected);
        } catch(err) {
            console.log("horses command failed: " + JSON.stringify(err));
        }
        console.log("processRiders finished.");
    }

    async function processRanking(command) {
        let event = getSocketEvent();
        if(event === false) {
            console.error("ranking command: failed.");
            return ;
        }

        // save to status
        event.ranking = command.list;
        // alarm to client
        console.log("[emit] " + event.id + ":ranking ");
        socket.to(event.id).emit('ranking', event.ranking);

        // save to database
        try {
            // delete previouse data
            await dbaction.deleteRankings(event.id);

            let affected = 0;
            for(let rank of command.list) {
                var success = await dbaction.addRanking(event.id, rank);
                if(success == 1) {
                    affected++;
                }
            }

            console.log("ranking command: inserted=" + affected);

        } catch(err) {
            console.log("horses command failed: " + JSON.stringify(err));
        }

        console.log("processRanking finished.");
    }

    async function processStartlist(command) {
        let event = getSocketEvent();
        if(event === false) {
            console.error("ranking command: failed.");
            return ;
        }

        // save to status
        event.startlist = command.list;
        // alarm to client
        console.log("[emit] " + event.id + ":startlist ");
        socket.to(event.id).emit('startlist', event.startlist);

        console.log("processStartlist finished.");
    }

    // update state
    function processRun(command) {
        // command.number;
        // command.lane;
        // command.point;
        // command.startTime;

        let event = getSocketEvent();
        if(event === false) {
            console.error("run command: failed.");
            return ;
        }

        // update status
        let updated = {};
        updated.no = command.no;
        updated.lane = command.lane;

        event.realtime = { ...event.realtime, ...updated };

        if(event.realtime.points === undefined) {
            event.realtime.points = {};
        }
        event.realtime.points[updated.lane] = command.point;

        // alarm to client
        console.log("[emit] " + event.id + ":realtime(run) " + JSON.stringify(event.realtime));
        socket.to(event.id).emit('realtime', event.realtime);

        if(event.running === undefined || event.running === false) {
            event.running = true;
            console.log("[emit] " + event.id + ":resume ");
            socket.to(event.id).emit('resume');
        }
    }

    function processSync(command) {
        // command.number;
        // command.lane;
        // command.time;
        // command.curTime;

        let event = getSocketEvent();
        if(event === false) {
            console.error("run command: failed.");
            return ;
        }

        // update status
        let updated = {};
        updated.no = command.no;
        updated.lane = command.lane;

        event.realtime = {  ...event.realtime, ...updated };

        if(event.realtime.times === undefined) {
            event.realtime.times = {};
        }
        event.realtime.times[updated.lane] = command.time;

        // alarm to client
        console.log("[emit] " + event.id + ":realtime(sync) " + JSON.stringify(event.realtime));
        socket.to(event.id).emit('realtime', event.realtime);
    }

    function processTimer1(command) {
        // command.number;
        // command.lane;
        // command.time;
        // command.point;

        let event = getSocketEvent();
        if(event === false) {
            console.error("run command: failed.");
            return ;
        }

        event.final = command;

        // alarm to client
        // console.log("[emit] " + event.id + ":final " + JSON.stringify(event.final));
        // socket.to(event.id).emit('final', event.final);
    }

    function processAtStart(command) {
        // command.list
    }

    function processFinal(command) {
        // command.number;
        // command.lane;
        // command.point;
        // command.time;

        let event = getSocketEvent();
        if(event === false) {
            console.error("run command: failed.");
            return ;
        }

        // update status
        let updated = {};
        updated.no = command.no;
        updated.lane = command.lane;

        event.realtime = { ...event.realtime, ...updated };

        if(event.realtime.points === undefined) {
            event.realtime.points = {};
        }
        if(event.realtime.times === undefined) {
            event.realtime.times = {};
        }

        event.realtime.points[updated.lane] = command.point;
        event.realtime.times[updated.lane] = command.time;

        // alarm to client
        console.log("[emit] " + event.id + ":realtime(final) " + JSON.stringify(event.realtime));
        socket.to(event.id).emit('realtime', event.realtime);

        console.log("[emit] " + event.id + ":pause ");
        socket.to(event.id).emit('pause');
        event.running = false;
    }

    // message processor

    socket.on('push', function (msg) {
        // console.log("push: " + msg);
        // check if provider
        let rooms = Object.keys(socket.rooms);
        if (rooms.includes('provider') === false) {
            console.error("invalid push from client");
            return;
        }

        var obj = ((msg) => {
            try {
                return JSON.parse(msg);
            } catch (e) {
                return false;
            }
        })(msg);

        if (!obj || typeof obj.cmd === 'undefined') {
            console.error("invalid message");
            return;
        }

        if (obj.cmd === 'atstart') {
            processAtStart(obj);
        } else if (obj.cmd === 'final') {
            processFinal(obj);
        } else if (obj.cmd === 'run') {
            processRun(obj);
        } else if (obj.cmd === 'sync') {
            processSync(obj);
        } else if (obj.cmd === 'timer1') {
            processTimer1(obj);
        } else if (obj.cmd === 'info') {
            processInfo(obj);
        } else if (obj.cmd === 'horses') {
            processHorses(obj);
        } else if (obj.cmd === 'riders') {
            processRiders(obj);
        } else if (obj.cmd === 'ranking') {
            processRanking(obj);
        } else if(obj.cmd === 'startlist') {
            processStartlist(obj);
        }
    });

    // when the user disconnects.. perform this
    socket.on('disconnect', function () {
        let rooms = Object.keys(socket.rooms);
        if (rooms.includes('provider') === false) {
            return;
        }

        if (socket.eventId) {
            // remove from running events
            events = events.filter(event=>{ return event.id !== socket.eventId; });

            // alarm to clients
            console.log("[emit] consumer:end " + socket.eventId);
            socket.to('consumer').emit('end', { id: socket.eventId });
        }
    });
});
