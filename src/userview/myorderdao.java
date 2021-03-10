package userview;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class myorderdao {
	public ArrayList<myorderget> fetch_order(String email){
		ArrayList<myorderget> order_list=new ArrayList<>();
		myorderget myorder;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rental", "root", "team25");
			String query = "SELECT * FROM renthistory where email='"+email+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);

		      while (rs.next()){
		    	myorder=new myorderget();
		    	myorder.setName(rs.getString("product"));
		    	myorder.setModel(rs.getString("model"));
		    	myorder.setDays(rs.getString("days"));
		    	myorder.setRent(rs.getString("rent"));
		    	myorder.setOrder_date(rs.getDate("order_date"));
		    	myorder.setDelivery_date(rs.getDate("delivery_date"));
		    	myorder.setReturn_date(rs.getDate("get_date"));
		    	order_list.add(myorder);
		      }
		}catch(Exception e) {
			System.out.println(e);
		}
		return order_list;
		
	}
}
