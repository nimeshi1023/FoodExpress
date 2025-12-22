package foodPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FoodUpdateServlet")
public class FoodUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("food_id");
		String name = request.getParameter("name");
		String res_name = request.getParameter("res_name");
		String category = request.getParameter("category");
		String available = request.getParameter("available");
		String size = request.getParameter("size");
		float price = Float.parseFloat(request.getParameter("price"));
		
		boolean isTrue;
		isTrue = FoodControl.updatedata( id, name, res_name, category, available, size, price);
		
		if(isTrue == true) {
			List<FoodModel> foodDetails = FoodControl.getById(id);
			request.setAttribute("foodDetails", foodDetails);
			String alertMessage = "Data Update Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='FoodGetAllServlet'</script>");
			
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("Foodwrong.jsp");
			dis2.forward(request, response);
			
		}
	}

}
