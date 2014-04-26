function getDate() {
  setInterval(function(){
    $.post("index.php");
  }, 1000);
}

window.onload = getDate();
