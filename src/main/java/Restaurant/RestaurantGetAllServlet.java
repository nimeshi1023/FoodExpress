package Restaurant;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@WebServlet("/RestaurantGetAllServlet")
public class RestaurantGetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		List<RestaurantModel> allRestaurant =RestaurantController.getAllFood();
		request.setAttribute("allRestaurants",allRestaurant);
		
		RequestDispatcher dispatcher =request.getRequestDispatcher("RestaurantDisplay.jsp");
		dispatcher .forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doGet(request, response);
	}


}
