<%-- 
    Document   : viewAllBooks
    Created on : May 8, 2020, 8:27:02 AM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">

        <style>
            .container-fluid{
                text-align: center;
            }
            #mySearch {
                width: 100%;
                font-size: 18px;
                padding: 11px;
                border: 1px solid #ddd;
            }
            body {
                font-family: Arial;

            }

            * {
                box-sizing: border-box;
            }
            th{
                text-align: center;
            }

            form.example input[type=text] {
                padding: 10px;
                font-size: 17px;
                border: 1px solid grey;
                float: left;
                width: 80%;
                background: #f1f1f1;
            }

            form.example button {
                float: left;
                width: 20%;
                padding: 10px;
                background: #2196F3;
                color: white;
                font-size: 17px;
                border: 1px solid grey;
                border-left: none;
                cursor: pointer;
            }

            form.example button:hover {
                background: #0b7dda;
            }

            form.example::after {
                content: "";
                clear: both;
                display: table;
            }
            .col-sm-9{
                margin-top: 50px;

                margin-left: 10%;
            }
        </style>
    </head>
    <body>

        <div class="container-fluid">
            <div class="row content">

            </div>

            <div class="col-sm-9">
                <div class="form-group">
                    <label>UserName:</label>
                <input type="text" class="form-control" id="user_id" > 
                </div>
                <div class="form-group">
                    <label >User Full Name:</label>
                    <input type="text" class="form-control" id="user_fullname">
                </div>
                <div class="form-group">
                    <label>Password :</label>
                    <input type="password" class="form-control" id="user_password">
                </div>

               <%--
                <div class="form-group">
                    <label>Role :</label>
                    <select class="form-control" id="user_role" disabled="true">
                        <option name="User">User</option>
                        <option name="Admin">Admin</option>
                    </select>

                </div>
--%>
                <br/>

                <button class="btn btn-info" onclick="save()">Save</button>


                <hr>
               
              

            </div>
        </div>

    </body>
</html>

<script>

    getUsers();
 
    function save() {
        var username=$("#user_id");
        var name = $("#user_fullname");
        var password = $("#user_password");

        var user = {
            "username": $("#user_id").val(),
            "fullName": name.val(),
            "password": password.val(),
            "role": "User"
            


        };
        $.ajax({
            url: 'api/user/add',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(user),
            success: function (data) {
                username.val('');
                name.val('');
                password.val('');
                $("#user_role").val("User");
                $("#user_id").val(null);
                getUsers();
            }, error: function (data) {
            }
        });
    }

      function getUsers() {
        var users = $("#users");

        users.html('');
        $.ajax({
            url: 'api/user/all',
            type: 'GET',
            success: function (data) {
                $.each(data, function (i, user) {
                    var tr = '<tr>';
                    tr += '<td>';
                    tr += user.username;
                    tr += '</td>';

                    tr += '<td>';
                    tr += user.fullName;
                    tr += '</td>';

                    tr += '<td>';
                    tr += user.role;
                    tr += '</td>';

                    tr += '<td>';
                    tr += '<button onclick="fillUserInfo(\'' + user.username + '\')"><i class="fas fa-pen"></i></button>';
                    tr += '</td>';
                    
                    tr += '<td>';
                    tr += '<button onclick="deleteUser(\'' + user.username + '\')"><i class="fas fa-trash"></i></button>';
                    tr += '</td>';


                    tr += '</tr>';
                    users.append(tr);
                });
            }, error: function (data) {
            }
        });
    }


  
 $(document).ready(function(){
  $("#search").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#users tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});

</script>