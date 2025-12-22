package UserPackage;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        // Null or empty check before attempting delete
        if (id == null || id.trim().isEmpty()) {
            response.getWriter().println("<script>alert('Invalid ID!'); window.location.href='GetAllGuidesServletC';</script>");
            return;
        }

        boolean isTrue = UserController.deletedata(id);

        if (isTrue) {
            String alertMessage = "Data Delete Successful";
            response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='login.jsp';</script>");
        } else {
            List<UserModel> guidedetails = UserController.getById(id);
            request.setAttribute("guidedetails", guidedetails);
            RequestDispatcher dis3 = request.getRequestDispatcher("wrong.jsp");
            dis3.forward(request, response);
        }
    }
}
