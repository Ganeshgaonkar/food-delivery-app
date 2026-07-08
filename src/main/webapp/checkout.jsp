<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Checkout</title>
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

    <main class="max-w-2xl mx-auto w-full px-6 py-12 flex-grow">
        
        <div class="mb-8">
            <a href="cart" class="text-gray-500 hover:text-orange-500 font-medium flex items-center transition mb-4 w-max">
                &larr; Back to Cart
            </a>
            <h1 class="text-4xl font-extrabold text-gray-900 tracking-tight">Checkout</h1>
            <p class="text-gray-500 mt-2 text-lg">Enter your delivery details to complete your order.</p>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div class="bg-red-50 border border-red-200 text-red-700 px-5 py-4 rounded-xl mb-6 shadow-sm flex items-center">
                <svg class="w-5 h-5 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path></svg>
                <span class="block sm:inline font-medium"><%= request.getAttribute("error") %></span>
            </div>
        <% } %>

        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-8">
            <form action="checkout" method="post" class="space-y-6">
                
                <div>
                    <label class="block text-gray-700 font-semibold mb-2" for="address">Delivery Address</label>
                    <input type="text" id="address" name="address" required 
                           class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 outline-none transition text-gray-800 bg-gray-50 focus:bg-white" 
                           placeholder="e.g., 123 Main Street, Apt 4B">
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold mb-2" for="paymentMethod">Payment Method</label>
                    <div class="relative">
                        <select id="paymentMethod" name="paymentMethod" 
                                class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 outline-none transition text-gray-800 bg-gray-50 focus:bg-white appearance-none cursor-pointer">
                            <option value="Cash on Delivery">Cash on Delivery</option>
                            <option value="Card">Credit / Debit Card</option>
                            <option value="UPI">UPI</option>
                        </select>
                        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-4 text-gray-500">
                            <svg class="fill-current h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
                        </div>
                    </div>
                </div>

                <div class="pt-4">
                    <button type="submit" class="w-full py-4 rounded-xl font-bold text-lg text-white gradient-accent hover:opacity-95 shadow-lg shadow-orange-500/30 transition-all hover:-translate-y-1">
                        Confirm & Place Order
                    </button>
                </div>

            </form>
        </div>

    </main>
</body>
</html>