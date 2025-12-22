<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <script src="https://unpkg.com/lucide@latest"></script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="flex min-h-screen">
        <!-- Sidebar -->
        <aside class="w-64 bg-gray-800 text-white p-5 space-y-6">
            <h2 class="text-2xl font-bold">Admin Panel</h2>
            <nav>
                <ul class="space-y-4">
                    <li><a href="Admindashbord.jsp" class="flex items-center space-x-2 hover:text-gray-300"><i data-lucide="home"></i> <span>Dashboard</span></a></li>
                    <li><a href="#" class="flex items-center space-x-2 hover:text-gray-300"><i data-lucide="users"></i> <span>User Management</span></a></li>
                    <li><a href="#" class="flex items-center space-x-2 hover:text-gray-300"><i data-lucide="users"></i> <span>Restuarant Management</span></a></li>
                    <li><a href="#" class="flex items-center space-x-2 hover:text-gray-300"><i data-lucide="users"></i> <span>Menu Items Management</span></a></li>
                    <li><a href="#" class="flex items-center space-x-2 hover:text-gray-300"><i data-lucide="users"></i> <span>Delivery Person Management</span></a></li>
                    <li><a href="#" class="flex items-center space-x-2 hover:text-gray-300"><i data-lucide="settings"></i> <span>Settings</span></a></li>
                </ul>
            </nav>
        </aside>
        
        <!-- Main Content -->
        <div class="flex-1 flex flex-col">
            <!-- Top Bar -->
            <header class="bg-white shadow-md p-4 flex justify-between items-center">
                <h2 class="text-xl font-semibold">Dashboard</h2>
                <div class="flex items-center space-x-4">
                    <img src="image/img1.jpg" alt="Admin Profile" style="width: 32px; height: 32px; border-radius: 50%; object-fit: cover; border: 1px solid #ccc;">
                    <span class="text-gray-700">Admin Name</span>
                    <button class="bg-red-500 text-white px-4 py-2 rounded-md hover:bg-red-600">Logout</button>
                </div>
            </header>
            
            <!-- Table Section -->
            <main class="p-6">
                <div class="bg-white p-4 rounded-md shadow-md">
                    <div class="flex justify-between mb-4">
                        <h3 class="text-lg font-semibold">Foods Records</h3>
                        <button class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600 flex items-center space-x-2" onclick="location.href='FoodInsert.jsp'">
                            <i data-lucide="plus"></i>
                            <span>Create New Record</span>
                        </button>
                    </div>
                    <table class="w-full border-collapse border border-gray-200">
                        <thead>
                            <tr class="bg-gray-100">
                                <th class="border border-gray-300 px-4 py-2">ID</th>
                                <th class="border border-gray-300 px-4 py-2">Name</th>
                                <th class="border border-gray-300 px-4 py-2">Restaurant Name</th>
                                <th class="border border-gray-300 px-4 py-2">Category</th>
                                <th class="border border-gray-300 px-4 py-2">Available</th>
                                <th class="border border-gray-300 px-4 py-2">Size</th>
                                <th class="border border-gray-300 px-4 py-2">Price</th>
                                 <th class="border border-gray-300 px-4 py-2">Action</th>
                                
                            </tr>
                        </thead>
                       <c:forEach var="food"  items="${allFoods}">
                        <tr>
                            <td class="border border-gray-300 px-4 py-2">${food.food_id}</td>
                            <td class="border border-gray-300 px-4 py-2">${food.name}</td>
                            <td class="border border-gray-300 px-4 py-2">${food.res_name}</td>
                            <td class="border border-gray-300 px-4 py-2">${food.category}</td>
                            <td class="border border-gray-300 px-4 py-2">${food.available}</td>
                            <td class="border border-gray-300 px-4 py-2">${food.size}</td>
                            <td class="border border-gray-300 px-4 py-2">${food.price}</td>
                            <td class="border border-gray-300 px-4 py-2 space-x-2">
                            <div class="flex items-center space-x-2">
    						<a href="FoodUpdate.jsp?food_id=${food.food_id}&name=${food.name}&res_name=${food.res_name}&category=${food.category}&available=${food.available}&size=${food.size}&price=${food.price}">
        						<button class="bg-yellow-500 text-white px-3 py-1 rounded-md hover:bg-yellow-600">
            						<i data-lucide="edit"></i>
        						</button>
    						</a>
    						<form action="FoodDeleteServlet" method="POST">
        						<input type="hidden" name="food_id" value="${food.food_id}"/>
        						<button class="bg-red-500 text-white px-3 py-1 rounded-md hover:bg-red-600" onclick="return confirm('Are you sure you want to delete this record?')">
            					<i data-lucide="trash"></i>
        						</button>
    						</form>
							</div>

                        </tr>
                       </c:forEach>
                    </table>
                </div>
            </main>
        </div>
    </div>

    <script>
        lucide.createIcons();
    </script>
</body>
</html>
    