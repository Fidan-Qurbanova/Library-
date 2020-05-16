<%-- 
    Document   : admin
    Created on : May 7, 2020, 10:32:54 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
            .row.content {height: 1500px}

            /* Set gray background color and 100% height */
            .sidenav {
                background-color: #f1f1f1;
                height: 100%;
            }

            /* Set black background color, white text and some padding */
            footer {
                background-color: #555;
                color: white;
                padding: 15px;
            }

            /* On small screens, set height to 'auto' for sidenav and grid */
            @media screen and (max-width: 767px) {
                .sidenav {
                    height: auto;
                    padding: 15px;
                }
                .row.content {height: auto;} 
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
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row content">


                <div class="col-sm-12">
                    <form class="example" action="/action_page.php" style="margin:auto; max-width:500px">
                        <input id ="search" type="text" placeholder="Search.." name="search2">
                        <button type="submit" ><i class="fa fa-search"></i></button>
                    </form>
                    <hr>

                    <div class="container">          
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Author</th>

                                    <th>Publisher</th>
                                    <th>Publish Year</th>

                                    <th>Place</th>
                                    <th>Status</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="books">

                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
        

    </body>
</html>

<script>

    getBooks();


    function getBooks() {
        var books = $("#books");

        books.html('');
        $.ajax({
            url: 'api/book/all',
            type: 'GET',
            success: function (data) {
                $.each(data, function (i, book) {
                    var tr = '<tr>';
                    tr += '<td>';
                    tr += book.id;
                    tr += '</td>';
                    tr += '<td>';
                    tr += book.name;
                    tr += '</td>';
                    tr += '<td>';
                    tr += book.author;
                    tr += '</td>';
                    tr += '<td>';
                    tr += book.publisher;
                    tr += '</td>';
                    tr += '<td>';
                    tr += book.publishYear;
                    tr += '</td>';

                    tr += '<td>';
                    tr += book.place;
                    tr += '</td>';

                    tr += '<td>';
                    tr += book.status;
                    tr += '</td>';
                    tr += '</tr>';

                    tr += '<td>';
                    tr += '<button onclick="makeOrder(\'' + book.id + '\')"><i class="fas fa-shopping-basket"></i></button>';
                    tr += '</td>';



                    books.append(tr);
                });
            }, error: function (data) {
            }
        });
    }

    $(document).ready(function () {
        $("#search").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#books tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
            });
        });
    });

    function makeOrder(id)
    {
        $.ajax({
            url: 'api/order/make/'+id,
            type: 'POST'
        });
    }
</script>
