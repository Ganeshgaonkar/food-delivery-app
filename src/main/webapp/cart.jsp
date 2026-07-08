<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fooddelivery.model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Your Cart</title>
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
    </style>
</head>
<body class="text-gray-800 min-h-screen flex flex-col">

    <nav class="gradient-accent text-white shadow-md sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
            <h1 class="text-2xl font-bold tracking-tight">Srinivas Eats</h1>
            <div class="space-x-6 font-medium">
                <a href="restaurants" class="hover:opacity-90 transition">Home</a>
                <a href="cart" class="hover:opacity-90 transition border-b-2 border-white pb-1">Cart</a>
                <a href="logout" class="hover:opacity-90 transition text-red-100">Logout</a>
            </div>
        </div>
    </nav>

    <main class="max-w-4xl mx-auto w-full px-6 py-12 flex-grow">
        
        <div class="flex justify-between items-end mb-8">
            <div>
                <h1 class="text-4xl font-extrabold text-gray-900 tracking-tight">Your Cart</h1>
                <a href="restaurants" class="text-orange-500 hover:text-orange-600 font-medium flex items-center mt-2 transition">
                    &larr; Back to Restaurants
                </a>
            </div>
        </div>

        <%
            @SuppressWarnings("unchecked")
            List<CartItem> cart = (List<CartItem>) request.getAttribute("cart");
            double total = 0;
        %>

        <% if (cart == null || cart.isEmpty()) { %>
            
            <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-16 text-center">
                <svg class="w-20 h-20 mx-auto text-gray-200 mb-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                <h2 class="text-2xl font-bold text-gray-900 mb-2">Your cart is empty</h2>
                <p class="text-gray-500 mb-6">Looks like you haven't added anything to your cart yet.</p>
                <a href="restaurants" class="inline-block px-8 py-3 rounded-xl font-semibold text-white gradient-accent hover:opacity-95 shadow-md shadow-orange-500/20 transition-all">
                    Start Browsing
                </a>
            </div>

        <% } else { %>
            
            <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden mb-8">
                <ul class="divide-y divide-gray-100">
                    <% 
                        for (CartItem ci : cart) {
                            total += ci.getSubtotal();
                    %>
                        <li class="p-6 flex justify-between items-center hover:bg-gray-50 transition-colors">
                            <div>
                                <h3 class="text-lg font-bold text-gray-900"><%= ci.getMenuItem().getItemName() %></h3>
                                <p class="text-gray-500 text-sm mt-1">
                                    Qty: <span class="font-semibold text-gray-700"><%= ci.getQuantity() %></span> &times; ₹<%= String.format("%.2f", ci.getMenuItem().getPrice()) %>
                                </p>
                            </div>
                            <div class="text-right">
                                <span class="block text-xl font-extrabold text-gray-900">
                                    ₹<%= String.format("%.2f", ci.getSubtotal()) %>
                                </span>
                            </div>
                        </li>
                    <% } %>
                </ul>
            </div>

            <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 md:p-8 flex flex-col md:flex-row justify-between items-center">
                <div class="text-center md:text-left mb-6 md:mb-0">
                    <p class="text-gray-500 font-medium uppercase tracking-wider text-sm mb-1">Total Amount</p>
                    <h2 class="text-4xl font-extrabold text-gray-900">₹<%= String.format("%.2f", total) %></h2>
                </div>
                
                <a href="checkout" class="w-full md:w-auto text-center px-10 py-4 rounded-xl font-bold text-lg text-white gradient-accent hover:opacity-95 shadow-lg shadow-orange-500/30 transition-all hover:-translate-y-1">
                    Proceed to Checkout &rarr;
                </a>
            </div>

        <% } %>

    </main>

</body>
</html>