<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fooddelivery.model.Restaurant" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Restaurants</title>
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
<body class="text-gray-800 min-h-screen">

    <nav class="gradient-accent text-white shadow-md sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
            <h1 class="text-2xl font-bold tracking-tight">Srinivas Eats</h1>
            <div class="space-x-6 font-medium">
                <a href="#" class="hover:opacity-90 transition">Home</a>
                <a href="#" class="hover:opacity-90 transition">Cart</a>
                <a href="#" class="hover:opacity-90 transition text-red-100">Logout</a>
            </div>
        </div>
    </nav>

    <header class="max-w-7xl mx-auto px-6 pt-12 pb-2">
        <h1 class="text-4xl font-extrabold text-gray-900 tracking-tight">Hungry? Your favorites, delivered.</h1>
        <p class="text-gray-500 mt-2 text-lg">Discover the finest spots around you.</p>
    </header>

    <div class="max-w-7xl mx-auto px-6 my-6">
        <div class="max-w-md">
            <input type="text"
                   placeholder="Search restaurants or cuisines..."
                   class="w-full px-4 py-3 bg-white border border-gray-200 rounded-xl shadow-sm text-gray-400 cursor-not-allowed outline-none"
                   disabled>
        </div>
    </div>

    <%
        @SuppressWarnings("unchecked")
        List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants");
    %>

    <main class="max-w-7xl mx-auto px-6 pb-16">
        
        <% if (restaurants == null || restaurants.isEmpty()) { %>
            
            <div class="text-center py-16 bg-white rounded-2xl shadow-sm border border-gray-100">
                <p class="text-gray-500 text-xl font-medium">No restaurants available right now.</p>
            </div>

        <% } else { %>

            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">

                <% for (Restaurant r : restaurants) { %>

                    <div class="bg-white rounded-2xl shadow-sm hover:shadow-xl transition-all duration-300 overflow-hidden border border-gray-100 flex flex-col justify-between group">
                        
                        <a href="menu?restaurantId=<%=r.getRestaurantId()%>" class="block h-full flex flex-col justify-between">
                            <div>
                                <div class="h-48 w-full overflow-hidden bg-gray-100 relative">
                                    <img 
                                        src="<%=r.getImageUrl()%>" 
                                        alt="<%=r.getName()%>"
                                        class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                                        onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=500&q=80';">
                                    
                                    <span class="absolute top-3 right-3 bg-white/90 backdrop-blur-sm text-gray-800 text-xs font-semibold px-3 py-1 rounded-full shadow-sm">
                                        <%=r.getCuisine()%>
                                    </span>
                                </div>
                                
                                <div class="p-6">
                                    <h3 class="text-xl font-bold text-gray-900 mb-1 group-hover:text-orange-500 transition-colors">
                                        <%=r.getName()%>
                                    </h3>
                                    <p class="text-gray-500 text-sm flex items-center mt-2">
                                        <svg class="w-4 h-4 mr-1 text-gray-400 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                        </svg>
                                        <%=r.getAddress()%>
                                    </p>
                                </div>
                            </div>
                            
                            <div class="px-6 pb-6 mt-4">
                                <span class="block text-center w-full py-3 rounded-xl font-semibold text-white gradient-accent shadow-md shadow-orange-500/10 group-hover:opacity-95 transition">
                                    View Menu
                                </span>
                            </div>
                        </a>

                    </div>

                <% } %>

            </div>

        <% } %>

    </main>

    <script>
        window.onload = function () {
            window.scrollTo(0, 0);
        };
    </script>

</body>
</html>