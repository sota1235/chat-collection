function insertData(data) {
  var json = $.parseJSON(data);
  var lines = json.line;
  lines.reverse();
  for(var i=0;i<(lines.length < 10 ? line.length : 10);i++) {
    var main = $("<div>", {class: "data"});
    var date = $("<span>", {class: "date"}).text(lines[i]["date"]);
    var comment = $("<div>", {class: "comment"}).text(lines[i]["name"] + " : " + lines[i]["comment"]);
    main.append(date);
    main.append(comment);
    $("div#comments").append(main);
  }
}

function getData(){
  $.get("/comments", insertData(data));
    /*
  $.ajax({
    url : "/comments",
    success : function(data){
      if(data){
        var lines = data['line'];
        $("div#comments").html(data);
        lines.reverse();
        for(var i=0;i<lines.length;i++){
          var line = lines[i];
          var main = $("<div>", {class: "data"});
          var date = $("<span>", {class: "date"}).text(line["date"]);
          var comment = $("<div>", {class: "comment"}).text(line["name"] + " : " + line["comment"]);
          main.append(date);
          main.append(comment);
          $("div#comments").append(main);
        }
      }
    },
    type : "GET",
    dateType : "json",
    timeout : "600000"
  });
  */
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
    $.post("/post", {"name": name, "comment": comment}, insertData(data));
    $("input,text").not('input[type=\"button\"],input[id=\"name\"]').val("");
    return false;
  });
  getData();
  setInterval("getData()", 1000);
});
