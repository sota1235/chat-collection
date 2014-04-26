<?php

class Getter{
  public function get_comments() {
    $h = fopen("./data/comments.txt", "r");
    $res = "";
    if($h){
      while (($b = fgets($h)) !== false){
        $res .= "<p>".$b."</p><br />";
      }
      return $res;
    } else {
      return false;
    }
  }

  public function write_comments($comment) {
    $h = fopen("./data/comments.txt", "a");
    fwrite($h, $comment);
    return;
  }
}
?>
