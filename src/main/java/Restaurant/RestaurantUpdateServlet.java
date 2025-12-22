package Restaurant;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RestaurantUpdateServlet")
public class RestaurantUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        String pno = request.getParameter("pno");
        String email = request.getParameter("email");
        
        boolean isUpdated = RestaurantController.updatedata(id, name, location, description, pno, email);

        if (isUpdated) {

            List<RestaurantModel> restaurantDetails = RestaurantController.getById(id);
            request.setAttribute("restaurantDetails", restaurantDetails);
            
            String alertMessage="Data Update Successful";
            response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='RestaurantGetAllServlet'</script>");
        } else {
          
            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
        }
    }
}
