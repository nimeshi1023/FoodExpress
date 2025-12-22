package DeliveryPerson;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class DeliveryControl {
	//Connect DB
		private static boolean isSuccess;
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;
		
		//Insert java Function
		public static boolean insertdata(String name, String nic, String vehicleType, String licenNo, String phone ) {
			
			boolean isSuccess = false;
			try {
				con = DBConnection.getConnection();
				String sql = "INSERT INTO delivery (name, nic, vehicleType, licenNo, phone) VALUES (?, ?, ?, ?, ?)";
		        PreparedStatement pstmt = con.prepareStatement(sql);

		        pstmt.setString(1, name);
		        pstmt.setString(2, nic);
		        pstmt.setString(3, vehicleType);
		        pstmt.setString(4, licenNo);
		        pstmt.setString(5, phone);
		        

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
		public static List<DeliveryModel> getById(String Id){
			int convertedID = Integer.parseInt(Id);
			
			ArrayList <DeliveryModel> food = new ArrayList<>();
			try {
				//DBConnection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				String sql = "select * from food where id '"+convertedID+"'";
				rs=stmt.executeQuery(sql);
				
				while(rs.next()) {
					int id = rs.getInt(1);
					String name = rs.getString(2);
					String nic = rs.getString(3);
					String vehicleType = rs.getString(4);
					String licenNo = rs.getString(5);
					String phone = rs.getString(6);
					
					
					DeliveryModel fd = new DeliveryModel(id,name, nic, vehicleType, licenNo, phone);
					food.add(fd);
					}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return food;
		}
		
		//Get All data
		public static List<DeliveryModel> getAllFood(){
			ArrayList <DeliveryModel> foods = new ArrayList<>();
			
			try {
				//DBConnection
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				String sql = "select * from delivery";
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int id = rs.getInt(1);
					String name = rs.getString(2);
					String nic = rs.getString(3);
					String vehicleType = rs.getString(4);
					String licenNo = rs.getString(5);
					String phone = rs.getString(6);
					
					DeliveryModel fd = new DeliveryModel(id,name, nic, vehicleType, licenNo, phone);
					foods.add(fd);
					}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return foods;
		}
		
		//update
		public static boolean updatedata(String id, String name, String nic, String vehicleType, String licenNo, String phone) {
			
			try {
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				String sql = "update delivery set name='"+name+"', nic='"+nic+"', vehicleType='"+vehicleType+"', licenNo='"+licenNo+"', phone='"+phone+"'where id='"+id+"'";
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
				
				String sql = "delete from delivery where id='"+conID+"'";
				
				
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
