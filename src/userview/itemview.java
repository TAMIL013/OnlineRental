package userview;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/itemview")
public class itemview extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cat=request.getParameter("category");
		itemdao dao=new itemdao();
		ArrayList<itemget> list_item=dao.fetch_item(cat);	
		
		request.setAttribute("details", list_item);
		RequestDispatcher rd=request.getRequestDispatcher("item.jsp");
		rd.forward(request, response);
	} 

}
