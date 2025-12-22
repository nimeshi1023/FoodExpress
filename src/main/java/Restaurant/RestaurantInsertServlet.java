package Restaurant;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/RestaurantInsertServlet")
public class RestaurantInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        String pno = request.getParameter("pno");
        String email = request.getParameter("email");

        boolean isTrue = RestaurantController.insertdata(name, location, description, pno, email);

        if (isTrue) {
            String alertMessage = "Data insert successful";
            response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='RestaurantGetAllServlet'</script>");
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("Restaurantwrong.jsp");
            dis2.forward(request, response);
        }
    }
}
