<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fooddelivery.model.MenuItem" %>
<%@ page import="com.fooddelivery.model.Restaurant" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Menu</title>
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
                <a href="cart" class="hover:opacity-90 transition">Cart</a>
                <a href="logout" class="hover:opacity-90 transition text-red-100">Logout</a>
            </div>
        </div>
    </nav>

    <main class="max-w-7xl mx-auto w-full px-6 py-8 flex-grow">

        <%
            Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
            @SuppressWarnings("unchecked")
            List<MenuItem> menuItems = (List<MenuItem>) request.getAttribute("menuItems");
        %>

        <a href="restaurants" class="inline-flex items-center text-gray-500 hover:text-orange-500 font-medium transition mb-6">
            &larr; Back to all restaurants
        </a>

        <% if (restaurant == null) { %>
            <div class="bg-white rounded-2xl p-12 text-center border border-gray-100 shadow-sm">
                <h2 class="text-2xl font-bold text-gray-900">Restaurant not found.</h2>
            </div>
        <% } else { %>
            
            <div class="bg-white rounded-3xl overflow-hidden shadow-sm border border-gray-100 mb-10 flex flex-col md:flex-row">
                <div class="md:w-1/3 h-48 md:h-auto bg-gray-200 relative">
                    <img src="<%= restaurant.getImageUrl() %>" alt="<%= restaurant.getName() %>" 
                         class="w-full h-full object-cover"
                         onerror="this.src='https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=500&q=80';">
                </div>
                <div class="md:w-2/3 p-8 flex flex-col justify-center">
                    <div class="flex justify-between items-start mb-2">
                        <h1 class="text-4xl font-extrabold text-gray-900 tracking-tight"><%= restaurant.getName() %></h1>
                        <span class="inline-block px-4 py-1.5 bg-orange-100 text-orange-700 text-sm font-bold rounded-full uppercase tracking-wide">
                            <%= restaurant.getCuisine() %>
                        </span>
                    </div>
                    <p class="text-gray-500 flex items-center mt-2 mb-6 text-lg">
                        <svg class="w-5 h-5 mr-2 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path></svg>
                        <%= restaurant.getAddress() %>
                    </p>
                    <div>
                        <a href="cart" class="inline-flex items-center px-6 py-3 rounded-xl font-bold text-gray-900 bg-gray-100 hover:bg-gray-200 transition-colors">
                            <svg class="w-5 h-5 mr-2 text-orange-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                            View Cart & Checkout
                        </a>
                    </div>
                </div>
            </div>

            <h2 class="text-2xl font-bold text-gray-900 mb-6">Menu Items</h2>
            
            <% if (menuItems == null || menuItems.isEmpty()) { %>
                <div class="text-center py-12 bg-white rounded-2xl shadow-sm border border-gray-100">
                    <p class="text-gray-500 text-lg">This restaurant hasn't added any menu items yet.</p>
                </div>
            <% } else { %>
                
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <% for (MenuItem item : menuItems) { %>
                        
                        <div class="bg-white rounded-2xl shadow-sm hover:shadow-lg transition-shadow duration-300 border border-gray-100 flex flex-col overflow-hidden group">
                            
                            <div class="w-full h-48 bg-gray-100 overflow-hidden relative">
                                <img src="<%= item.getImageUrl() %>" alt="<%= item.getItemName() %>" 
                                     class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                                     onerror="this.src='https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=500&q=80';">
                            </div>

                            <div class="p-6 flex flex-col flex-grow">
                                <div class="flex justify-between items-start mb-2">
                                    <h3 class="text-xl font-bold text-gray-900 group-hover:text-orange-500 transition-colors pr-2">
                                        <%= item.getItemName() %>
                                    </h3>
                                    <span class="text-lg font-extrabold text-gray-900 bg-gray-50 px-3 py-1 rounded-lg">
                                        ₹<%= String.format("%.2f", item.getPrice()) %>
                                    </span>
                                </div>
                                <p class="text-gray-500 text-sm mb-6 line-clamp-2">
                                    <%= item.getDescription() %>
                                </p>
                                
                                <form action="add-to-cart" method="post" class="mt-auto">
                                    <input type="hidden" name="itemId" value="<%= item.getItemId() %>"/>
                                    <input type="hidden" name="restaurantId" value="<%= restaurant.getRestaurantId() %>"/>
                                    <button type="submit" class="w-full py-3 rounded-xl font-bold text-orange-600 bg-orange-50 hover:bg-orange-500 hover:text-white border border-orange-100 transition-colors flex items-center justify-center">
                                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                                        Add to Cart
                                    </button>
                                </form>
                            </div>
                        </div>

                    <% } %>
                </div>
            <% } %>
        <% } %>

    </main>
</body>
</html>