function getData(){
  $.get("/comments", function(data){
    var lines = data['line'];
    $("div#comments").html("");
    lines.reverse();
    for(var i=0;i<lines.length;i++){
      var line = lines[i];
      var main = $("<div>", {class: "data"});
      var date = $("<span>", {class: "date"});
      var comment = $("<div>", {class: "comment"});
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
    var comment = this.comment.value;
    if(comment === "") {
      alert("無言はなしですよ");
      return;
    }
    $.post("/post", {"comment": comment});
    return false;
  });
  getData();
  setInterval("getData()", 1000);
});
