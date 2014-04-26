getDate = ->
  setInterval (->
    $.post "/", (data) ->
      $('comments').html(data)
    , 1000)

window.onload = getDate
