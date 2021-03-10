package database;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import userview.detailget;

public class admintabledao {
	public ArrayList<detailget> fetch_table(){
		ArrayList<detailget> list=new ArrayList<detailget>();
		detailget ig=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rental", "root", "team25");
			String query = "SELECT * FROM item 	";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);

		      while (rs.next())
		      {
		    	ig=new detailget();
		    	
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
		    	ig.setId(rs.getInt("id"));
		    	ig.setCat(rs.getString("category"));
		    	list.add(ig);
		      }
		}catch(Exception e) {
			System.out.println(e);
		}
		return list;
		
	}
	public ArrayList<String> getURL(int id){
		ArrayList<String> url_list=new ArrayList<>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rental", "root", "team25");
			String query = "SELECT mainpic,subpic1,subpic2,subpic3 FROM item WHERE id='"+id+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);

		      if (rs.next())
		      {
		    	url_list.add(rs.getString("mainpic"));
		    	url_list.add(rs.getString("subpic1"));
		    	url_list.add(rs.getString("subpic2"));
		    	url_list.add(rs.getString("subpic3"));
		    	System.out.println("url get from db");
		      }
		}catch(Exception e) {
			System.out.println(e);
		}
		return url_list;
		
	}
	public boolean delete_img_file(ArrayList<String> url) {
		File f;
		for(String s:url) {
			f=new File("C:/Users/tamil/eclipse-workspace/BasicServlet/WebContent/"+s);
			if (f.delete()) { 
			      System.out.println("Deleted the folder: " + f.getName());
			      
			    } else {
			      System.out.println("Failed to delete the folder.");
			    } 
		}
		return true	;
	}
	
	public boolean delete_value(int id){
		ArrayList<String> url=getURL(id);
		if(url.size()>0) {
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rental", "root", "team25");
				String query = "DELETE FROM item WHERE id='"+id+"'";
				Statement st = con.createStatement();
				st.execute(query);
				
				
					System.out.println("delete id in db");		
					boolean img_del=delete_img_file(url);
					if(img_del)
						return true;
				

			}catch(Exception e) {
				System.out.println(e);
			}
		}
		return false;
		
	}
}
