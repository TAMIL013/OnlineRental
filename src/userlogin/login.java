package userlogin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.userlogincheckdao;


@WebServlet("/login")
public class login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname=request.getParameter("usrname");
		String pass=request.getParameter("psw");
		userlogincheckdao ul=new userlogincheckdao();
		userlogincheckdao val=ul.checklogin(uname, pass);
//		System.out.print(val);
		if(val==null) { //check prime
			HttpSession session=request.getSession();
			session.setAttribute("wronguser", "wrongid");
			response.sendRedirect("login.jsp");
		}
		else {
			HttpSession session=request.getSession();
			session.setAttribute("username", uname);
			session.setAttribute("prime", val.getMembership()); //for prime
			session.setAttribute("fullname", val.getFullname());  //full name
			request.setAttribute("MailforMem", uname);
			response.sendRedirect("home.jsp");
		}
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
