package staff_login;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateStaffProfileServlet")
@MultipartConfig
public class UpdateStaffProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve the staff object from session
        HttpSession session = request.getSession();
        staffModel staff = (staffModel) session.getAttribute("staff");

        if (staff != null) {
            // Retrieve form fields
            String name = getFormField(request, "name");
            String email = getFormField(request, "email");
            String password = getFormField(request, "password");
            String contactNoStr = getFormField(request, "contactNo");

            int contactNo = 0;
            try {
                contactNo = Integer.parseInt(contactNoStr);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            // Handle file upload
            Part filePart = request.getPart("image");
            String fileName = null;
            if (filePart != null && filePart.getSize() > 0) {
                fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + File.separator + "profileUploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();
                filePart.write(uploadPath + File.separator + fileName);
            } 
            // Update staff profile
            boolean isUpdated = staffController.updateStaffprofile(
                    String.valueOf(staff.getId()), name, email, password, contactNo, fileName);

            if (isUpdated) {
                // Update session attributes
                staff.setName(name);
                staff.setEmail(email);
                staff.setPassword(password);
                staff.setContactNo(contactNo);
               

                session.setAttribute("staff", staff);

                // Redirect to profile page with success message
                response.getWriter().println("<script>alert('Profile updated successfully.'); window.location.href='staffProfileServlet';</script>");
            } else {
                // Redirect to error page
                response.sendRedirect("wrong.jsp");
            }
        } else {
            // Session expired or not logged in
            response.sendRedirect("login.jsp");
        }
    }

    // Helper method to retrieve form field values
    private String getFormField(HttpServletRequest request, String fieldName) throws IOException, ServletException {
        Part part = request.getPart(fieldName);
        if (part != null) {
            InputStream inputStream = part.getInputStream();
            byte[] bytes = inputStream.readAllBytes();
            return new String(bytes).trim();
        }
        return null;
    }
}
