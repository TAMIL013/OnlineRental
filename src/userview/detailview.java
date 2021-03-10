package userview;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/detailview")
public class detailview extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String model=request.getParameter("model");
		detaildao dao=new detaildao();
		detailget list=dao.fetch_details(name, model);
		
		request.setAttribute("full_details", list);
		RequestDispatcher rd=request.getRequestDispatcher("details.jsp");
		rd.forward(request, response);
	}


}
