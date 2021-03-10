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
</head>
	<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
	response.setHeader("pragma", "no-cache");//HTTP 1.0 %>
	<%if(session.getAttribute("wronguser")!=null){%>
		<script > alert("Invalide Email or Password")</script>	
		<% session.removeAttribute("wronguser");		
		%>	
	<% }%>


<body>
    <div class="container" >
            <form action="login" method="post" class="border " style=" margin:10% 25%;width:50%; ">
                <h1 class="text-center display-6 mb-3">LOGIN</h1>
                <div class="form-floating mb-3 ps-3 pe-3">
                    <input type="text" class="form-control " id="floatingInput" name="usrname" placeholder="name@example.com" required>
                    <label for="floatingInput" class="ps-4">Email address</label>
                    <div class="invalid-feedback" id="alert1">hello	</div>
                  </div>
                  <div class="form-floating mb-3 ps-3 pe-3">
                    <input type="password" class="form-control" id="floatingPassword" name="psw"placeholder="Password" required>
                    <label for="floatingPassword" class="ps-4">Password</label>
                    <div class="invalid-feedback" id="alert1"></div>
                  </div>
                <div class="form-group mb-3 ps-3">
                    <button type="submit"  class="btn btn-success   " >submit</button>
                </div>
                <p class="text-center ">Not Registered?<a href="registration.jsp" class="text-success ps-2" style="text-decoration: none;">Create an account</a></p>
            </form>
        </div>
  		<script type="text/javascript">
  		
  		</script>

</html>