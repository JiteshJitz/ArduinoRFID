<?php
header("Access-Control-Allow-Origin: *");
include "config.php";

    $username = (isset($_GET['username']))? $_GET['username'] : "unsuccess";
    $RFID = (isset($_GET['RFID']))? $_GET['RFID'] : "unsuccess";
    
    $sql = "INSERT INTO `user`(`RFID`, `username`) VALUES ( '$RFID', '$username')";
    $result = $conn->query($sql);

    // echo $result;
?>