package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import java.sql.Date;

public class renthistorydao {
	public static Date addDays(Date date, int days) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.DATE, days);
        return new Date(c.getTimeInMillis());
    }
	public boolean uploadrenthistory(String email,String name,String model,String days,String rent,String original_rent) 
	{
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rental", "root", "team25");
			
			java.sql.Date sqldate=new java.sql.Date(new java.util.Date().getTime());
			java.sql.Date del_date = (java.sql.Date)addDays(sqldate, 2);
			java.sql.Date return_date = (java.sql.Date)addDays(sqldate, Integer.parseInt(days)+2);
			System.out.println(sqldate+" "+del_date+" "+return_date);
				PreparedStatement pstmt = con.prepareStatement(
						"insert into renthistory(email,product,model,days,rent,order_date,delivery_date,get_date) "
								+ "values(?,?,?,?,?,?,?,?)");
						pstmt.setString(1, email);
						pstmt.setString(2, name);
						pstmt.setString(3, model);
						pstmt.setString(4, days);
						pstmt.setString(5, rent);
						pstmt.setDate(6, sqldate);
						pstmt.setDate(7, del_date);
						pstmt.setDate(8, return_date);
						pstmt.execute();
						con.close();
						return true;
						
				
			
		} catch (Exception ex) {
			System.out.println(ex);
			return false;
		}
	}
	public boolean checkProduct(String name,String model) {
		System.out.println(model);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rental", "root", "team25");
			Statement st= con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM item WHERE product='"+name+"'and model='"+model+"'");
			String or_nm = null,or_mod=null;
			while(rs.next()) {
				or_nm=rs.getString("product");
				or_mod=rs.getString("model");
			}
			if (name.equals(or_nm)&& model.equals(or_mod)) {
				return true;
			}else {
				return false;
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
			
			return false;
			}
		}
		
	}

