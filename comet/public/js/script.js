function getData(){
  $.ajax({
    url : "/comments",
    async : false,
    success : function(data){
      if(data){
        var lines = data['line'];
        $("div#comments").html("");
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
    error : function(req, stat, e){
      setTimeout(getData(), 100000);
    },
    complete : function(e){
    },
    type : "GET",
    dateType : "json",
    timeout : "600000"
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
    $("input,text").not('input[type=\"button\"],input[id=\"name\"]').val("");
    return false;
  });
  getData();
  setInterval("getData()", 1000);
});
