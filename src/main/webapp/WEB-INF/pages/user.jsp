

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  
  <style>
    
    .search-sec{
    padding: 2rem;
}
.search-slt{
    display: block;
    width: 100%;
    font-size: 0.875rem;
    line-height: 1.5;
    color: #0062cc;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    height: calc(3rem + 2px) !important;
    border-radius:0;
}
.btn btn-danger wrn-btn{
 background-color: #0062cc;
}
.wrn-btn{
    width: 100%;
    font-size: 16px;
    font-weight: 400;
    text-transform: capitalize;
    height: calc(3rem + 2px) !important;
    border-radius:0;
}
.row{
    margin:auto;
    width:1500px;
}

@media (min-width: 992px){
    .search-sec{
        position: relative;
        top: -114px;
        background: rgba(26, 70, 104, 0.51);
    }
}

@media (max-width: 992px){
    .search-sec{
        background: #1A4668;
    }
}
  </style>
</head>
<body>


<div class="container">
    
        
                            <button type="button" class="btn btn-danger wrn-btn" onclick="window.location.href='/lms/'" >Logout</button>
                     
         
   
</div>
<section>
    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
               <img  height ="790px" src="https://scontent.fgyd6-1.fna.fbcdn.net/v/t1.0-9/70865200_905215963190798_911243600371646464_o.jpg?_nc_cat=111&_nc_sid=dd9801&_nc_ohc=_4l5dQXwHPEAX9mq5jA&_nc_ht=scontent.fgyd6-1.fna&oh=8dfc41d22024274a785f658b4dc4011b&oe=5EDAB3DF" class="d-block w-100" alt="...">
      
            </div>
           
        </div>
       
    </div>
</section>
<section class="search-sec">
    <div class="container">
        <form action="#" method="post" novalidate="novalidate">
            
            <div class="row">
                
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <button type="button" class="btn btn-danger wrn-btn" onclick="window.location.href='/lms/allBooks'">View All Books</button>
                        </div>
                    
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                           <button type="button" class="btn btn-danger wrn-btn" onclick="window.location.href='/lms/myAccount'">User Update</button>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <button type="button" class="btn btn-danger wrn-btn"onclick="window.location.href='/lms/myOrder'">Return Book</button>
                        </div>
                         
                    </div>
                    
                
            </div>
            
        </form>
    </div>
</section>
    </body>
</html>
