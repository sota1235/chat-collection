getDate = ->
  setInterval (->
    $('comments').html $.ajax
        type: "POST"
        url: "/comment"
  ), 1000

window.onload = getDate
