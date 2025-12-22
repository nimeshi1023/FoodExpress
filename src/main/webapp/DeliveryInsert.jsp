<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Delivery Person</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #6ff7d0;
      padding: 40px;
    }

    .form-container {
      background: #ffffff;
      padding: 25px;
      max-width: 500px;
      margin: auto;
      border-radius: 10px;
      border-color:#ffcc99;
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
      background: #07ba30;
      color: white;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      cursor: pointer;
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

<div class="form-container">
  <h2 style= "color: #07611c">Add Delivery Person</h2>
  <form action="DeliveryInsertServlet" method="post" id="deliveryForm">

    <label for="name">Name</label>
    <input type="text" id="name" name="name" required>
    
    <label for="nic">Nic</label>
    <input type="text" id="nic" name="nic" required>

    <label for="vehicleType">Vehicle Type</label>
    <select id="vehicleType" name="vehicleType" required>
      <option value="">-- Select Availability --</option>
      <option value="Car">Car</option>
      <option value="Bike">Bike</option>
      <option value="Three wheel">Three wheel</option>
    </select>
    
    <label for="licenNo">License Number</label>
    <input type="text" id="licenNo" name="licenNo" required>
    
    <label for="phone">Phone Number</label>
    <input type="text" id="phone" name="phone" required>

    <div class="error" id="errorMsg"></div>

    <button type="submit">Submit</button>
  </form>
</div>

<script>
document.getElementById('deliveryForm').addEventListener('submit', function (e) {
    e.preventDefault();

    const name = document.getElementById('name').value.trim();
    const nic = document.getElementById('nic').value.trim();
    const vehicleType = document.getElementById('vehicleType').value;
    const licenNo = document.getElementById('licenNo').value.trim();
    const phone = document.getElementById('phone').value.trim();
    const errorMsg = document.getElementById('errorMsg');

    errorMsg.textContent = '';

    // Basic NIC pattern (you can adjust this depending on your country's format)
    
    const phonePattern = /^[0-9]{10}$/;

    if (!name || !nic || !vehicleType || !licenNo || !phone) {
      errorMsg.textContent = 'Please fill out all fields.';
      return;
    }


    if (!phonePattern.test(phone)) {
      errorMsg.textContent = 'Phone number must be 10 digits.';
      return;
    }
    
    this.submit();
  });
</script>

</body>
</html>
