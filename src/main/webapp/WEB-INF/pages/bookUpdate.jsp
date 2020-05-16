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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
                <input type="hidden" class="form-control" id="book_id" > 
                <div class="form-group">
                    <label >Book Name:</label>
                    <input type="text" class="form-control" id="book_name">
                </div>
                <div class="form-group">
                    <label>Author :</label>
                    <input type="text" class="form-control" id="book_author">
                </div>
                <div class="form-group">
                    <label>Publisher:</label>
                    <input type="text" class="form-control" id="book_publisher">
                </div>
                <div class="form-group">
                    <label>Publish Year:</label>
                    <input type="number" class="form-control" id="book_publishYear">
                </div>
                <div class="form-group">
                    <label>Place:</label>
                    <input type="text" class="form-control" id="book_place">
                </div>
                <div class="form-group">
                    <label >Status</label>
                    <select class="form-control" id="book_status">
                        <option name="In Shelf">In Shelf</option>
                        <option name="In Use">In Use</option>
                    </select>
                </div>
                <br/>

                <button class="btn btn-info" onclick="saveBook()">Save Book</button>
                <hr>
                  <form class="example" action="/action_page.php" style="margin:auto;max-width:500px">
                        <input id ="search" type="text" placeholder="Search.." name="search2">
                        <button type="submit" ><i class="fa fa-search"></i></button>
                    </form>


                <hr>

                <div class="container">          
                    <table class="table table-striped" style="width:95%">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Author</th>

                                <th>Publisher</th>
                                <th>Publish Year</th>

                                <th>Place</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody id="books">

                        </tbody>
                    </table>
                </div>


            </div>
        </div>

    </body>
</html>

<script>

    getBooks();

    function saveBook() {
        var name = $("#book_name");
        var author = $("#book_author");
        var publisher = $("#book_publisher");
        var year = $("#book_publishYear");

        var place = $("#book_place");

        var status = $("#book_status").find('option:selected').attr("name");

        var book = {
            "id": $("#book_id").val(),
            "name": name.val(),
            "author": author.val(),
            "publisher": publisher.val(),
            "publishYear": year.val(),
            "place": place.val(),
            "status": status

        };
        $.ajax({
            url: 'api/book/add',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(book),
            success: function (data) {
                name.val('');
                author.val('');
                publisher.val('');
                year.val('');
                place.val(''),
                $("#book_status").val("In Shelf");
                $("#book_id").val(null);
                getBooks();
            }, error: function (data) {
            }
        });
    }

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


                    tr += '<td>';
                    tr += '<button onclick="fillBookInfo(\'' + book.id + '\')"><i class="fas fa-pen"></i></button>';
                    tr += '</td>';

                    tr += '<td>';
                    tr += '<button onclick="deleteBook(\'' + book.id + '\')"><i class="fas fa-trash"></i></button>';
                    tr += '</td>';


                    tr += '</tr>';
                    books.append(tr);
                });
            }, error: function (data) {
            }
        });
    }

    function fillBookInfo(id) {
  
         $.ajax({
            url: 'api/book/' + id,
            type: 'GET',
            success: function (book) {
                $("#book_id").val(book.id);
                $("#book_name").val(book.name);
               $("#book_author").val(book.author);
                $("#book_publisher").val(book.publisher);
                $("#book_publishYear").val(book.publishYear);
            
                $("#book_place").val(book.place);

                $("#book_status").val(book.status);
            }
        });
    }

    function deleteBook(id) {
       
        $.ajax({
            url: 'api/book/delete/' + id,
            type: 'DELETE',
            success: function (data) {
                getBooks();
            }, error: function (data) {
            }
        });
    }
    
  $(document).ready(function(){
  $("#search").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#books tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
    

</script>