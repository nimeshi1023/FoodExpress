<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodExpress - Delicious Food Delivered Fast</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #ff6b6b;
            --primary-dark: #e74c3c;
            --secondary-color: #4a90e2;
            --secondary-dark: #3a7bc8;
            --accent-color: #ff9f1c;
            --dark-color: #2c3e50;
            --light-color: #f9f9f9;
            --text-color: #333;
            --text-light: #777;
            --white: #ffffff;
            --shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light-color);
            color: var(--text-color);
            line-height: 1.6;
        }

        /* Navigation Bar */
        .navbar {
            background-color: var(--white);
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: var(--shadow);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            transition: var(--transition);
        }

        .navbar.scrolled {
            padding: 0.8rem 5%;
            background-color: rgba(255, 255, 255, 0.98);
        }

        .logo {
            display: flex;
            align-items: center;
            text-decoration: none;
        }

        .logo i {
            color: var(--primary-color);
            font-size: 1.8rem;
            margin-right: 0.8rem;
        }

        .logo h1 {
            color: var(--dark-color);
            font-size: 1.8rem;
            font-weight: 700;
        }

        .logo span {
            color: var(--primary-color);
        }

        .nav-links {
            display: flex;
            align-items: center;
        }

        .nav-links a {
            margin-left: 1.5rem;
            padding: 0.6rem 1.2rem;
            color: var(--dark-color);
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
            border-radius: 2rem;
        }

        .nav-links a:hover {
            color: var(--primary-color);
        }

        .btn {
            padding: 0.6rem 1.5rem;
            border: none;
            border-radius: 2rem;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
        }

        .btn-secondary {
            background-color: var(--secondary-color);
            color: var(--white);
        }

        .btn-secondary:hover {
            background-color: var(--secondary-dark);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(74, 144, 226, 0.3);
        }

        .btn-group {
            display: flex;
            gap: 0.8rem;
            margin-left: 1.5rem;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                        url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80') no-repeat center center/cover;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 0 5%;
            color: var(--white);
            margin-top: 0;
        }

        .hero-content {
            max-width: 800px;
            animation: fadeIn 1.5s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        .hero-btns {
            display: flex;
            justify-content: center;
            gap: 1.5rem;
        }

        /* Features Section */
        .section {
            padding: 5rem 5%;
        }

        .section-title {
            text-align: center;
            margin-bottom: 3rem;
        }

        .section-title h2 {
            font-size: 2.5rem;
            color: var(--dark-color);
            margin-bottom: 1rem;
        }

        .section-title p {
            color: var(--text-light);
            max-width: 700px;
            margin: 0 auto;
        }

        .feature-box {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .feature {
            background: var(--white);
            padding: 2.5rem;
            border-radius: 1rem;
            box-shadow: var(--shadow);
            text-align: center;
            transition: var(--transition);
        }

        .feature:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .feature-icon {
            width: 80px;
            height: 80px;
            background-color: rgba(255, 107, 107, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
        }

        .feature-icon i {
            font-size: 2.5rem;
            color: var(--primary-color);
        }

        .feature h3 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: var(--dark-color);
        }

        /* How It Works */
        .steps {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-top: 3rem;
            flex-wrap: wrap;
        }

        .step {
            flex: 1;
            min-width: 200px;
            text-align: center;
            position: relative;
        }

        .step-number {
            width: 60px;
            height: 60px;
            background-color: var(--primary-color);
            color: var(--white);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            font-weight: 700;
            margin: 0 auto 1.5rem;
        }

        .step h3 {
            margin-bottom: 1rem;
        }

        .step p {
            color: var(--text-light);
        }

        .step:not(:last-child)::after {
            content: '';
            position: absolute;
            top: 30px;
            right: -30px;
            width: 30px;
            height: 2px;
            background-color: var(--primary-color);
        }

        /* Footer */
        .footer {
            background-color: var(--dark-color);
            color: var(--white);
            padding: 4rem 5% 2rem;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
        }

        .footer-col h3 {
            font-size: 1.2rem;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 0.5rem;
        }

        .footer-col h3::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 50px;
            height: 2px;
            background-color: var(--primary-color);
        }

        .footer-col ul {
            list-style: none;
        }

        .footer-col ul li {
            margin-bottom: 0.8rem;
        }

        .footer-col ul li a {
            color: #bdc3c7;
            text-decoration: none;
            transition: var(--transition);
        }

        .footer-col ul li a:hover {
            color: var(--white);
            padding-left: 5px;
        }

        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .social-links a {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            color: var(--white);
            transition: var(--transition);
        }

        .social-links a:hover {
            background-color: var(--primary-color);
            transform: translateY(-3px);
        }

        .footer-bottom {
            text-align: center;
            padding-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: #bdc3c7;
            font-size: 0.9rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar {
                padding: 1rem;
                flex-direction: column;
            }

            .nav-links {
                margin-top: 1rem;
                width: 100%;
                justify-content: center;
                flex-wrap: wrap;
            }

            .nav-links a {
                margin: 0.5rem;
                font-size: 0.9rem;
            }

            .btn-group {
                margin: 1rem auto 0;
            }

            .hero {
                height: auto;
                padding: 10rem 1rem 4rem;
            }

            .hero h1 {
                font-size: 2.2rem;
            }

            .hero p {
                font-size: 1rem;
            }

            .hero-btns {
                flex-direction: column;
                gap: 1rem;
            }

            .btn {
                width: 100%;
            }

            .step:not(:last-child)::after {
                display: none;
            }
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <nav class="navbar" id="navbar">
        <a href="home.jsp" class="logo">
            <i class="fas fa-utensils"></i>
            <h1>Food<span>Express</span></h1>
        </a>
        <div class="nav-links">
            <a href="#features">Features</a>
            <a href="#how-it-works">How It Works</a>
          <a href="Stafflogin.jsp" class="btn btn-primary">Admin</a> 
            <div class="btn-group">
                <a href="login.jsp" class="btn btn-primary">Login</a>
                <a href="Register.jsp" class="btn btn-secondary">Register</a>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h1>Delicious Food Delivered to Your Doorstep</h1>
            <p>Order from your favorite local restaurants with just a few clicks</p>
            <div class="hero-btns">
                <a href="#how-it-works" class="btn btn-primary">Order Now</a>
                <a href="Register.jsp" class="btn btn-secondary">Get Started</a>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="section" id="features">
        <div class="section-title">
            <h2>Why Choose FoodExpress?</h2>
            <p>We provide the best food delivery experience with our premium services</p>
        </div>
        <div class="feature-box">
            <div class="feature">
                <div class="feature-icon">
                    <i class="fas fa-hamburger"></i>
                </div>
                <h3>Wide Variety</h3>
                <p>From fast food to fine dining, we partner with hundreds of restaurants to bring you endless options.</p>
            </div>
            <div class="feature">
                <div class="feature-icon">
                    <i class="fas fa-shipping-fast"></i>
                </div>
                <h3>Fast Delivery</h3>
                <p>Our network of delivery partners ensures your food arrives hot and fresh in record time.</p>
            </div>
            <div class="feature">
                <div class="feature-icon">
                    <i class="fas fa-lock"></i>
                </div>
                <h3>Secure Payments</h3>
                <p>All transactions are encrypted and secure with multiple payment options available.</p>
            </div>
        </div>
    </section>

    <!-- How It Works -->
    <section class="section" id="how-it-works">
        <div class="section-title">
            <h2>How It Works</h2>
            <p>Get your favorite food in just 3 simple steps</p>
        </div>
        <div class="steps">
            <div class="step">
                <div class="step-number">1</div>
                <h3>Choose Your Food</h3>
                <p>Browse restaurants and select your favorite dishes</p>
            </div>
            <div class="step">
                <div class="step-number">2</div>
                <h3>Pay Securely</h3>
                <p>Complete your payment with our secure checkout</p>
            </div>
            <div class="step">
                <div class="step-number">3</div>
                <h3>Fast Delivery</h3>
                <p>Track your order in real-time until delivery</p>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-grid">
            <div class="footer-col">
                <h3>FoodExpress</h3>
                <p>Delivering delicious meals to your doorstep since 2023. We connect you with the best local restaurants.</p>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="footer-col">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="#features">Features</a></li>
                    <li><a href="#how-it-works">How It Works</a></li>
                    <li><a href="login.jsp">Login</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h3>Support</h3>
                <ul>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">FAQs</a></li>
                    </ul>
                    </div>
                    </div>
                    </footer>