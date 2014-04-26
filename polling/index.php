<?php
require_once("./getter.php");

$h = new Getter;
$comments = $h -> get_comments();

if(isset($_POST["comment"])) {
  $h -> write_comments($_POST["comment"]);
}
?>
<html>
  <head>
    <title>Polling Chat</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="script/script.js">
  <head>
  <body>
    <div id="wrapper">
      <form action="/index.php" method="POST">
        <input type="text" name="comment">
        <input type="submit" value="発言">
      </form>
      <div id="comment">
        <?php echo $comments; ?>
      </div>
    </div>
  </body>
</html>
