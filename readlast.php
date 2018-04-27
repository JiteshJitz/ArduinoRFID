<?php

include "config.php";    

    $sql = "SELECT RFIDTag FROM rfidtag WHERE id=1";
    $result = $conn->query($sql);
    $data="";
    if (mysqli_num_rows($result) > 0) {
        // output data of each row
        while($row = mysqli_fetch_assoc($result)) {
            $data = $row["RFIDTag"];
        }
    }
     $rfid = ["id"=>$data];
    echo json_encode($rfid);
    
?>