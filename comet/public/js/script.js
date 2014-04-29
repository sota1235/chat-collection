var ajax = new Ajax('/comments');

ajax.on_get = function(data) {
  var json = $.parseJSON(data);
  var lines = json.line;
  lines.reverse();
  for(var i=0;i<(lines.length < 10 ? line.length : 10);i++) {
    var main = $("<div>", {class: "data"});
    $("<span>", {class: "date"}).text(lines[i]["date"]).appendTo(main);
    $("<div>", {class: "comment"}).text(lines[i]["name"] + " : " + lines[i]["comment"]).appendTo(main);
    $("div#comments").append(main);
  };
};

var post = function(){
  var name = $("#chat #name").val();
  var comment = $("#chat #name").val();
  if(comment.length < 1) {
    alert("無言はなしよ");
    return;
  };
  ajax.post({"name": name, "comment": comment});
  $("input,text").not('input[type="button"],input[id="name"]').val('');
  return false;
};

$(function() {
  ajax.start();
  $("#chat #send").click(post);
});
