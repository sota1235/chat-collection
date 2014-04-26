<?php
require_once("./getter.php");

$h = new Getter;
$comments = $h -> get_comments();
?>
<html>
  <head>
    <title>Polling Chat</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="script/script.js">
  <head>
  <body>
    <div id="wrapper">
      <form action="/submit" method="POST">
        <input type="text" name="txt">
        <input type="submit" value="発言">
      </form>
      <div id="comment">
        <?php echo $comments; ?>
      </div>
    </div>
  </body>
</html>
