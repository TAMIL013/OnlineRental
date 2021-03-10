package uploadform;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.admintabledao;
import userview.detailget;

@WebServlet("/admintableview")
public class admintableview extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		admintabledao dao=new admintabledao();
		ArrayList<detailget> list=dao.fetch_table();
		request.setAttribute("tableview", list);
		RequestDispatcher rd=request.getRequestDispatcher("admintable.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		String id=request.getParameter("id");
		admintabledao dao=new admintabledao();
		boolean numeric = true;
		  boolean val=false;
		if(id!=null ) {
			    try {
		            Double num = Double.parseDouble(id);
		        } catch (NumberFormatException e) {
		            numeric = false;
		        }

			    if(numeric) {
			    	val=dao.delete_value(Integer.parseInt(id));
			    	
			    }
		       
		}
		if(!val)
			response.sendError(400);

	}
}
