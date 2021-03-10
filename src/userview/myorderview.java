package userview;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/myorderview")
public class myorderview extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("username");
		
		myorderdao dao=new myorderdao();
		ArrayList<myorderget> order_list=dao.fetch_order(email);
		request.setAttribute("myorderview", order_list);
		RequestDispatcher rd=request.getRequestDispatcher("myorder.jsp");
		rd.forward(request, response);
	}

}
