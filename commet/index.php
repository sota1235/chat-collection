<?php
require_once("./getter.php");

$h = new Getter();

if(isset($_POST["comment"])) {
  $h -> write_comments($_POST["comment"]);
}

$comments = $h -> get_comments();
?>
<html>
  <head>
    <title>Polling Chat</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="script/script.js"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  <head>
  <body>
    <div id="wrapper">
      <form action="index.php" method="POST">
        <input type="text" name="comment">
        <input type="submit" value="発言">
      </form>
      <div id="comment">
        <?php echo $comments; ?>
      </div>
    </div>
  </body>
</html>
