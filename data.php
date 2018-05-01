<?php

    $conn = mysqli_connect("localhost","root","","arduino");

    $rfid = (isset($_GET['rfid']))? $_GET['rfid'] : "unsuccess";
    $location = (isset($_GET['location']))? $_GET['location'] : "unsuccess";

        $sqlInsert = "INSERT INTO `data`(`RFID`, `location` ,`datetime`) VALUES ( '$rfid', '$location',NOW())";
        $insert = $conn->query($sqlInsert);
      
?>