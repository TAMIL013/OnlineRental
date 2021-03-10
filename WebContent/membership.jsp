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
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
response.setHeader("pragma", "no-cache");//HTTP 1.0
if (session.getAttribute("username") == null) {
	response.sendRedirect("login.jsp");
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
                        <p class="text-dark">Home</p>
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
                <a class="nav-link pe-1 " href="home.jsp" >Home</a>
              <a class="nav-link pe-1 active" href="membership.jsp">Membership</a>
               <a class="nav-link pe-1" href="myorderview">Your Order</a> 
              
              <form action="logout"  method="post"><button type="submit" class="btn  border border-0 mt-1 pe-1"
                style="color:lightgrey;">logout</button></form>
            </div>
          </div>
        </div>
      </nav>
    <div class="container-lg " style="height: 100px;">
	
    </div>
   
  <div class="container bg-secondary mb-3"style="height:50px" id="headdiv">
    <h5 class=" text-white pt-2" >YOU HAVE <%=session.getAttribute("prime")%> MEMBERSHIP!</h5>
  </div>
  <div class="container border " id="wholediv">
   
      <div class="row" >
        <h1 class="text-center"> MEMBERSHIP</h1>
      </div>
      <div class="row">
        <div class="col-6">
         <form  action="membership?mem=VIP" method="POST">
          <div class="col-9 border m-3">
            <h3 class="m-3"  >VIP</h3>
            <div class="form-group">
              <label for="exampleInputName " class="ms-3">Rs.399/year</label>
            </div>
            <div class="form-group m-3">
              <p> pay just Rs.399 per month and get chance to use lucky charm offers thrice(3) for each time you rent a
                product
              </p>
            </div>
            <button type="submit"style="width:80%" class="btn btn-success ms-3 mb-3">get VIP</button>
          </div>
          
		</form>
        </div>
        <div class="col-6">
        <form  action="membership?mem=PREMIUM" method="POST">
          <div class="col-9 border m-3">
            <div class="form-group">
            
              <h3 class="m-3" >PREMIUM </h3>
              <label for="exampleInputName" class="ms-3">Rs.699/year</label>
            </div>
            <div class="form-group m-3">
              <p>pay just Rs.699 per year and get chance to use lucky charm offers quince(5) for each time you rent a
                product </p>
            </div>
            <button type="submit" style="width:80%" class="btn btn-success ms-3 mb-3" >get PREMIUM</button>
          </div>
		</form>
        </div>
        </div>
 
</div>

<script>
var prime="<%=session.getAttribute("prime")%>";
if(prime==="none"){

	  document.getElementById("headdiv").style.pointerEvents="none";
	  document.getElementById("headdiv").style.opacity="0.4";
}else{
	 document.getElementById("wholediv").style.pointerEvents="none";
	  document.getElementById("wholediv").style.opacity="0.4";
}
</script>



    
</body>

</html>