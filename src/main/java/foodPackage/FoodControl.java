package foodPackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FoodControl {

	//Connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//Insert java Function
	public static boolean insertdata(String name, String res_name, String category, String available, String size, float price ) {
		
		boolean isSuccess = false;
		try {
			con = DBConnection.getConnection();
			String sql = "INSERT INTO food (name,res_name, category, available, size, price) VALUES (?, ?, ?, ?, ?, ?)";
	        PreparedStatement pstmt = con.prepareStatement(sql);

	        pstmt.setString(1, name);
	        pstmt.setString(2, res_name);
	        pstmt.setString(3, category);
	        pstmt.setString(4, available);
	        pstmt.setString(5, size);
	        pstmt.setFloat(6, price); 

	        int rs = pstmt.executeUpdate();
	        
			if(rs > 0) {
				isSuccess = true;
			}
			pstmt.close();
	        con.close();
		
		}catch(Exception e) {
			System.out.println("Insert failed: " + e.getMessage());
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	//getBy ID
	public static List<FoodModel> getById(String Id){
		int convertedID = Integer.parseInt(Id);
		
		ArrayList <FoodModel> food = new ArrayList<>();
		try {
			//DBConnection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from food where id '"+convertedID+"'";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int food_id = rs.getInt(1);
				String name = rs.getString(2);
				String res_name = rs.getString(3);
				String category = rs.getString(4);
				String available = rs.getString(5);
				String size = rs.getString(6);
				float price = rs.getFloat(7);
				
				FoodModel fd = new FoodModel(food_id, name, res_name, category, available, size, price);
				food.add(fd);
				}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return food;
	}
	
	//Get All data
	public static List<FoodModel> getAllFood(){
		ArrayList <FoodModel> foods = new ArrayList<>();
		
		try {
			//DBConnection
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from food";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int food_id = rs.getInt(1);
				String name = rs.getString(2);
				String res_name = rs.getString(3);
				String category = rs.getString(4);
				String available = rs.getString(5);
				String size = rs.getString(6);
				float price = rs.getFloat(7);
				
				FoodModel fd = new FoodModel(food_id, name, res_name, category, available, size, price);
				foods.add(fd);
				}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return foods;
	}
	
	//update
	public static boolean updatedata(String id, String name, String res_name, String category, String available, String size, float price) {
		
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "update food set name='"+name+"', res_name='"+res_name+"', category='"+category+"', available='"+available+"', size='"+size+"', price='"+price+"'where food_id='"+id+"'";
			int rs = stmt.executeUpdate(sql);
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	//delete
	public static boolean deletedata(String id) {
		int conID = Integer.parseInt(id);
		
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "delete from food where food_id='"+conID+"'";
			
			
			int rs = stmt.executeUpdate(sql);
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
}
