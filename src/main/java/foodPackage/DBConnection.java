package foodPackage;

import java.sql.Connection;

import java.sql.DriverManager;

public class DBConnection {

    private static String url = "jdbc:mysql://localhost:3306/foodorder";
    private static String user = "root";
    private static String pass = "uth318";

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver"); // Use this for Connector/J 5.x
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println("Database Not Connected!!");
            e.printStackTrace();
        }
        return con;
    }
}
