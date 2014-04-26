function getDate() {
  setInterval(function(){
    $('#comments').load("index.php");
  }, 1000);
}

window.onload = getDate();
