function getDate(){
  $.get("/comments", function(data){
    var lines = data["line"];
    $("#comment").html(lines);
    lines.reverse();
    for(var i=0;i<lines.length;i++){
      var lin = lines[i];
      var main = $("<div>", {class: "comment"});
      var date = $("<span>", {class: "date"});
      var comment = $("<span>", {class: "comment"});
      date.text(line["date"]);
      comment.text(line["comment"]);
      main.append(date);
      main.append(comment);
      $("div#comment").append(main);
    }
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
