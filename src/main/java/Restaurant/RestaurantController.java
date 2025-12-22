package Restaurant;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RestaurantController {

	//connection DB
	private static boolean isSuccess;
	private static Connection con=null;
	private static Statement stmt=null;
	private static ResultSet rs=null;
	
	//Insert data function
	public static boolean insertdata(String name,String location,String description,String pno,String email) {
		
		boolean isSuccess=false;
		
		try {
			con = DBConnection.getConnection();
			System.out.println("CON = " + con);
			stmt=con.createStatement();
			
			String sql="insert into restaurant values(0,'"+name+"','"+location+"','"+description+"','"+pno+"','"+email+"')";
			int rs=stmt.executeUpdate(sql);
			if(rs>0)
			{
				 isSuccess=true;
			}
			else {
				 isSuccess=false;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return  isSuccess;
	}
	//display data
	
	public static List<RestaurantModel> getById(String Id)
	{
		int convertID=Integer.parseInt(Id);
		
		ArrayList<RestaurantModel> restaurant =new ArrayList<>();
		
		try {
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			String sql ="select * from restaurant where id '"+convertID+"'";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id=rs.getInt(1);
				String name=rs.getNString(2);
				String location=rs.getNString(3);
				String description=rs.getNString(4);
				String pno=rs.getNString(5);
				String email=rs.getNString(6);
				
				RestaurantModel fd =new RestaurantModel(id,name,location,description,pno,email);
				restaurant .add(fd);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return restaurant;
		}
	
	public static List<RestaurantModel> getAllFood()
	{
		ArrayList<RestaurantModel> restaurants =new ArrayList<>();
		
		try {
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			String sql ="select * from restaurant ";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id=rs.getInt(1);
				String name=rs.getNString(2);
				String location=rs.getNString(3);
				String description=rs.getNString(4);
				String pno=rs.getNString(5);
				String email=rs.getNString(6);
				
				RestaurantModel fd =new RestaurantModel(id,name,location,description,pno,email);
				restaurants .add(fd);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return restaurants;
		}
	
	//update data
	
	public static boolean updatedata(String id,	String name,String location,String description,String pno,String email)
	{
		try {
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
			
			String sql = "UPDATE restaurant SET name='" + name + "', location='" + location + "', description='" + description +
	                 "', pno='" + pno + "', email='" + email + "' WHERE id='" + id + "'";
			
			int rs=stmt.executeUpdate(sql);
			if(rs>0)
			{
				 isSuccess=true;
			}
			else {
				 isSuccess=false;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	//delete data
	
	public static boolean deletedata(String id) {
	    boolean isSuccess = false;

	    try {
	        int convID = Integer.parseInt(id);

	        con = DBConnection.getConnection();
	        stmt = con.createStatement();
	        String sql = "DELETE FROM restaurant WHERE id = '" + convID + "'";

	        int rs = stmt.executeUpdate(sql);
	        if(rs>0)
			{
				 isSuccess=true;
			}
			else {
				 isSuccess=false;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}


	    return isSuccess;
	}


	}
	

