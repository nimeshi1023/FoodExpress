package DeliveryPerson;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/DeliveryInsertServlet")
public class DeliveryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String nic = request.getParameter("nic");
		String vehicleType = request.getParameter("vehicleType");
		String licenNo = request.getParameter("licenNo");
		String phone = request.getParameter("phone");
		
		
		boolean isTrue;
		
		isTrue = DeliveryControl.insertdata(name, nic, vehicleType, licenNo, phone);
		
		if(isTrue == true) {
			String alertMessage = "Data Insert Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='DeliveryGetAllServlet'</script>");
			
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("Deliverywrong.jsp");
			dis2.forward(request, response);
			
		}
	}

}
