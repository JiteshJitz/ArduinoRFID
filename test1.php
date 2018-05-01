<?php
    $name = $_GET['name'] ;
     $age = $_GET['age'] ;
    // echo "hello ".$name;
    //
    $data = ["name"=>$name,"age"=>$age];
    echo json_encode($data);
    
?>