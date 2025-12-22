<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Restaurant - Create Record</title>
    <link rel="icon" href="./assets/img1.jpg" type="image/x-icon">
    <script src="https://unpkg.com/lucide@latest"></script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100" style="background-color: #FFC594">
    <div class="flex h-screen">
        <!-- Form Section -->
            <main class="p-6 flex-1">
                <div class="bg-white p-6 rounded-md shadow-md max-w-2xl mx-auto">
                    <h2 class="text-lg font-semibold mb-4" style="color:#C35817">Add Restaurant Details</h2>
                    <form action=" RestaurantInsertServlet" method="post">
                        <div class="mb-4">
                            <label class="block text-gray-700">Restaurant Name</label>
                            <input type="text" class="w-full px-4 py-2 border rounded-md focus:ring focus:ring-blue-300" name="name" required placeholder="Enter name">
                        </div>
                        
                        <div class="mb-4">
                            <label class="block text-gray-700">Restaurant Location</label>
                            <input type="text" class="w-full px-4 py-2 border rounded-md focus:ring focus:ring-blue-300" name="location" required placeholder="Enter Location">
                        </div>
                        
                        <div class="mb-4">
                            <label class="block text-gray-700">Restaurant Description</label>
                            <input type="text" class="w-full px-4 py-2 border rounded-md focus:ring focus:ring-blue-300" name="description" required placeholder="Enter Description" >
                           
                        </div>

                    
                        <div class="mb-4">
                            <label class="block text-gray-700">Phone</label>
                            <input type="text" class="w-full px-4 py-2 border rounded-md focus:ring focus:ring-blue-300" name="pno" required placeholder="Enter phone number">
                        
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700">Email</label>
                            <input type="email" class="w-full px-4 py-2 border rounded-md focus:ring focus:ring-blue-300" name="email" required placeholder="Enter email" id="email">
                             <small id="emailError" class="text-red-500 hidden">Enter a valid email address.</small>
                        </div>
                        
                        <div class="flex justify-between">
                            <a href="dashboard.html" class="bg-gray-500 text-white px-4 py-2 rounded-md hover:bg-gray-600">Cancel</a>
                            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600" style="background-color: #C35817">Submit</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    

    <script>
        lucide.createIcons();
  
        const emailInput = document.getElementById('email');
        const emailError = document.getElementById('emailError');

      
        emailInput.addEventListener('input', () => {
            const email = emailInput.value.trim();
            const emailRegex = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/i;

            if (emailRegex.test(email)) {
                emailError.classList.add('hidden');
            } else {
                emailError.classList.remove('hidden');
            }
        });
    </script>
    
    
</body>
</html>
    