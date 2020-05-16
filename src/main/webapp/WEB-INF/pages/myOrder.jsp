<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <style>
            html{
                font-size: 20px;
            }
            body{
                background-image: url("https://marketingtechnews.net/wp-content/uploads/sites/6/2020/03/stack-of-colorful-books-education-background-back-to-school-book-picture-id690358116.jpg");
                background-size: cover;
            }
           
            .table-dark{
                height: 40%;
            }
            .check_trash{
                background-color: #454d55;
            }
        </style>
    </head>
    <body>

        <div class="container">     
             <table class="table table-striped table-dark">
                 <thead class="thead-dark">
                     <tr>
                         <th scope="col">Id</th>
                         <th scope="col">User Name</th>
                         <th scope="col">Book Name</th>
                         <th scope="col">Date</th>
                         <th scope="col">Status</th>
                         <th scope="col"></th>
                     </tr>
                 </thead>
                 <tbody id="orders">


                </tbody>
            </table>
        </div>
      

       
        <script>
            getOrders();
            
            function getOrders() {
                var orders = $("#orders");

                orders.html('');
                $.ajax({
                    url: 'api/order/all',
                    type: 'GET',
                    success: function (data) {
                        $.each(data, function (i, order) {
                            var tr = '<tr>';
                            tr += '<td>';
                            tr += order.id;
                            tr += '</td>';

                            tr += '<td>';
                            tr += order.user.fullName;
                            tr += '</td>';


                            tr += '<td>';
                            tr += order.book.name;
                            tr += '</td>';

                            tr += '<td>';
                            tr += order.date;
                            tr += '</td>';

                            tr += '<td>';
                            tr += order.status;
                            tr += '</td>';




                            tr += '<td>';
                            tr += '<button class="check_trash" onclick="deleteOrder(\'' + order.id + '\')"><i class="fas fa-trash"></i></button>';
                            tr += '</td>';
                            
                            tr += '</tr>';

                            orders.append(tr);
                        });
                    }, error: function (data) {
                    }
                });
            }


            function makeOrderReady(id) {
                $.ajax({
                    url: 'api/order/makeReady/' + id,
                    type: 'POST',
                    success: function (data) {
                        getOrders();
                    }
                });
            }

            function deleteOrder(id) {
                $.ajax({
                    url: 'api/order/delete/' + id,
                    type: 'DELETE',
                    success: function (data) {
                        getOrders();
                    }, error: function (data) {
                    }
                });
            }

        </script>
    </body>
</html>
