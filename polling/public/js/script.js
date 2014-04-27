function getDate(){
  $.get("/comments", function(data){
    $('#comment').html(data);
  });
}

$(function() {
  $.ajax({cache: false});

  $("form").submit(function(){
    document.getElementById("comment").innnerHTML = this;
    var form = this;
    var comment = this.name.comment;
    console.log(comment);
    $.post("/comment", {"comment": comment});
  });
  getDate();
  setInterval("getDate()", 1000);
})
