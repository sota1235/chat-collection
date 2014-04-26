function getDate(){
  $.post("/", function(data){
    $('#comment').html(data);
  });
}

$(function() {
  $.ajax({cache: false});

  $("form").submit(function(){
    $.post("/comment", {"comment": form.name.comment});
  });
  window.onload = setInterval("getDate()", 1000);
})
