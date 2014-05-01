var ajax = new Ajax('/comments');

var insert_json = function(data) {
  var lines = $.parseJSON(data).line.reverse();
  $("div#comments").html("");
  for(var i=0;i<(lines.length < 10 ? lines.length : 10);i++) {
    var main = $("<div>", {class: "data"});
    $("<span>", {class: "date"}).text(lines[i]["date"]).appendTo(main);
    $("<div>", {class: "comment"}).text(lines[i]["name"] + " : " + lines[i]["comment"]).appendTo(main);
    $("div#comments").append(main);
  };
};

ajax.on_get = insert_json;

var post = function(){
  var name = $("#chat #name").val();
  var comment = $("#chat #comment").val();
  if(comment.length < 1) {
    alert("無言はなしよ");
    return;
  };
  ajax.post({"name": name, "comment": comment});
  $("input,text").not('input[type="button"],input[id="name"]').val('');
  return false;
};

$(function() {
  var json = "";
  ajax.start();
  $.get('/first_comments', function(data){
    insert_json(data);
  });
  $("#chat #send").click(post);
});
