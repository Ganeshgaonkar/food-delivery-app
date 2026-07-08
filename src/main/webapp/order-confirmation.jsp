<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fooddelivery.model.Order" %>
<%@ page import="com.fooddelivery.model.OrderItem" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Order Confirmed</title>
    <!-- Google Fonts & Tailwind CSS for an instantly clean, modern look -->
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

    <!-- Premium Clean Navbar -->
    <nav class="gradient-accent text-white shadow-md sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
            <h1 class="text-2xl font-bold tracking-tight">Srinivas Eats</h1>
            <div class="space-x-6 font-medium">
                <a href="restaurants" class="hover:opacity-90 transition">Home</a>
                <a href="order-history" class="hover:opacity-90 transition">My Orders</a>
                <a href="logout" class="hover:opacity-90 transition text-red-100">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Main Content Container -->
    <main class="max-w-3xl mx-auto w-full px-6 py-12 flex-grow">

        <%
            Order order = (Order) request.getAttribute("order");
            @SuppressWarnings("unchecked")
            List<OrderItem> items = (List<OrderItem>) request.getAttribute("items");
        %>

        <!-- Digital Receipt Card -->
        <div class="bg-white rounded-3xl shadow-sm border border-gray-100 overflow-hidden mb-8">
            
            <!-- Success Header Banner -->
            <div class="bg-green-50 px-8 py-10 text-center border-b border-green-100">
                <div class="w-20 h-20 mx-auto bg-green-100 rounded-full flex items-center justify-center mb-4">
                    <svg class="w-10 h-10 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"></path>
                    </svg>
                </div>
                <h1 class="text-3xl font-extrabold text-green-800 tracking-tight mb-2">Order Confirmed!</h1>
                <p class="text-green-600 font-medium text-lg">Thank you! Your food is currently being prepared.</p>
            </div>

            <div class="p-8">
                <!-- Order Summary Details -->
                <div class="bg-gray-50 rounded-2xl p-6 mb-8 border border-gray-100">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <p class="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-1">Order Number</p>
                            <p class="text-lg font-bold text-gray-900">#<%= order.getOrderId() %></p>
                        </div>
                        <div>
                            <p class="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-1">Status</p>
                            <span class="inline-block px-3 py-1 text-xs font-bold rounded-full bg-orange-100 text-orange-700 uppercase tracking-wide">
                                <%= order.getStatus() %>
                            </span>
                        </div>
                        <div>
                            <p class="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-1">Payment Method</p>
                            <p class="font-medium text-gray-800"><%= order.getPaymentMethod() %></p>
                        </div>
                        <div>
                            <p class="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-1">Delivering To</p>
                            <p class="font-medium text-gray-800 leading-relaxed"><%= order.getDeliveryAddress() %></p>
                        </div>
                    </div>
                </div>

                <!-- Line Items Breakdown -->
                <h3 class="text-xl font-bold text-gray-900 mb-4 border-b border-gray-100 pb-3">Order Details</h3>
                <ul class="divide-y divide-gray-100 mb-6">
                    <% for (OrderItem oi : items) { %>
                        <li class="py-4 flex justify-between items-center">
                            <div>
                                <h4 class="text-lg font-bold text-gray-800"><%= oi.getItemName() %></h4>
                                <p class="text-gray-500 text-sm mt-1">Qty: <span class="font-semibold text-gray-700"><%= oi.getQuantity() %></span></p>
                            </div>
                            <div class="text-right">
                                <span class="block text-lg font-bold text-gray-900">
                                    ₹<%= String.format("%.2f", oi.getSubtotal()) %>
                                </span>
                            </div>
                        </li>
                    <% } %>
                </ul>

                <!-- Grand Total -->
                <div class="border-t-2 border-dashed border-gray-200 pt-6 mt-4 flex justify-between items-end">
                    <span class="text-gray-500 font-bold uppercase tracking-wider">Total Paid</span>
                    <span class="text-4xl font-extrabold text-gray-900">
                        ₹<%= String.format("%.2f", order.getTotalAmount()) %>
                    </span>
                </div>
            </div>
            
        </div>

        <!-- Next Action Button -->
        <div class="text-center">
            <a href="restaurants" class="inline-block px-8 py-4 rounded-xl font-bold text-lg text-white gradient-accent shadow-lg shadow-orange-500/30 hover:-translate-y-1 hover:opacity-95 transition-all">
                &larr; Order from another restaurant
            </a>
        </div>

    </main>

</body>
</html>