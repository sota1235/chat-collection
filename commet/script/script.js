function getDate() {
  setInterval(function(){
    $('#comment').load("comments.php");
  }, 1000);
}

window.onload = getDate();
