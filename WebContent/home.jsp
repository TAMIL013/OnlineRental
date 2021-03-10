<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<!-- icon -->
	
</head>

<body>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
		response.setHeader("pragma","no-cache");//HTTP 1.0
		if(session.getAttribute("username")==null){
			response.sendRedirect("login.jsp");
		}
		if(session.getAttribute("rent_accept")!=null){
			%><script > alert("Order Successfully")</script>	
			<% session.removeAttribute("rent_accept");
		}
		
	%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous">
    </script>
     <script src="https://kit.fontawesome.com/52c7481b11.js" crossorigin="anonymous"></script>
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	 <!-- end icon -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-success fixed-top">
        <div class="container-fluid">
            <ul class="nav  ">
			<p class="navbar-brand text-dark fw-bold fst-italic" href="#">hello <%=session.getAttribute("fullname") %> <i class="bi bi-emoji-smile fw-bold"></i></p>        
               
                <li class="nav-item"><a class="nav-link " href="home.jsp">
                        <p class="text-white">Home</p>
                    </a></li>
               <li class="nav-item"><a class="nav-link " href="myorderview">
                        <p class="text-dark">Your Order</p>
                    </a></li> 
            </ul>
          
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav text-end ">
                <a class="nav-link pe-1 active" href="home.jsp" >Home</a>
              <a class="nav-link pe-1" href="membership.jsp">Membership</a>
               <a class="nav-link pe-1" href="myorderview">Your Order</a> 
              
              <form action="logout"  method="post"><button type="submit" class="btn  border border-0 mt-1 pe-1"
                style="color:lightgrey;">logout</button></form>
            </div>
          </div>
        </div>
      </nav>
    <div class="container-lg " style="height: 100px;">
	
    </div>
   
    <div class="container-lg">
        <div class="row">
            <div class="col">
                <a style="text-decoration: none;" href="itemview?category=Celebration">
                    <div class="card Homecard" style="width: 13rem;">
                        <div class="card-body">
                            <figure class="figure  paddingleft">
                                <img style="height: 7rem; width:7rem;" src="image/png/001-party.png"
                                    class="figure-img img-fluid rounded" alt="">
                                <figcaption class="figcaption text-dark text-center">Celebration</figcaption>
                            </figure>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col">
                <a style="text-decoration: none;" href="itemview?category=Cinematography">
                    <div class="card Homecard" style="width: 13rem;">
                        <div class="card-body">
                            <figure class="figure  paddingleft">
                                <img style="height: 7rem; width:7rem;" src="image/png/005-video-camera.png"
                                    class="figure-img img-fluid rounded" alt="">
                                <figcaption class="figcaption text-dark text-center">Cinematography</figcaption>
                            </figure>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col">
                <a style="text-decoration: none;" href="itemview?category=Instruments">
                    <div class="card Homecard" style="width: 13rem;">
                        <div class="card-body">
                            <figure class="figure  paddingleft">
                                <img style="height: 7rem; width:7rem;"
                                    src="image/png/002-music-guitar-black-silhouette.png"
                                    class="figure-img img-fluid rounded" alt="">
                                <figcaption class="figcaption text-dark text-center">Instruments</figcaption>
                            </figure>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col">
                <a style="text-decoration: none;" href="itemview?category=Tool Kit">

                    <div class="card Homecard" style="width: 13rem;">
                        <div class="card-body">
                            <figure class="figure  paddingleft">
                                <img style="height: 7rem; width:7rem;" src="image/png/006-hand-tools.png"
                                    class="figure-img img-fluid rounded" alt="">
                                <figcaption class="figcaption text-dark text-center">Tool Kit</figcaption>
                            </figure>
                        </div>
                    </div>
                </a>
            </div>
        </div>
       

    </div>

    <!-- <div class="card " style="width: 14rem;">
        <img  class="img-fluid img-thumbnail card-img-top" src="image/png/001-party.png" alt="img">
        <div class="card-body">
            <h5 class="card-title">Celebration</h5>
        </div>
    </div> -->
   
</body>


</html>