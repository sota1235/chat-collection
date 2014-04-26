<?php

class Getter{
  public $h = fopen("./data/comments.txt", "r+");

  public function get_comments() {
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

?>
