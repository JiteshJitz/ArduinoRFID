<?php
header("Access-Control-Allow-Origin: *");

    
    $RFID = (isset($_GET['RFID']))? $_GET['RFID'] : "unsuccess";
    
    $conn = mysqli_connect("localhost","root","","arduino");
    $sql = "UPDATE rfidtag SET RFIDTag='$RFID' WHERE id=1";
    $result = $conn->query($sql);

?>