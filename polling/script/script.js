function getDate() {
  setInterval(function(){
    $('#comments').load("comments.php");
  }, 1000);
}

window.onload = getDate();
