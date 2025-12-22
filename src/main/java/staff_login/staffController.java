package staff_login;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class staffController {

    private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    public static boolean insertStaff(String name, String email, String password, int contactNo) {
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            String sql = "INSERT INTO staff (name, email, password, contactNo) VALUES ('"
                    + name + "', '" + email + "', '" + password + "', '" + contactNo + "')";

            int result = stmt.executeUpdate(sql);
            isSuccess = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    public static List<staffModel> loginValidate(String email, String password) {
        ArrayList<staffModel> staffList = new ArrayList<>();

        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM staff WHERE email='" + email + "' AND password='" + password + "'";
            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String pass = rs.getString("password");
                int contactNo = rs.getInt("contactNo");
            

                staffModel staff = new staffModel(id, name, email, pass, contactNo);
                staffList.add(staff);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return staffList;
    }

    public static List<staffModel> getStaffById(String id) {
        int convertedID = Integer.parseInt(id);
        ArrayList<staffModel> staffList = new ArrayList<>();

        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM staff WHERE id='" + convertedID + "'";
            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                int sid = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                int contactNo = rs.getInt("contactNo");
               

                staffModel staff = new staffModel(sid, name, email, password, contactNo);
                staffList.add(staff);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return staffList;
    }

    public static boolean updateStaffprofile(String id, String name, String email, String password, int contactNo, String image) {
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            String sql = "UPDATE staff SET name='" + name + "', email='" + email + "', password='" + password +
                    "', contactNo='" + contactNo + "', image='" + image + "' WHERE id='" + id + "'";

            int result = stmt.executeUpdate(sql);
            isSuccess = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    public static boolean deleteStaffAccount(String id) {
        int conID = Integer.parseInt(id);
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            String sql = "DELETE FROM staff WHERE id='" + conID + "'";

            int result = stmt.executeUpdate(sql);
            isSuccess = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
}


