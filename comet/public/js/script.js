function insertData(data) {
  var json = $.parseJSON(data);
  var lines = json.line;
  lines.reverse();
  for(var i=0;i<(lines.length < 10 ? line.length : 10);i++) {
    var main = $("<div>", {class: "data"});
    $("<span>", {class: "date"}).text(lines[i]["date"]).appendTo(main);
    $("<div>", {class: "comment"}).text(lines[i]["name"] + " : " + lines[i]["comment"]).appendTo(main);
    $("div#comments").append(main);
  }
}

function getData(){
  $.get("/comments", function(data){
    insertData(data);
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
    $.post("/post", {"name": name, "comment": comment}, function(data){
      insertData(data);
    });
    $("input,text").not('input[type=\"button\"],input[id=\"name\"]').val("");
    return false;
  });
  getData();
  setInterval("getData()", 1000);
});
