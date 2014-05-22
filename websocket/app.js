// Generated by CoffeeScript 1.6.3
/*
Module dependencies.
*/


(function() {
  var app, express, http, io, path, routes, server, user;

  express = require("express");

  routes = require("./routes");

  user = require("./routes/user");

  http = require("http");

  path = require("path");

  app = express();

  app.set("port", process.env.PORT || 3000);

  app.set("views", __dirname + "/views");

  app.set("view engine", "jade");

  app.use(express.favicon());

  app.use(express.logger("dev"));

  app.use(express.bodyParser());

  app.use(express.methodOverride());

  app.use(app.router);

  app.use(express["static"](path.join(__dirname, "public")));

  app.get("/", routes.index);

  server = http.createServer(app).listen(app.get("port"), function() {
    return console.log("Express server listening on port " + app.get("port"));
  });

  if ('development' === app.get('env')) {
    app.use(express.errorHandler());
  }

  io = require('socket.io').listen(server);

  io.sockets.on('connection', function(socket) {
    socket.on('msg send', function(msg) {
      socket.emit('msg push', msg);
      return socket.broadcast.emit('msg push', msg);
    });
    return socket.on('disconnect', function() {
      return log('disconnected');
    });
  });

}).call(this);
