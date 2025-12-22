package staff_login;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/StaffLoginServlet")
public class StaffLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Optional: redirect to login page if GET is used
        response.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            List<staffModel> staffLogin = staffController.loginValidate(email, password);

            if (staffLogin != null && !staffLogin.isEmpty()) {
                // Login successful, set session attributes
                HttpSession session = request.getSession();
                staffModel staff = staffLogin.get(0);

                // Store all staff attributes in session for use in profile page
                session.setAttribute("staff", staff);
                session.setAttribute("staffId", staff.getId());
                session.setAttribute("name", staff.getName());
                session.setAttribute("email", staff.getEmail());
                session.setAttribute("contactNo", staff.getContactNo()); // Fixed: using contactNo instead of phone
                session.setAttribute("password", staff.getPassword());

               
                response.sendRedirect("Admindashbord.jsp");
            } else {
                // Invalid credentials
                String alertMessage = "Invalid Credentials, please try again";
                response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='Stafflogin.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Something went wrong.'); window.location.href='wrong.jsp';</script>");
            System.out.println(e);
        }
    }
}