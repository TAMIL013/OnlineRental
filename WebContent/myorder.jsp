<%@page import="userview.myorderget"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
  <title>Document</title>
</head>

<body>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous">
  </script>
	<%  
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
	response.setHeader("pragma", "no-cache");//HTTP 1.0
	if (session.getAttribute("username") == null) {
		response.sendRedirect("login.jsp");
	}  
	
	ArrayList<myorderget> order_list=(ArrayList<myorderget>) request.getAttribute("myorderview"); 
	%>
	
	 <script src="https://kit.fontawesome.com/52c7481b11.js" crossorigin="anonymous"></script>
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	 <!-- end icon -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-success fixed-top">
        <div class="container-fluid">
            <ul class="nav  ">
			<p class="navbar-brand text-dark fw-bold fst-italic" href="#">hello <%=session.getAttribute("fullname") %> <i class="bi bi-emoji-smile fw-bold"></i></p>        
               
                <li class="nav-item"><a class="nav-link " href="home.jsp">
                        <p class="text-dark">Home</p>
                    </a></li>
               <li class="nav-item"><a class="nav-link " href="myorderview">
                        <p class="text-white">Your Order</p>
                    </a></li> 
            </ul>
          
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav text-end ">
                <a class="nav-link pe-1 " href="home.jsp" >Home</a>
              <a class="nav-link pe-1" href="membership.jsp">Membership</a>
               <a class="nav-link pe-1 active" href="myorderview">Your Order</a> 
              
              <form action="logout"  method="post"><button type="submit" class="btn  border border-0 mt-1 pe-1"
                style="color:lightgrey;">logout</button></form>
            </div>
          </div>
        </div>
      </nav>
    <div class="container-lg " style="height: 100px;">
	
    </div>
   
 <div class="container ">
        <table class="table table-borderless">
            <tbody>
            <%for(myorderget ord: order_list){ %>
                <tr>
                    <td>
                        <div class="card rounded-top border border-white bg-success" >
                            <div class="card rounded-top-5 mt-2 pe-1">

                                <div class="card-body border border-white">
                                    <div class="row">
                                        <div class="col-9"><h4 class="card-title"><%=ord.getName()%><small class="fs-6 text-secondary"> <%=ord.getModel() %></small> </h4></div>
                                        <div class="col"> <p class="card-title">$<%=ord.getRent() %> /<small class="fs-6 text-secondary">day</small></p></div>
                                    </div>
                                    <div class="row pt-3 " >
                                        <div class="col">
                                            <p class="card-text"><small class="text-muted">Order on: <%=ord.getOrder_date() %></small></p>
                                        </div>
                                        <div class="col">
                                            <p class="card-text"><small class="text-success">Delivery on: <%=ord.getDelivery_date() %></small></p>
                                        </div>
                                        <div class="col">
                                            <p class="card-text"><small class="text-success">Return on: <%=ord.getReturn_date() %></small></p>
                                        </div>
                                    </div>
                                  </div>
                            </div>
                        </div>   
                    </td>
                </tr>
            <%} %>
            </tbody>
        </table>
    </div>
</body>

</html>