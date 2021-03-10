package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class adminDBUpload {
	
	public boolean adminFormUpload(String cat,String name,String pr,String dep,String rt,
			String md,String clr,String dm,String wg,String manfu,
			String url1,String url2,String url3,String url4) {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rental", "root", "team25");
			String query = " insert into item (category,product,price,refund,rent,model,color,dimension,weight,manufac,mainpic,subpic1,subpic2,subpic3)"
			        + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, cat);
			ps.setString(2, name);
			ps.setInt(3, Integer.parseInt(pr));
			ps.setInt(4, Integer.parseInt(dep));
			ps.setInt(5, Integer.parseInt(rt));
			ps.setString(6, md);
			ps.setString(7, clr);
			ps.setString(8, dm);
			ps.setString(9, wg);
			ps.setString(10, manfu);
			ps.setString(11, url1);
			ps.setString(12, url2);
			ps.setString(13, url3);
			ps.setString(14, url4);
			ps.execute();
			con.setAutoCommit(true);
			con.close();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;

		}
		return true;
	}

	public static void main(String[] args) {

	}

}
