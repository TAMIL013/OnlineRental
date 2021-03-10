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

	

<body>
	<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
	response.setHeader("pragma", "no-cache");//HTTP 1.0 %>
	<%if(session.getAttribute("data")!=null){if((boolean)session.getAttribute("data")==false){%>
		<script > alert("Email already exists!")</script>
		<% session.removeAttribute("data");		
		session.invalidate();%>	
	<% }}%>
	<script>
		function checkpass() {

			if (document.getElementById('password') === null) {
				alert("password cannot be null");
			}
		}
		function check() {
			if (!(document.getElementById('password').value == document
					.getElementById('cpass').value)) {
				alert("password and conform password does not match");
			}

		}
		function checkphone() {
			var a = document.getElementById('number').value;
			if (a.length > 10) {
				alert("phone number should not exceed ten numbers");
			} else if (a.length < 10) {
				alert("phone number is too small");
			}
		}
		function dobcheck() {
			var d = document.getElementById('dob').value;
			if (d == '') {
				alert("select your date of birth");
			}
		}
	</script>
	<div class="container">
		<div class="jumbotron text-center">
			<h1>Registration Form</h1>
		</div>
	</div>

	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<form method="post" action="registration">
							<div class="form-group">
								<label for="name">Full name</label> <input type="text"
									class="form-control" placeholder="Enter Your Name"
									name="fullname" id="name" pattern="^[a-zA-Z.]*$" required />
							</div>

							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="email">Email Id</label> <input type="email"
											class="form-control" name="email" id="email"
											placeholder=" enter email id" pattern="^[A-Za-z0-9+_]+@(.+)$"
											required />
									</div>

								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="password">Password</label> <input type="password"
											class="form-control" name="password" id="password"
											placeholder="enter your password"
											pattern="^(?=.[0-9])(?=.[a-z])(?=.[A-Z])(?=.[@#$%^&-+=()])(?=\\S+$).{8, 20}"
											required onblur="checkpass()" />
									</div>

								</div>

							</div>

							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="confirm_password">Confirm password</label> <input
											type="password" class="form-control" name="con_pass"
											id="cpass" placeholder="Enter your password" onblur="check()"
											required />
									</div>

								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="number">Phone Number</label> 
										<input type="number"
											class="form-control" name="number" id="number"
											placeholder=" enter your Phone Number"
											pattern="^(?=.*[0-9]).{10}$" onblur="checkphone()"
											 required />
									</div>

								</div>

							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="gender">Select Gender</label>
										<div class="form-check">
											<input class="form-check-input" type="radio" name="gender"
												value="male" id="gender" required /> <label
												class="form-check-label" for="gender">Male</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio" name="gender"
												id="gender" value="female" onblur="test()" /> <label
												class="form-check-label" for="gender">Female</label>
										</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="dob">DOB</label> <input type="date"
											class="form-control" name="dob" id="dob"
											placeholder="Date Of Birth" required onblur="dobcheck()" /> <span
											class="input-group-addon"> <span
											class="glyphicon glyphicon-calendar"></span>
										</span>

									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="City">City</label> <select
											class="form-control form-select" name="city" id="city"
											required>
											<option selected></option>
											<option value="Chennai">Chennai</option>
											<option value="Coimabatore">Coimbatore</option>
											<option value="trichy">Trichy</option>
											<option value="Madurai">Madurai</option>
											<option value="Kanchipuram"></option>
										</select>
									</div>

								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="Street">Street</label> <input type="text"
											class="form-control" name="street" id="street"
											placeholder="Enter your Street" required />
									</div>

								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="Landmark">LandMark</label> <input type="text"
											class="form-control" name="landmark" id="landmark"
											placeholder="LandMark" required />
									</div>

								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label for="pincode">Pincode</label> <input type="number"
											class="form-control" name="pinnumber" id="pinnumber"
											placeholder="Enter your pincode" required />
									</div>

								</div>
							</div>
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label for="state">State:</label> <select
											class="form-control form-select" name="state" id="state"
											required>
											<option selected></option>
											<option value="Tamilnadu">Tamil Nadu</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group text-center">
								<button type="reset" class="btn btn-secondary">Reset</button>
								<button type="submit" id="registerid" class="btn btn-success">Register</button>
							</div>

						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	
</body>
</html>