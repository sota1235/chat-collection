function getDate(){
  $.post("/", function(data){
    $('#comment').html(data);
    console.log(data);
  });
}

window.onload = setInterval("getDate()", 1000);
