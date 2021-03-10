package uploadform;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.registrationdao;

/**
 * Servlet implementation class membership
 */
@WebServlet("/membership")
public class membership extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String mail=(String) session.getAttribute("username");
		String membership=request.getParameter("mem");
		registrationdao rd=new registrationdao();
		boolean value=rd.membershipupdate(membership, mail);
		if(value) {
			
			session.removeAttribute("username");
			session.removeAttribute("prime");
			session.invalidate();
			response.sendRedirect("login.jsp");
		}
		
	}

}
