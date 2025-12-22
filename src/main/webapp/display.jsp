<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Product Table</h2>
<table>
     <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Category</th>
        <th>Quantity</th>
        <th>Description</th>
      </tr>
      <c:forEach var="food" items="${allfoods}">
      <tr>
         <td>${food.id}</td> 
         <td>${food.name}</td> 
         <td>${food.price}</td>
         <td>${food.catagory}</td> 
         <td>${food.quentity}</td> 
         <td>${food.description}</td> 
        </tr>
        </c:forEach> 
         
        </table>
</body>
</html>