function getDate(){
  $.post("index.php");
}

while(true){
  setTimeout(getDate, 1000);
}
