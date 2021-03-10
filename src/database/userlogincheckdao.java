package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

public class userlogincheckdao {
	private String fullname;
	private String membership;
	
	
	public String getFullname() {
		return fullname;
	}


	public void setFullname(String fullname) {
		this.fullname = fullname;
	}


	public String getMembership() {
		return membership;
	}


	public void setMembership(String membership) {
		this.membership = membership;
	}


	public userlogincheckdao checklogin(String email,String pass) {
		 
		userlogincheckdao l=new userlogincheckdao();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rental", "root", "team25");
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery("select membership,name from register where email='" + email + "'"
					+ "and password='"+ pass+"'");

			while (rs.next()) {
				l.setFullname(rs.getString("name"));
				l.setMembership(rs.getString("membership"));
				return l;
			} 
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
			
		}
		return null;
		
	}
}
