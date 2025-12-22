package staff_login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StaffInsertServlet")
public class StaffInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contactNoStr = request.getParameter("contactNo");

        int contactNo = 0;
        try {
            contactNo = Integer.parseInt(contactNoStr);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Invalid contact number'); window.location.href='register.jsp';</script>");
            System.out.println(e);
            return;
            
        }

        // Ensure the controller class and method exist
        boolean isInserted = staffController.insertStaff(name, email, password, contactNo);

        if (isInserted) {
            String alertMessage = "Registration Successful";
            response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='Stafflogin.jsp';</script>");
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
            dispatcher.forward(request, response);
        }
    }
}
