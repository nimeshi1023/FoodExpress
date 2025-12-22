<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User Profile</title>
<link rel="stylesheet" type="text/css" href="updatecss.css">
</head>
<body>
<div class="profile-update-wrapper">
<%
       String id = request.getParameter("id");
       String name = request.getParameter("name");
       String gmail = request.getParameter("gmail");
       String phone = request.getParameter("phone");
       String password = request.getParameter("password");
%>
 
  <form action="UpdateProfileServlet" method="post" class="profile-form">
  <h2 class="form-title">Update Your Profile</h2>
  <table class="form-table">
     <tr>
        <td><label for="id">ID:</label></td>
        <td><input type="text" id="id" name="id" value="<%=id%>" readonly class="form-input readonly-input"></td>
     </tr>
     <tr>
         <td><label for="name">Name:</label></td>
         <td><input type="text" id="name" name="name" value="<%=name%>" required class="form-input"></td>
     </tr>
     <tr>
         <td><label for="gmail">Email:</label></td>
         <td><input type="email" id="gmail" name="gmail" value="<%=gmail%>" required class="form-input"></td>
     </tr>
     <tr>
         <td><label for="phone">Phone:</label></td>
         <td><input type="tel" id="phone" name="phone" value="<%=phone%>" required class="form-input"></td>
     </tr>
     <tr>
         <td><label for="password">Password:</label></td>
         <td><input type="password" id="password" name="password" value="<%=password%>" required class="form-input"></td>
     </tr>
     <tr>
        <td colspan="2"><input type="submit" value="Update Profile" class="submit-btn"></td>
     </tr>
  </table>
  </form>
</div>
</body>
</html>