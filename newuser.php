<?php
    include "config.php";
    $sql = "SELECT id, RFID, UserName, DateTimee FROM datalog";


    $data =    "SELECT datalog.idlog, datalog.RFID, user.username FROM datalog 
            JOIN user ON datalog.RFID=user.RFID;";
?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Arduino RFID</title>
  </head>
  <body>
        <div class = "container">
            <div class="card text-center" style="margin-top: 50px">
                <div class="card-header">
                    <b>Create New User</b>
                </div>
                <div class="card-body">
                    <form id="form">
                        <div class="form-group row">
                            <label for="staticEmail" class="col-sm-2 col-form-label">Username</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="username" id="user">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputPassword" class="col-sm-2 col-form-label">RFID</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="RFID" readonly name="RFID">
                            </div>
                            <div>
                                    <button  type="button" class="btn btn-info mb-2" id="readRFID">Read RFID</button>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-5">
                                <button class="btn btn-primary mb-2" type="submit" id="submituser">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-muted">
                    <div class="text-right">
                        create by lifnaja
                    </div>
                </div>
            </div>
        </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   
    <script>
    $(document).ready(function(){
        $("#readRFID").click(function() {
            $.get("readlast.php", function(data, status){
                var tag = JSON.parse(data);
                $("#RFID").attr("value",tag.id);
            });
        });

        $("form").submit(function(event){
            event.preventDefault();
            var dataGet = $(this).serialize();
            $.get("createUser.php", dataGet, function(data, status){
                if(status){
                    alert("save successful");
                    window.location.href = 'http://localhost/arduino'; 
                }
            });
        });
    });
    </script>
</body>
</html>