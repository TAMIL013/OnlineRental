package userview;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class itemdao {
	public ArrayList<itemget> fetch_item(String cat) {
			ArrayList<itemget> list_item=new ArrayList<itemget>();
			itemget ig=null;
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rental", "root", "team25");
				String query = "SELECT mainpic,product,rent,model FROM item where category='"+cat+"'";
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(query);
	
			      while (rs.next())
			      {
			    	ig=new itemget();
			    	ig.setMainURL(rs.getString("mainpic"));
			    	ig.setName(rs.getString("product"));
			    	ig.setRent(rs.getInt("rent"));
			    	ig.setModel(rs.getString("model"));
			    	list_item.add(ig);
			      }
			}catch(Exception e) {
				System.out.println(e);
			}
		
			
			return list_item;
	}
}
