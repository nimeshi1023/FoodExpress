<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | YourBrand</title>
    <!-- Include Tailwind CSS directly -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center p-4">
    <div class="max-w-md w-full bg-white rounded-lg shadow-lg overflow-hidden">
        <div class="bg-indigo-600 py-6">
            <h2 class="text-center text-white text-2xl font-bold">Create Account</h2>
        </div>
        
        <div class="p-6">
            <form id="registerForm" action="StaffInsertServlet" method="post" class="space-y-6">
                <!-- Form fields remain the same -->
                <!-- Full Name -->
                <div>
                    <label for="name" class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
                    <input type="text" id="name" name="name" required
                        class="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
                        placeholder="Enter your full name">
                    <p id="name-error" class="mt-1 text-sm text-red-600 hidden">Name is required</p>
                </div>
                
                <!-- Email -->
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                    <input type="email" id="email" name="email" required
                        class="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
                        placeholder="Enter your email">
                    <p id="email-error" class="mt-1 text-sm text-red-600 hidden">Valid email address is required (e.g., example@domain.com)</p>
                </div>
                
                <!-- Password -->
                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                    <input type="password" id="password" name="password" required
                        class="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
                        placeholder="Create a password (min. 8 characters)">
                    <p id="password-error" class="mt-1 text-sm text-red-600 hidden">Password must be at least 8 characters</p>
                </div>
                
                <!-- Contact Number -->
                <div>
                    <label for="contactNo" class="block text-sm font-medium text-gray-700 mb-1">Contact Number</label>
                    <input type="tel" id="contactNo" name="contactNo" required
                        class="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
                        placeholder="Enter your 10-digit phone number">
                    <p id="contactNo-error" class="mt-1 text-sm text-red-600 hidden">Valid 10-digit phone number is required</p>
                </div>
                
                <!-- Profile Image -->
               
                
                <!-- Terms and Conditions -->
                <div class="flex items-start">
                    <input type="checkbox" id="terms" name="terms" required class="mt-1 h-4 w-4 text-indigo-600 border-gray-300 rounded">
                    <label for="terms" class="ml-2 block text-sm text-gray-700">
                        I agree to the <a href="#" class="text-indigo-600 hover:text-indigo-500">Terms and Conditions</a> and <a href="#" class="text-indigo-600 hover:text-indigo-500">Privacy Policy</a>
                    </label>
                </div>
                <p id="terms-error" class="mt-1 text-sm text-red-600 hidden">You must agree to the terms</p>
                
                <!-- Submit Button -->
                <div>
                    <button type="button" id="submitBtn"
                        class="w-full flex justify-center py-3 px-4 border border-transparent rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition duration-200">
                        Create Account
                    </button>
                </div>
                
                <!-- Login Link -->
                <div class="text-center text-sm text-gray-600">
                    Already have an account? <a href="Stafflogin.jsp" class="font-medium text-indigo-600 hover:text-indigo-500">Log in</a>
                </div>
            </form>
        </div>
    </div>

   <script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('registerForm');
        const submitBtn = document.getElementById('submitBtn');

        function validateEmail(email) {
            const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(String(email).toLowerCase());
        }

        function validatePhone(phone) {
            const digits = phone.replace(/\D/g, '');
            return digits.length === 10;
        }

        function validatePassword(password) {
            return password.length >= 8;
        }

        submitBtn.addEventListener('click', function () {
            let isValid = true;

            const nameInput = document.getElementById('name');
            const nameError = document.getElementById('name-error');
            if (!nameInput.value.trim()) {
                nameInput.classList.add('border-red-500');
                nameError.classList.remove('hidden');
                isValid = false;
            } else {
                nameInput.classList.remove('border-red-500');
                nameError.classList.add('hidden');
            }

            const emailInput = document.getElementById('email');
            const emailError = document.getElementById('email-error');
            if (!emailInput.value.trim() || !validateEmail(emailInput.value)) {
                emailInput.classList.add('border-red-500');
                emailError.classList.remove('hidden');
                isValid = false;
            } else {
                emailInput.classList.remove('border-red-500');
                emailError.classList.add('hidden');
            }

            const passwordInput = document.getElementById('password');
            const passwordError = document.getElementById('password-error');
            if (!passwordInput.value || !validatePassword(passwordInput.value)) {
                passwordInput.classList.add('border-red-500');
                passwordError.classList.remove('hidden');
                isValid = false;
            } else {
                passwordInput.classList.remove('border-red-500');
                passwordError.classList.add('hidden');
            }

            const contactInput = document.getElementById('contactNo');
            const contactError = document.getElementById('contactNo-error');
            if (!contactInput.value.trim() || !validatePhone(contactInput.value)) {
                contactInput.classList.add('border-red-500');
                contactError.classList.remove('hidden');
                isValid = false;
            } else {
                contactInput.classList.remove('border-red-500');
                contactError.classList.add('hidden');
            }

            const termsInput = document.getElementById('terms');
            const termsError = document.getElementById('terms-error');
            if (!termsInput.checked) {
                termsError.classList.remove('hidden');
                isValid = false;
            } else {
                termsError.classList.add('hidden');
            }

            if (isValid) {
                form.submit();
            }
        });

        // Clear errors on input
        const inputs = form.querySelectorAll('input');
        inputs.forEach(function(input) {
            input.addEventListener('input', function () {
                const inputId = this.id;
                if (this.type === 'checkbox') {
                    const errorElement = document.getElementById(inputId + '-error');
                    if (this.checked && errorElement) {
                        errorElement.classList.add('hidden');
                    }
                } else {
                    this.classList.remove('border-red-500');
                    const errorElement = document.getElementById(inputId + '-error');
                    if (errorElement) {
                        errorElement.classList.add('hidden');
                    }
                }
            });
        });

        // Only allow digits and phone formatting characters
        const contactInput = document.getElementById('contactNo');
        contactInput.addEventListener('input', function () {
            this.value = this.value.replace(/[^0-9-+() ]/g, '');
        });
    });
</script>
   
</body>
</html>