<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<link rel="stylesheet" type="text/css" href="Registercss.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="registration-container">
        <div class="registration-card">
            <h2>Create Your Account</h2>
            <form action="UserInsertServlet" method="post" onsubmit="return validatePhone();">

                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" required placeholder="Enter your full name">
                </div>
                <div class="form-group">
                    <label for="gmail">Email Address</label>
                    <input type="email" id="gmail" name="gmail" required placeholder="Enter your email">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required placeholder="Create a password">
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" required placeholder="Enter your phone number">
                </div>
                <button type="submit" class="submit-btn">Register Now</button>
                <div class="login-link">
                    Already have an account? <a href="login.jsp">Sign in</a>
                </div>
            </form>
        </div>
    </div>
    
    <script>
function validatePhone() {
    const phone = document.getElementById('phone').value;
    const phonePattern = /^\d{10}$/;

    if (!phonePattern.test(phone)) {
        alert("Please enter a valid 10-digit phone number.");
        return false;
    }
    return true;
}
</script>
    
</body>
</html>