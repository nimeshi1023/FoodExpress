<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Food Express Login</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-blue-50 to-blue-100 min-h-screen flex items-center justify-center font-sans">
  <div class="w-full max-w-md bg-white shadow-2xl rounded-2xl p-8">
    <!-- Header (without logo) -->
    <div class="text-center mb-6">
      <h1 class="text-2xl font-bold text-blue-800">Food Express</h1>
      <p class="text-sm text-gray-600">Admin Login Portal</p>
    </div>

    <!-- Login Form -->
    <form action="StaffLoginServlet" method="post" class="space-y-5">
      <!-- Email -->
      <div>
        <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
        <input
          type="email"
          id="email"
          name="email"
          required
          placeholder="name@university.edu"
          class="w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      <!-- Password -->
      <div>
        <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
        <input
          type="password"
          id="password"
          name="password"
          required
          placeholder="********"
          class="w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>

      <!-- Login Button -->
      <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2 rounded-lg font-semibold transition duration-200" >
      Sign In
      </button>
    </form>

    <!-- Register and Help Links -->
    <div class="mt-4 flex justify-between text-sm text-gray-500">
      <a href="#" class="hover:text-blue-600">Forgot password?</a>
      <a href="#" class="hover:text-blue-600">Contact support</a>
    </div>

    <!-- Register Link -->
    <div class="text-center mt-6 text-sm text-gray-600">
      Don't have an account?
      <a href="Staffregister.jsp" class="text-blue-600 font-semibold hover:underline">Register here</a>
    </div>

    <!-- Footer -->
    <p class="text-center text-xs text-gray-400 mt-6">
      &copy; 2025 University Help Desk. All rights reserved.
    </p>
  </div>
</body>
</html>
    