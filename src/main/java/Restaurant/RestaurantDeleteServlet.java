package Restaurant;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RestaurantDeleteServlet")
public class RestaurantDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        boolean isTrue = RestaurantController.deletedata(id);

        if (isTrue) {
           String alertMessage="Data Delete Successful";
           response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='RestaurantGetAllServlet'</script>");
        } else {
           
                List<RestaurantModel> restaurantDetails = RestaurantController.getById(id);
                request.setAttribute("restaurantDetails", restaurantDetails);
          
            RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
            dispatcher.forward(request, response);
        }
    }
}
