package userlogin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.registrationdao;

/**
 * Servlet implementation class registration
 */
@WebServlet("/registration")
public class registration extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("fullname");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String conpassword=request.getParameter("con_pass");
		String phn=request.getParameter("number");
		String gender=request.getParameter("gender");
		String dob=request.getParameter("dob");
		String street=request.getParameter("street");
		String city=request.getParameter("city");
		String pincode=request.getParameter("pinnumber");
		String state=request.getParameter("state");
		String landmark=request.getParameter("landmark");
		registrationdao rd=new registrationdao();
		boolean form=rd.registration(name, email, password, conpassword, phn, gender, dob, city, street, landmark, pincode, state);
		HttpSession session=request.getSession();
		if(!form) {
			
			session.setAttribute("data", form);
			response.sendRedirect("registration.jsp");
		}else {
//			session.setAttribute("data", form);
			response.sendRedirect("login.jsp");
		}
		
	}

}
