function getDate(){
  $.post("/", function(data){
    $('#comment').html(data);
  });
}

$(function() {
  $("form").submit(function(){
    $.post("/comment", {"comment": comment});
  });
  window.onload = setInterval("getDate()", 1000);
})
