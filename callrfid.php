<?php

include "config.php";

    $rfid = (isset($_GET['rfid']))? $_GET['rfid'] : "unsuccess";
   

    $sqlSelect = "SELECT RFID  FROM user WHERE RFID='$rfid'";
    $result = $conn->query($sqlSelect);
    $location = 1;
    if ($result->num_rows > 0) {
        $sqlInsert = "INSERT INTO `datalog`(`RFID` ,`datetimee`,`location`) VALUES ( '$rfid',NOW(),'$location')";
        $insert = $conn->query($sqlInsert);
        echo "true";
    }
    else{
        echo "false";
    }
   
?>