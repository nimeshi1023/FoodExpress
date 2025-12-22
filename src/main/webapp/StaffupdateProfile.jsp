<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="staff_login.staffModel" %>

<%
    staffModel staff = (staffModel) session.getAttribute("staff");
    if (staff == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int staffId = staff.getId();
    String name = staff.getName();
    String email = staff.getEmail();
    String phone = String.valueOf(staff.getContactNo());
    String password = staff.getPassword();
   
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 min-h-screen">

    <!-- Header -->
    <header class="bg-indigo-600 text-white p-4 shadow-md">
        <div class="max-w-7xl mx-auto">
            <h1 class="text-2xl font-bold">Update Profile</h1>
        </div>
    </header>

    <!-- Profile Update Card -->
    <main class="max-w-4xl mx-auto mt-10 bg-white p-8 rounded-lg shadow-md">
        <div class="flex flex-col items-center space-y-6">

            <!-- Profile Image -->
           

            <!-- Form -->
            <form action="UpdateStaffProfileServlet" method="post" enctype="multipart/form-data" class="w-full space-y-6">

                <!-- Name -->
                <div>
                    <label class="block text-gray-700 font-semibold mb-2" for="name">Name</label>
                    <input type="text" id="name" name="name" value="<%= name %>"
                        class="w-full border px-4 py-2 rounded-md focus:ring-2 focus:ring-indigo-400" required />
                </div>

                <!-- Email -->
                <div>
                    <label class="block text-gray-700 font-semibold mb-2" for="email">Email</label>
                    <input type="email" id="email" name="email" value="<%= email %>"
                        class="w-full border px-4 py-2 rounded-md focus:ring-2 focus:ring-indigo-400" required />
                </div>

                <!-- Phone -->
                <div>
                    <label class="block text-gray-700 font-semibold mb-2" for="contactNo">Phone</label>
                    <input type="text" id="contactNo" name="contactNo" value="<%= phone %>"
                        class="w-full border px-4 py-2 rounded-md focus:ring-2 focus:ring-indigo-400" required />
                </div>

                <!-- Password -->
                <div>
                    <label class="block text-gray-700 font-semibold mb-2" for="password">Password</label>
                    <input type="password" id="password" name="password" value="<%= password %>"
                        class="w-full border px-4 py-2 rounded-md focus:ring-2 focus:ring-indigo-400" required />
                </div>

                <!-- Image Upload -->
              

                <!-- Submit Button -->
                <div class="text-right">
                    <button type="submit"
                        class="bg-indigo-600 text-white px-6 py-2 rounded-md hover:bg-indigo-700 transition duration-300">
                        Save Changes
                    </button>
                </div>
            </form>
        </div>
    </main>

</body>
</html>
