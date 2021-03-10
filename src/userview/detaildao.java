package userview;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class detaildao {
	public detailget fetch_details(String Pname,String model) {
		
		detailget ig=new detailget();;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rental", "root", "team25");
			String query = "SELECT * FROM item where product='"+Pname+"'and model='"+model+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);

		      while (rs.next())
		      {
		    	
		    	ig.setUrl1(rs.getString("subpic1"));
		    	ig.setUrl2(rs.getString("subpic2"));
		    	ig.setUrl3(rs.getString("subpic3"));
		    	
		    	ig.setName(rs.getString("product"));
		    	ig.setRent(rs.getInt("rent"));
		    	ig.setRefund(rs.getInt("refund"));
		    	
		    	ig.setCost(rs.getInt("price"));
		    	ig.setModel(rs.getString("model"));
		    	ig.setManfu(rs.getString("manufac"));
		    	ig.setDimension(rs.getString("dimension"));
		    	ig.setClr(rs.getString("color"));
		    	ig.setWg(rs.getString("weight"));
		    	
		      }
		}catch(Exception e) {
			System.out.println(e);
		}
	
		
		return ig;
}
}
