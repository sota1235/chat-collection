function getDate(){
  $.post("/", function(data){
    $('#comment').html(data);
  });
}

$(function() {
  $.ajax({cache: false});

  $("form").submit(function(){
    console.log(this);
    var form = this;
    var comment = this.name.comment;
    console.log(comment);
    $.post("/comment", {"comment": comment});
  });
  //window.onload = setInterval("getDate()", 1000);
})
