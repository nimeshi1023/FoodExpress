package staff_login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/staffProfileServlet")
public class staffProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Get the logged-in staff from session
        staffModel staff = (staffModel) session.getAttribute("staff");
        
        if (staff != null) {
            // Optional: Refresh staff data from database to ensure it's up-to-date
            // This is useful if profile data might have been updated elsewhere
            // StaffDAO staffDAO = new StaffDAO();
            // staff = staffDAO.getStaffById(staff.getId());
            // session.setAttribute("staff", staff); // Update session with fresh data
            
            // Forward staff data to staffprofile.jsp
            request.setAttribute("staff", staff);
            request.getRequestDispatcher("StaffProfile.jsp").forward(request, response);
        } else {
            // Redirect to login if not logged in
            response.sendRedirect("login.jsp");
        }
    }
}