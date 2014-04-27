function getDate(){
  $.get("/comments", function(data){
    var lines = data['line'];
    $("div#comments").html("");
    lines.reverse();
    for(var i=0;i<lines.length;i++){
      var line = lines[i];
      var main = $("<div>", {class: "comment"});
      var date = $("<span>", {class: "date"});
      var comment = $("<span>", {class: "comment"});
      date.text(line["date"]);
      comment.text(line["comment"]);
      main.append(date);
      main.append(comment);
      $("div#comments").append(main);
    }
  });
}

$(function() {
  $.ajax({cache: false});

  $("form").submit(function(){
    var form = this;
    var comment = this.name.comment;
    $.post("/post", {"comment": comment});
    return false;
  });
  getDate();
  setInterval("getDate()", 1000);
})
