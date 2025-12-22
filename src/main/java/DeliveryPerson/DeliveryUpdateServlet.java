package DeliveryPerson;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeliveryUpdateServlet")
public class DeliveryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String nic = request.getParameter("nic");
		String vehicleType = request.getParameter("vehicleType");
		String licenNo = request.getParameter("licenNo");
		String phone = request.getParameter("phone");
		
		boolean isTrue;
		isTrue = DeliveryControl.updatedata( id,name, nic, vehicleType, licenNo, phone);
		
		if(isTrue == true) {
			List<DeliveryModel> DeliveryDetails = DeliveryControl.getById(id);
			request.setAttribute("DeliveryDetails", DeliveryDetails);
			String alertMessage = "Data Update Successful";
			response.getWriter().println("<script> alert('"+alertMessage+"');window.location.href='DeliveryGetAllServlet'</script>");
			
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("Deliverywrong.jsp");
			dis2.forward(request, response);
			
		}
	}

}
