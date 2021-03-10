package uploadform;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

import database.renthistorydao;




@WebServlet("/renthistory")
public class renthistory extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("temp1");
		String model=request.getParameter("temp2");
		String days= request.getParameter("temp3");
		String rent= request.getParameter("temp4");
		String original_rent=(String) request.getParameter("temp5");
		HttpSession session=request.getSession();
		String mail=(String) session.getAttribute("username");
		String membership=(String)session.getAttribute("prime");
		
		renthistorydao rhd=new renthistorydao();
		boolean productCheck=rhd.checkProduct(name, model);
		
		int max_rent = 0,min_rent=0;
		int ori=Integer.parseInt(original_rent);
		boolean result=false;
	
		  if(membership.equals("PREMIUM")) {
			  max_rent=ori-(25*ori/100);
			  min_rent=ori-(10*ori/100);
		  }
		  else if(membership.equals("VIP")) {
			  max_rent=ori-(15*ori/100);
			  min_rent=ori-(6*ori/100); 
		  }
		  if(productCheck) {
			  if(Integer.parseInt(days)<=4 && Integer.parseInt(days)>=1 ) {
				  if(membership.equals("none") && original_rent.equals(rent)) {
					  result=rhd.uploadrenthistory(mail, name, model, days, rent,original_rent);
					  
				  }else if(Integer.parseInt(rent)>=max_rent) {
					  result=rhd.uploadrenthistory(mail, name, model, days, rent,original_rent);
					  
				  } 
			} 
		}
		  
		System.out.println(result); 
		if(!result) {
//			session.setAttribute("wrong_rent", "error");
				response.sendError(400,"Cannot get rent.Something is wrong!");
		}
	}

}
