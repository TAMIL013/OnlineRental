<%@page import="userview.detailget"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	
</head>

<body>
	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
	response.setHeader("pragma", "no-cache");//HTTP 1.0
	if (session.getAttribute("username") == null) {
		response.sendRedirect("login.jsp");
	}  if (request.getAttribute("full_details") == null) {
		response.sendRedirect("item.jsp");
	}
	 if(session.getAttribute("wrong_rent")!=null){
		%><script > alert("Cannot get rent.Something is wrong!")</script>	
		<% session.removeAttribute("wrong_rent");
	}
	detailget dg = (detailget) request.getAttribute("full_details");
	%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous">
		
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
   
	<!-- slide show -->
	<div class="container-lg border">

		<div id="slideshow" class="carousel carousel-dark slide "
			data-bs-ride="carousel">
			<div class="carousel-inner  w-50 " style="margin-left: 25%;">
				<div class="carousel-item active ">
					<img class="d-block w-100" src="<%=dg.getUrl1()%>" alt="image">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="<%=dg.getUrl2()%>" alt="image">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="<%=dg.getUrl3()%>" alt="image">
				</div>

			</div>
			<a href="#slideshow" class="carousel-control-prev" role="button"
				data-bs-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span>

			</a> <a href="#slideshow" class="carousel-control-next" role="button"
				data-bs-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span>
			</a>
		</div>
	</div>
	<div class="container-lg  border border-gray mt-1">
		<div class="row">
			<div class="col-3 border-end border-gray">
				<div class="row text-center mt-3">
					<p><%=dg.getRefund()%></p>
				</div>
				<div class="row text-center border-top">
					<p>Refundable Deposit</p>
				</div>
			</div>
			<div class="col-6  border-end ">
				<div class="row  text-center">
					<p><%=dg.getName()%></p>
				</div>
				<div class="row">
					<div class="form-floating">

						<select class="form-select" id="selectdate"
							onchange="getselected();" required>

							<option value="1" selected>1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select> <label for="selectdate">How long?</label>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="row text-center mt-3">
					<p id="bargainid"><%=dg.getRent()%></p>
				</div>
				<div class="row text-center border-top ">
					<p>Rent Per Day</p>
				</div>
			</div>
		</div>
	</div>

	<!-- details -->

	<div class="container-lg border ">
		<div class="col mb-3">
			<div class="row" style="height: 4rem;">
				<h6 class="pt-3">Details</h6>
			</div>
			<div class="row" style="height: 4rem;">
				<div class="col-6 " style="background-color: whitesmoke;">
					<h6 class="mt-3 text-center">Original Cost</h6>
				</div>
				<div class="col" style="background-color: white;">
					<h6 class="mt-3 ps-5"><%=dg.getCost()%></h6>
				</div>
			</div>
			<div class="row" style="height: 4rem;">
				<div class="col-6" style="background-color: white;">
					<h6 class="mt-3 text-center">Model Number</h6>
				</div>
				<div class="col" style="background-color: whitesmoke;">
					<h6 class="mt-3 ps-5"><%=dg.getModel()%></h6>
				</div>
			</div>
			<div class="row" style="height: 4rem;">
				<div class="col-6 " style="background-color: whitesmoke;">
					<h6 class="mt-3 text-center">Manufacturer</h6>
				</div>
				<div class="col" style="background-color: white;">
					<h6 class="mt-3 ps-5"><%=dg.getManfu()%></h6>
				</div>
			</div>
			<div class="row" style="height: 4rem;">
				<div class="col-6" style="background-color: white;">
					<h6 class="mt-3 text-center">Dimension(H x L x W)</h6>
				</div>
				<div class="col" style="background-color: whitesmoke;">
					<h6 class="mt-3 ps-5"><%=dg.getDimension()%></h6>
				</div>
			</div>
			<div class="row" style="height: 4rem;">
				<div class="col-6 " style="background-color: whitesmoke;">
					<h6 class="mt-3 text-center">Weight</h6>
				</div>
				<div class="col" style="background-color: white;">
					<h6 class="mt-3 ps-5"><%=dg.getWg()%></h6>
				</div>
			</div>
			<div class="row" style="height: 4rem;">
				<div class="col-6" style="background-color: white;">
					<h6 class="mt-3 text-center">Color</h6>
				</div>
				<div class="col" style="background-color: whitesmoke;">
					<h6 class="mt-3 ps-5"><%=dg.getClr()%></h6>
				</div>
			</div>
		</div>
	</div>
	<div class="container-lg mt-3" style="height: 70px;">

		<h1 id="getprimeid"><%=(String) session.getAttribute("prime")%></h1>
	</div>
	<!-- bargain nd get -->
	<div class="container-lg border fixed-bottom mt-3"
		style="background-color: #85c480; height: 70px;">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<div class="btn-group mt-3" style="width: 100%;" role="group"
					aria-label="Basic mixed styles example">
					<button type="button" class="btn btn-sm btn-secondary"
						id="bargainbtnid" onclick="bargain()">Lucky Charm</button>
					<button type="button" class="btn btn-sm btn-success "
						id="rentbtnid" data-bs-toggle="modal" data-bs-target="#modal-form"
						>Get Rent</button>

				</div>
			</div>
			<div class="col-3"></div>
		</div>
	</div>




	</div>
	</div>
	<!--  -->

	<!-- <h1>jQuery Get Tag Value</h1>

	<p>para</p>

	<div class="class1">hello</div>

	<div id="id1">hai</div>
	<button type="button" class="delete">Register</button> -->

	<!-- faded booking -->
	<div class="modal fade" id="modal-form" tabindex="-1"
		aria-labelledby="modal-group-name" aria-hidden="false ">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<p class="modal-title" id="modal-group-name"></p>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="renthistory" method="POST">
						<table class="table">
						<tbody>
                                        <tr>
                                          <td><p>Product Name</p></td>
                                          <td><h6 id="nameid"><%=dg.getName() %></h6></td>
                                        </tr>
                                        <tr>
                                          <td><p>Model Number</p></td>
                                         <td><h6 id="modelid"><%=dg.getModel() %></h6></td>
                                        </tr>
                                        <tr>
                                          <td><p>No of days</p></td>
                                         <td><h6 id="totaldaysid"></h6></td>
                                        </tr>
                                        <tr>
                                          <td><p>Rent/Day</p></td>
                                         <td><h6 id="rentperdayid"></h6></td>
                                        </tr>
                                        <tr>
                                          <td><p>Refundable Deposit</p></td>
                                         <td><h6 ><%=dg.getRefund() %></h6></td>
                                        </tr>
                                        <tr>
                                          <td><p>Original Cost</p></td>
                                         <td><h6><%=dg.getCost() %></h6></td>
                                        </tr>
                                      </tbody>  
                                </table>
						</table>
						<button type="button" class="btn btn-secondary "
							data-bs-dismiss="modal" id="closecreatemodal">Close</button>
						<button type="button" id="fade_sumbit_id" class="btn btn-success">Submit</button>
						<!-- <input type="button" class="btn btn-primary btn-sm" onclick="getgroupdetails()" value="Submit form" data-bs-dismiss="modal"> -->

					</form>
				</div>



			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#fade_sumbit_id").click(function() {
				
				var temp1 = $('#nameid').html();
			
				var temp2 = $('#modelid').html();
			
				var temp3 = $('#totaldaysid').html();
			
				var temp4 = $('#rentperdayid').html();
				
				var temp5 = "<%=dg.getRent()%>";
				
				$.ajax({
					url : "renthistory",
					type : "post",
					data : {
						temp1 : temp1,
						temp2 : temp2,
						temp3 : temp3,
						temp4 : temp4,
						temp5 : temp5,
					},
					
					success : function(data) {
						var a = data;
					window.location.href="/BasicServlet/home.jsp"
					},
					error : function(a,status,message){
						alert(status+":Cannot get rent.Something is wrong! ")
					}
				}); 
			});
		});
	</script>
	
	<script>
	var scrt_var = 10; 
	document.getElementById("totaldaysid").innerHTML=document.getElementById("selectdate").value;
	
	function getselected(){
		document.getElementById("totaldaysid").innerHTML=document.getElementById("selectdate").value;
		scrt_var = document.getElementById("selectdate").value;
	}	
	i = Number(document.getElementById("bargainid").innerHTML);
	document.getElementById("rentperdayid").innerHTML=i;
	

	var prime="<%=(String) session.getAttribute("prime")%>";

		if (prime == "VIP")
			var bargain_count = 3;
		else if (prime == "PREMIUM")
			var bargain_count = 5;
		const arr = [ 2, 3, 4, 5 ];

		if (prime == "none") {
			document.getElementById("bargainbtnid").disabled = true;
			console.log("hello");
		}

		function bargain() {

			bargain_count = bargain_count - 1;
			i = Number(document.getElementById("bargainid").innerHTML);
			d = Number(arr[Math.floor(Math.random() * arr.length)]);
			discount = Number(i - (d / 100 * i));

			document.getElementById("bargainid").innerHTML = discount
					.toFixed(0);
			document.getElementById("rentperdayid").innerHTML = discount
					.toFixed(0);
			if (bargain_count == 0) {
				document.getElementById("bargainbtnid").disabled = true;

			}
		}
		
	</script>
	

</body>
</html>