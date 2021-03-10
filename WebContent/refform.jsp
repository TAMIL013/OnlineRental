<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%> --%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "rental";
String userid = "root";
String password = "team25";
Connection connection = null;
PreparedStatement pstmt = null;
Statement statement = null;
ResultSet rs = null;
String name = request.getParameter("name");
String email = request.getParameter("email");
String pass = request.getParameter("pass");
String cpass = request.getParameter("cpass");
String num = request.getParameter("num");
String gender = request.getParameter("gender");
String dob = request.getParameter("dob");
String city = request.getParameter("city");
String street = request.getParameter("street");
String landmark = request.getParameter("landmark");
String pinnumber = request.getParameter("pinnumber");
String state = request.getParameter("state");
%>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionUrl + database, userid, password);
	statement = connection.createStatement();
	rs = statement.executeQuery("select * from register where email='" + email + "'");

	if (rs.next()) {

		out.println("email id already exits");
	} else {
		pstmt = connection.prepareStatement(
		"insert into register(name,email,password,con_password,phone_number,gender,dob,city,street,landmark,pinnumber,state) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?)");
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		pstmt.setString(3, pass);
		pstmt.setString(4, cpass);
		pstmt.setString(5, num);
		pstmt.setString(6, gender);
		pstmt.setString(7, dob);
		pstmt.setString(8, city);
		pstmt.setString(9, street);
		pstmt.setString(10, landmark);
		pstmt.setString(11, pinnumber);
		pstmt.setString(12, state);
		int count = pstmt.executeUpdate();
		out.println("Registration Successful");

		connection.close();
	}
} catch (Exception ex) {
	ex.printStackTrace();
	out.println("error inserting data");
}
%>