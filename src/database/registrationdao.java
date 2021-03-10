package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class registrationdao {
	public boolean registration(String name,String email,String password,String con_password,String phone_number,String gender,
			String dob,String city,String street,String landmark,String pinnumber,
			String state) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rental", "root", "team25");
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery("select * from register where email='" + email + "'");

			if (rs.next()) {
				return false;
				
			} else {
				PreparedStatement pstmt = con.prepareStatement(
				"insert into register(name,email,password,con_password,phone_number,gender,dob,city,street,landmark,pinnumber,state) "
						+ "values(?,?,?,?,?,?,?,?,?,?,?,?)");
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				pstmt.setString(3, password);
				pstmt.setString(4, con_password);
				pstmt.setString(5, phone_number);
				pstmt.setString(6, gender);
				pstmt.setString(7, dob);
				pstmt.setString(8, city);
				pstmt.setString(9, street);
				pstmt.setString(10, landmark);
				pstmt.setString(11, pinnumber);
				pstmt.setString(12, state);
				pstmt.execute();
				con.close();
				return true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
			
		}
	}
	public boolean membershipupdate(String mem,String email) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rental", "root", "team25");
			Statement st= con.createStatement();
			String query = "update register set membership = ? where email = ?";
		      PreparedStatement preparedStmt = con.prepareStatement(query);
		      preparedStmt.setString(1, mem);
		      preparedStmt.setString(2, email);

		      
		      preparedStmt.executeUpdate();
		      return true;
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
			
		}
		
	}
	public static void main(String[] args) {

	}

}
