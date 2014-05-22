$ ->
  socket = io.connect 'http://localhost'
  socket.on 'connect', ->
    console.log 'connected'

  $('input:button').click ->
    msg = [$('#name'), $('#comment')]
    console.log msg[0] + msg[1]
    socket.emit 'msg send', msg.val()

  socket.on 'msg push', (msg) ->
    console.log msg[0] + msg[1]
    date = new Date()
    main = $('<div>', {class: 'data')
    $('<span>', {class: 'date'}).text(date).appendTo main
    $('<div>', {class: 'comment'}).text(msg[0] + ' : ' + msg[1]).appendTo main
    $('#comments').prepend main

  socket.on 'msg updateDB', (msg) ->
    console.log msg
