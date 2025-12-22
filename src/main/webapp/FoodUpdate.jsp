<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Update Food Item</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color:#FFFAA0;
      padding: 40px;
    }

    .form-container {
      background: #ffffff;
      padding: 25px;
      max-width: 500px;
      margin: auto;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    label {
      display: block;
      margin-top: 15px;
      font-weight: bold;
      color: #2c3e50;
    }

    input, select {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border-radius: 5px;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }

    button {
      margin-top: 20px;
      padding: 12px;
      width: 100%;
      background:  #eca50e;
      color: white;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      cursor: pointer;
      box-sizing: border-box;
    }

    button:hover {
      background: #a04000;
    }

    .error {
      color: red;
      font-size: 0.9em;
      margin-top: 10px;
    }
  </style>
</head>
<body>
	<%
	String id = request.getParameter("food_id");
	String name = request.getParameter("name");
	String res_name = request.getParameter("res_name");
	String category = request.getParameter("category");
	String available = request.getParameter("available");
	String size = request.getParameter("size");
	float price = Float.parseFloat(request.getParameter("price"));
	%>
	
	<div class="form-container">
  <h2 style= "color: #a04000">Update Food Item</h2>
  <form action="FoodUpdateServlet" method="post" id="foodForm">
	
	<label for="id">Food Id</label>
    <input type="text" id="id" name="food_id" value="<%=id%>" readonly>
    
    <label for="name">Food Name</label>
    <input type="text" id="name" name="name" value="<%=name%>" required>
    
    <label for="res_name">Restaurant Name</label>
    <input type="text" id="res_name" name="res_name" value="<%=res_name%>" required>

    <label for="category">Category</label>
    <select id="category" name="category" required>
      <option value="">-- Select Category --</option>
      <option value="Pizza" <%= category.equals("Pizza") ? "selected" : "" %>>Pizza</option>
  	  <option value="Beverage" <%= category.equals("Beverage") ? "selected" : "" %>>Beverage</option>
      <option value="Dessert" <%= category.equals("Dessert") ? "selected" : "" %>>Dessert</option>
      <option value="Fast Foods" <%= category.equals("Fast Foods") ? "selected" : "" %>>Fast Foods</option>
      <option value="Rice and Curry" <%= category.equals("Rice and Curry") ? "selected" : "" %>>Rice and Curry</option>
    </select>

    <label for="available">Available</label>
    <select id="available" name="available"required>
      <option value="">-- Select Availability --</option>
      <option value="Available" <%= available.equals("Available") ? "selected" : "" %>>Available</option>
      <option value="Not Available" <%= available.equals("Not Available") ? "selected" : "" %>>Not Available</option>
    </select>

    <label for="size">Size</label>
    <select id="size" name="size" >
      <option value="">-- Select Size --</option>
      <option value="Small" <%= size.equals("Small") ? "selected" : "" %>>Small</option>
      <option value="Medium" <%= size.equals("Medium") ? "selected" : "" %>>Medium</option>
      <option value="Large" <%= size.equals("Large") ? "selected" : "" %>>Large</option>
    </select>

    <label for="price">Price</label>
    <input type="number" id="price" name="price" value="<%=price%>"required>

    <div class="error" id="errorMsg"></div>

    <button type="submit">Submit</button>
  </form>
</div>

<script>
  document.getElementById('foodForm').addEventListener('submit', function (e) {
    e.preventDefault();

    const name = document.getElementById('name').value.trim();
    const category = document.getElementById('category').value;
    const available = document.getElementById('available').value;
    const size = document.getElementById('size').value;
    const price = parseFloat(document.getElementById('price').value);
    const errorMsg = document.getElementById('errorMsg');

    errorMsg.textContent = '';

    if (!name || !category || !available || isNaN(price) || price <= 0) {
      errorMsg.textContent = "Please fill out all fields correctly. Price must be a positive number.";
      return;
    }

    
    this.submit();
  });
</script>
</body>
</html>