package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.*;
import it.unisa.*;

	@WebServlet("/OrdineServlet2")
	public class OrdineServlet2 extends HttpServlet {
	  public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    Cart cart;
	    synchronized(session) {
	      cart = (Cart)session.getAttribute("Cart");
	      // New visitors get a fresh shopping cart.
	      // Previous visitors keep using their existing cart.
	      if (cart == null) {
	        cart = new Cart();
	        session.setAttribute("Cart", cart);
	      }
	      String itemID = request.getParameter("IDProdotto");
	      if (itemID != null) {
	        String numItemsString =
	          request.getParameter("Disponibilità");
	        if (numItemsString == null) {
	          // If request specified an ID but no number,
	          // then customers came here via an "Add Item to Cart"
	          // button on a catalog page.
	          cart.addItem(itemID);
	        } else {
	          // If request specified an ID and number, then
	          // customers came here via an "Update Order" button
	          // after changing the number of items in order.
	          // Note that specifying a number of 0 results
	          // in item being deleted from cart.
	          int numItems;
	          try {
	            numItems = Integer.parseInt(numItemsString);
	          } catch(NumberFormatException nfe) {
	            numItems = 1;
	          }
	          cart.setNumOrdered(itemID, numItems);
	        }
	      }}
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Ordini.jsp");
		dispatcher.forward(request, response);
	
	    }
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	}
