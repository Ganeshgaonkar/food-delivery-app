<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Srinivas Eats | Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa; /* Clean light background */
        }
        .gradient-accent {
            background: linear-gradient(135deg, #ff6b6b 0%, #ff8e53 100%);
        }
        /* Soft, premium 3D Claymorphism style */
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

    <div class="mb-8 text-center">
        <h1 class="text-3xl font-extrabold text-transparent bg-clip-text gradient-accent tracking-tight mb-2">
            Srinivas Eats
        </h1>
        <p class="text-gray-500 font-medium">Your favorites, delivered.</p>
    </div>

    <div class="w-full max-w-md clay-panel p-8 sm:p-10 transition-all duration-300">
        
        <h2 class="text-2xl font-bold text-gray-900 mb-6 text-center tracking-tight">Welcome Back</h2>

        <% if (request.getAttribute("error") != null) { %>
            <div class="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-xl mb-6 text-sm font-medium flex items-center">
                <svg class="w-5 h-5 mr-2 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path></svg>
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <% if (request.getAttribute("message") != null) { %>
            <div class="bg-teal-50 border border-teal-200 text-teal-700 px-4 py-3 rounded-xl mb-6 text-sm font-medium flex items-center">
                <svg class="w-5 h-5 mr-2 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path></svg>
                <%= request.getAttribute("message") %>
            </div>
        <% } %>

        <form action="login" method="post" class="space-y-5">
            
            <div>
                <label class="block text-gray-700 font-semibold mb-2 text-sm" for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="you@example.com" required
                       class="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:bg-white focus:ring-2 focus:ring-orange-500 focus:border-orange-500 outline-none transition-all text-gray-800 placeholder-gray-400">
            </div>

            <div>
                <label class="block text-gray-700 font-semibold mb-2 text-sm" for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="••••••••" required
                       class="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:bg-white focus:ring-2 focus:ring-orange-500 focus:border-orange-500 outline-none transition-all text-gray-800 placeholder-gray-400">
            </div>

            <div class="pt-2">
                <button type="submit" 
                        class="w-full py-3.5 rounded-xl font-bold text-white gradient-accent shadow-lg shadow-orange-500/20 hover:-translate-y-0.5 hover:opacity-95 transition-all duration-200">
                    Sign In
                </button>
            </div>
            
        </form>

        <div class="mt-8 pt-6 border-t border-gray-100 text-center">
            <p class="text-gray-500 text-sm">
                New here? 
                <a href="signup.jsp" class="font-bold text-orange-500 hover:text-orange-600 transition-colors ml-1">
                    Create an account
                </a>
            </p>
        </div>

    </div>

</body>
</html>