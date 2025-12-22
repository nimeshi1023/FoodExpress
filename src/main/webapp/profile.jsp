<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<link rel="stylesheet" type="text/css" href="profilecss.css">
</head>
<body>
<div class="profile-container">
  <div class="profile-header">
    <h1 class="profile-title">User Profile</h1>
  </div>
  
  <div class="profile-details">
    <div class="detail-item">
      <span class="detail-label">ID:</span>
      <span class="detail-value">${user.id}</span>
    </div>
    <div class="detail-item">
      <span class="detail-label">Name:</span>
      <span class="detail-value">${user.name}</span>
    </div>
    <div class="detail-item">
      <span class="detail-label">Email:</span>
      <span class="detail-value">${user.gmail}</span>
    </div>
    <div class="detail-item">
      <span class="detail-label">Phone:</span>
      <span class="detail-value">${user.phone}</span>
    </div>
    <div class="detail-item">
      <span class="detail-label">Password:</span>
      <span class="detail-value">${user.password}</span>
    </div>
  </div>
  
  <div class="profile-actions">
<form action="UpdateProfile.jsp" method="post" style="display:inline;">
    <input type="hidden" name="id" value="${user.id}" />
    <input type="hidden" name="name" value="${user.name}" />
    <input type="hidden" name="gmail" value="${user.gmail}" />
    <input type="hidden" name="phone" value="${user.phone}" />
    <input type="hidden" name="password" value="${user.password}" />
    <button type="submit" class="btn update-btn">Update Profile</button>
</form>

    
    <form action="DeleteServlet" method="post" class="delete-form" onsubmit="return confirmDelete();">
      <input type="hidden" name="id" value="${user.id}"/>
      <button type="submit" class="btn delete-btn">Delete Account</button>
    </form>
  </div>
</div>


<script>
  function confirmDelete() {
    return confirm("Are you sure you want to delete your account?\nPress OK to confirm or Cancel to abort.");
  }
</script>
</body>
</html>