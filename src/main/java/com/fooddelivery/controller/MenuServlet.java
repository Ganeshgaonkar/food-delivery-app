package com.fooddelivery.controller;

import com.fooddelivery.dao.MenuItemDao;
import com.fooddelivery.dao.RestaurantDao;
import com.fooddelivery.dao.impl.MenuItemDaoImpl;
import com.fooddelivery.dao.impl.RestaurantDaoImpl;
import com.fooddelivery.model.MenuItem;
import com.fooddelivery.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read the restaurantId query param from the URL (?restaurantId=1)
        String restaurantIdParam = request.getParameter("restaurantId");

        if (restaurantIdParam == null) {
            response.sendRedirect("restaurants");
            return;
        }

        int restaurantId = Integer.parseInt(restaurantIdParam);

        RestaurantDao restaurantDao = new RestaurantDaoImpl();
        MenuItemDao menuItemDao = new MenuItemDaoImpl();

        Restaurant restaurant = restaurantDao.getRestaurantById(restaurantId);
        List<MenuItem> menuItems = menuItemDao.getMenuByRestaurantId(restaurantId);

        request.setAttribute("restaurant", restaurant);
        request.setAttribute("menuItems", menuItems);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}