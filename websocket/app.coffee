###
Module dependencies.
###
express = require("express")
routes = require("./routes")
user = require("./routes/user")
http = require("http")
path = require("path")
app = express()

# all environments
app.set "port", process.env.PORT or 3000
app.set "views", __dirname + "/views"
app.set "view engine", "jade"
app.use express.favicon()
app.use express.logger("dev")
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use express.static(path.join(__dirname, "public"))
app.get "/", routes.index
server = http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")

# development only
if 'development' == app.get 'env'
  app.use express.errorHandler()

# socket.io
# Thanks for `http://creator.cotapon.org/articles/node-js/%E3%80%90node-js%E3%80%91socket-io%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E7%B0%A1%E5%8D%98%E3%81%AB%E3%83%81%E3%83%A3%E3%83%83%E3%83%88%E3%82%92%E4%BD%9C%E3%82%8B%E6%96%B9%E6%B3%95`
io = require('socket.io').listen server
io.sockets.on 'connection', (socket) ->
  socket.on 'msg send', (msg) ->
    socket.emit 'msg push', msg
    socket.broadcast.emit 'msg push', msg
  socket.on 'disconnect', ->
    log 'disconnected'
