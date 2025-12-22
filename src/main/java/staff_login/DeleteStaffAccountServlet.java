package staff_login;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeleteStaffAccountServlet")
public class DeleteStaffAccountServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve session without creating a new one
        HttpSession session = request.getSession(false);

        if (session != null) {
            Object staffIdObj = session.getAttribute("staffId");

            // Validate staffId type
            if (staffIdObj instanceof Integer) {
                int staffId = (Integer) staffIdObj;

                try (Connection conn = DBConnection.getConnection();
                     PreparedStatement stmt = conn.prepareStatement("DELETE FROM staff WHERE id = ?")) {

                    stmt.setInt(1, staffId);
                    int rowsAffected = stmt.executeUpdate();

                    if (rowsAffected > 0) {
                        session.invalidate(); // Logout after deletion
                        response.sendRedirect("Stafflogin.jsp");
                    } else {
                        response.sendRedirect("StaffProfile.jsp?status=delete_failed");
                    }

                } catch (SQLException e) {
                    // Log the SQL error
                    System.err.println("SQL error while deleting staff ID: " + staffId);
                    e.printStackTrace();
                    response.sendRedirect("StaffProfile.jsp?status=error");
                    System.out.println(e);
                }
            } else {
                response.sendRedirect("StaffProfile.jsp?status=invalid_id");
            }
        } else {
            response.sendRedirect("Stafflogin.jsp");
        }
    }
}

