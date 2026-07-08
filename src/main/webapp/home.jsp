<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.fooddelivery.model.User" %>
<%
    User user = (User) session.getAttribute("loggedInUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa;
        }
        .gradient-accent {
            background: linear-gradient(135deg, #ff6b6b 0%, #ff8e53 100%);
        }
        /* Soft, premium 3D Claymorphism style matching style.css definitions */
        .clay-panel {
            background: #ffffff;
            border-radius: 24px;
            border: 1px solid rgba(255, 255, 255, 0.8);
            box-shadow: 
                inset 0 4px 8px rgba(255, 255, 255, 0.8),
                inset 0 -6px 12px rgba(0, 0, 0, 0.02),
                0 12px 24px rgba(0, 0, 0, 0.04);
        }
    </style>
</head>
<body class="text-gray-800 min-h-screen flex flex-col justify-center items-center p-6">

    <div class="w-full max-w-md clay-panel p-8 text-center transition-all duration-300">
        
        <div class="w-20 h-20 mx-auto gradient-accent rounded-2xl shadow-md shadow-orange-500/20 flex items-center justify-center text-white mb-6">
            <svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
            </svg>
        </div>

        <h2 class="text-3xl font-extrabold text-gray-900 tracking-tight mb-1">
            Welcome, <%= user.getName() %>!
        </h2>
        <p class="text-gray-500 text-sm mb-8">
            Logged in as <span class="font-medium text-gray-700"><%= user.getEmail() %></span>
        </p>

        <div class="space-y-3">
            <a href="restaurants" 
               class="block w-full py-3.5 rounded-xl font-bold text-white gradient-accent hover:opacity-95 shadow-lg shadow-orange-500/10 transition hover:-translate-y-0.5">
                Browse Restaurants &rarr;
            </a>
            
            <a href="order-history" 
               class="block w-full py-3.5 rounded-xl font-semibold text-gray-700 bg-gray-50 hover:bg-gray-100 border border-gray-200 transition">
                My Order History
            </a>
        </div>

        <hr class="my-6 border-gray-100">

        <div class="text-center">
            <a href="logout" class="text-sm font-semibold text-red-500 hover:text-red-600 transition-colors">
                Sign Out Securely
            </a>
        </div>
        
    </div>

</body>
</html>