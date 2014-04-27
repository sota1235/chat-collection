function getData(){
  $.ajax({
    type: "GET",
    url: "/comments",
    async: false,
    dateType: "json",
    timeout : 60000
  }).done(function(data){
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

  $("#chat #send").click(function(){
    var name = $("#chat #name").val();
    var comment = $("#chat #comment").val();
    if(comment === "") {
      alert("無言はなしですよ");
      return;
    }
    $.post("/post", {"name": name, "comment": comment});
    $("input,text").not('input[type=\"submit\"],input[name=\"name\"]').val("");
    return false;
  });
  getData();
  setInterval("getData()", 1000);
});
