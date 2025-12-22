<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodExpress - Admin Dashboard</title>
    <style>
        :root {
            --primary-color: #ff6b6b;
            --secondary-color: #4ecdc4;
            --dark-color: #292f36;
            --light-color: #f7fff7;
            --accent-color: #ff9f1c;
            --success-color: #2ecc71;
            --warning-color: #f39c12;
            --danger-color: #e74c3c;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f7fa;
            color: var(--dark-color);
        }

        .dashboard {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: var(--dark-color);
            color: var(--light-color);
            padding: 20px 0;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            height: 100%;
        }

        .sidebar-header {
            padding: 0 20px 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            margin-bottom: 20px;
        }

        .sidebar-header h2 {
            color: var(--light-color);
            display: flex;
            align-items: center;
        }

        .sidebar-header h2 i {
            margin-right: 10px;
            color: var(--primary-color);
        }

        .sidebar-menu {
            list-style: none;
        }

        .sidebar-menu li {
            margin-bottom: 5px;
        }

        .sidebar-menu a {
            display: block;
            color: var(--light-color);
            text-decoration: none;
            padding: 12px 20px;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }

        .sidebar-menu a:hover {
            background-color: rgba(255, 255, 255, 0.1);
            border-left: 3px solid var(--primary-color);
        }

        .sidebar-menu a.active {
            background-color: rgba(255, 255, 255, 0.1);
            border-left: 3px solid var(--primary-color);
        }

        .sidebar-menu i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

        .main-content {
            flex: 1;
            margin-left: 250px;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .header h1 {
            color: var(--dark-color);
            font-size: 24px;
        }

        .user-info {
            display: flex;
            align-items: center;
        }

        .user-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            transition: all 0.3s;
            text-align: center;
            cursor: pointer;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .card-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: white;
            margin: 0 auto 15px;
        }

        .card-icon.restaurants {
            background-color: var(--primary-color);
        }

        .card-icon.delivery {
            background-color: var(--secondary-color);
        }

        .card-icon.food {
            background-color: var(--accent-color);
        }

        .card h2 {
            font-size: 20px;
            color: var(--dark-color);
            margin-bottom: 10px;
        }

        .card p {
            font-size: 14px;
            color: #777;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background-color: #ff5252;
        }

        .content-section {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }

        .section-header h2 {
            color: var(--dark-color);
            font-size: 18px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        table th {
            background-color: #f9f9f9;
            color: #555;
            font-weight: 600;
        }

        table tr:hover {
            background-color: #f5f5f5;
        }

        .status {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }

        .status.active {
            background-color: #d4edda;
            color: #155724;
        }

        .status.inactive {
            background-color: #f8d7da;
            color: #721c24;
        }

        .action-btn {
            padding: 5px 10px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-size: 12px;
            margin-right: 5px;
            text-decoration: none;
            display: inline-block;
        }

        .edit-btn {
            background-color: var(--warning-color);
            color: white;
        }

        .delete-btn {
            background-color: var(--danger-color);
            color: white;
        }

        @media (max-width: 1200px) {
            .cards {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 70px;
                overflow: hidden;
            }
            .sidebar-header h2 span, .sidebar-menu a span {
                display: none;
            }
            .sidebar-menu a {
                text-align: center;
                padding: 12px 5px;
            }
            .sidebar-menu i {
                margin-right: 0;
                font-size: 20px;
            }
            .main-content {
                margin-left: 70px;
            }
            .cards {
                grid-template-columns: 1fr;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="dashboard">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-header">
                <h2><i class="fas fa-utensils"></i> <span>FoodExpress</span></h2>
            </div>
            <ul class="sidebar-menu">
                <li><a href="#" class="active"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a></li>
                <li><a href="#"><i class="fas fa-store"></i> <span>Restaurants</span></a></li>
                <li><a href="#"><i class="fas fa-motorcycle"></i> <span>Delivery Persons</span></a></li>
                <li><a href="#"><i class="fas fa-hamburger"></i> <span>Food Items</span></a></li>
                <li><a href="#"><i class="fas fa-shopping-bag"></i> <span>Orders</span></a></li>
                <li><a href="#"><i class="fas fa-users"></i> <span>Customers</span></a></li>
                <li><a href="#"><i class="fas fa-chart-line"></i> <span>Reports</span></a></li>
                <li><a href="#"><i class="fas fa-cog"></i> <span>Settings</span></a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="header">
                <h1>Admin Dashboard</h1>
                <div class="user-info">
                    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Admin">
                    <span>Admin User</span>
                </div>
            </div>

            <!-- Quick Actions Cards -->
            <div class="cards">
                <a href="RestaurantInsert.jsp" class="card">
                    <div class="card-icon restaurants">
                        <i class="fas fa-store"></i>
                    </div>
                    <h2>Add Restaurant</h2>
                    <p>Register a new restaurant to your platform</p>
                </a>
                
                <a href="DeliveryInsert.jsp" class="card">
                    <div class="card-icon delivery">
                        <i class="fas fa-motorcycle"></i>
                    </div>
                    <h2>Add Delivery Person</h2>
                    <p>Onboard new delivery personnel</p>
                </a>
                
                <a href="FoodInsert.jsp" class="card">
                    <div class="card-icon food">
                        <i class="fas fa-hamburger"></i>
                    </div>
                    <h2>Add Food Item</h2>
                    <p>Add new menu items to restaurants</p>
                </a>
            </div>

            <!-- Recent Activities Section -->
            <div class="content-section">
                <div class="section-header">
                    <h2><i class="fas fa-clock"></i> Recent Activities</h2>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Activity</th>
                            <th>Time</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#001</td>
                            <td>New order from Burger Palace</td>
                            <td>10 min ago</td>
                            <td><span class="status active">Processing</span></td>
                        </tr>
                        <tr>
                            <td>#002</td>
                            <td>Delivery person John Smith assigned</td>
                            <td>25 min ago</td>
                            <td><span class="status active">Completed</span></td>
                        </tr>
                        <tr>
                            <td>#003</td>
                            <td>New restaurant "Sushi World" added</td>
                            <td>1 hour ago</td>
                            <td><span class="status active">Completed</span></td>
                        </tr>
                        <tr>
                            <td>#004</td>
                            <td>5 new food items added to Pizza Heaven</td>
                            <td>2 hours ago</td>
                            <td><span class="status active">Completed</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Quick Stats Section -->
            <div class="content-section">
                <div class="section-header">
                    <h2><i class="fas fa-chart-pie"></i> Quick Stats</h2>
                </div>
                <div class="cards">
                    <div class="card">
                        <h2>Total Restaurants</h2>
                        <p>24</p>
                    </div>
                    <div class="card">
                        <h2>Active Delivery Persons</h2>
                        <p>15</p>
                    </div>
                    <div class="card">
                        <h2>Menu Items</h2>
                        <p>187</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>