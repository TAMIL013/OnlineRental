<%@page import="userview.detailget"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
   <%
	/* response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
	response.setHeader("pragma", "no-cache");//HTTP 1.0
	if (session.getAttribute("username") == null) {
		response.sendRedirect("login.jsp");
	}
	else if(request.getAttribute("details")==null){
		response.sendRedirect("home.jsp");
	} */
	 ArrayList<detailget> list = (ArrayList<detailget>) request.getAttribute("tableview");
		 /* for (itemget i : item_list)
			System.out.println(i);  */
	%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous">
    </script>
        <div class="container mb-1 border border-gray  border-bottom-0 fixed-top bg-white" style="height: 70px;">
        <ul class="nav nav-tabs  mt-4">
            <li class="nav-item"><a class="nav-link " href="adminUpload.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link  " href="">Product</a></li>
            <li class="nav-item"><a href="admintableview" class="nav-link active">Table View</a></li>
        </ul>
    </div>
    
	<div class="container border border-top-0 fixed-top bg-white" style="margin-top: 75px" >
	
       <form id="form1" name="form1" method="post">
          <input type="text" name="idvalue" id="key" class="ms-5">
          <button type="button" id="item_del_id" class="btn btn-sm btn-outline-danger ms-3 mb-1">Delete</button>
       </form>
	</div>
	<div class="container " style="height:125px"></div>
	<div class="container table-responsive table-bordered">
	
    <table class="table  table-bordered">
      <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Category</th>
      <th scope="col">Product Name</th>
      <th scope="col">Price</th>
      <th scope="col">Refund Advance</th>
       <th scope="col">Rent Per Day</th>
       <th scope="col">Product Dimension</th>
       <th scope="col">Model Number</th>
       <th scope="col">Color</th> 
       <th scope="col">Weight</th>    
       <th scope="col">Manufacturer</th>             
    </tr>
  </thead>
  <tbody>
	<% for(detailget dg: list) {%>
	    <tr>
	       <th scope="row"><%=dg.getId() %></th>
	       <td><%=dg.getCat() %></td>
	       <td><%=dg.getName() %></td>
	       <td><%=dg.getCost() %></td>
	       <td><%=dg.getRefund() %></td>
	       <td><%=dg.getRent() %></td>
	       <td><%=dg.getDimension() %></td>
	       <td><%=dg.getModel() %></td>
	       <td><%=dg.getClr() %></td>
	       <td><%=dg.getWg() %></td>
	       <td><%=dg.getManfu() %></td>
	       
	    </tr>
	<%} %>
  </tbody>
</table>
           
       
	</div>
         






</body>
<script>
// crating new click event for save button
	$(document).ready(function() {
	// crating new click event for save button
	$("#item_del_id").click(function() {
	var id = $('#key').val();
	$.ajax({
	url: "admintableview",
	type: "post",
	data: {
	id : id,
	},
	success : function(data){
	alert("Item Successfully deleted");
	location.reload();
	},
	error : function(status){
		alert(status +":Cannot delete. Something Wrong!");location.reload();
	}
	});
	});
	});
</script>
</html>