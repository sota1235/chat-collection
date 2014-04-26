<?php
require_once("./getter.php");

$h = new Getter();

$comments = $h -> get_comments();
echo $comments;
?>

