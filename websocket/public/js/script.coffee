$ ->
  socket = io.connect 'http://localhost'
  socket.on 'connect', ->
    console.log 'connected'

  $('input:button').click ->
    msg = [$('#name').val(), $('#comment').val()]
    console.log msg[0] + msg[1]
    $('#comment').val ''
    socket.emit 'msg send', JSON.stringify msg

  socket.on 'msg push', (msg) ->
    msg = JSON.parse(msg)
    console.log msg
    date = new Date()
    main = $('<div>', {class: 'data'})
    $('<span>', {class: 'date'}).text(date).appendTo main
    $('<div>', {class: 'comment'}).text(msg[0] + ' : ' + msg[1]).appendTo main
    $('#comments').prepend main

  socket.on 'msg updateDB', (msg) ->
    console.log msg
