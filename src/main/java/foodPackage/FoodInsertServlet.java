package foodPackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/FoodInsertServlet")
public class FoodInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String res_name = request.getParameter("res_name");
		String category = request.getParameter("category");
		String available = request.getParameter("available");
		String size = request.getParameter("size");
		float price = Float.parseFloat(request.getParameter("price"));
		
		boolean isTrue;
		
		isTrue = FoodControl.insertdata(name,res_name, category, available, size, price );
		
		if(isTrue == true) {
			String alertMessage = "Data Insert Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='FoodGetAllServlet'</script>");
			
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("Foodwrong.jsp");
			dis2.forward(request, response);
			
		}
	}

}
