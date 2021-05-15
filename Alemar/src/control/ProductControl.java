package control;

import java.io.IOException;
import java.util.Date;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.*;

/**
 * Servlet implementation class ProductControl
 */
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// ProductModelDS usa il DataSource
	// ProductModelDM usa il DriverManager	
	static boolean isDataSource = true;
	
	static ProductModel model;
	
	static {
			model = new ProductModelDS();
	}

	public ProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		AccountBean user= (AccountBean) request.getSession().getAttribute("currentSessionUser");
		
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("addC")) {
					String codice = (request.getParameter("IDProdotto"));
					cart.addProduct(new CartProduct(model.doRetrieveByKey(codice)));
					request.getSession().setAttribute("Cart", cart);
					request.setAttribute("Cart", cart);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Carrello.jsp");	
					dispatcher.forward(request, response);
				}  else if (action.equalsIgnoreCase("deleteC")) {
					String codice = (request.getParameter("IDProdotto"));
					cart.deleteProduct(new CartProduct(model.doRetrieveByKey(codice)));
					request.getSession().setAttribute("Cart", cart);
					request.setAttribute("Cart", cart);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Carrello.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("read")) {
					String id = (request.getParameter("IDProdotto"));
					request.removeAttribute("prodotto");
					request.setAttribute("prodotto", model.doRetrieveByKey(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/details.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("acquista")) {
					Cart c=(Cart)request.getSession().getAttribute("cart");
					OrdineDAO.doSave(c,user);
					request.setAttribute("ordini", OrdineDAO.doRetrieveAll(c));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Ordini.jsp");
					dispatcher.forward(request, response);
					return;
				} 
				
			}			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
		
		String sort = request.getParameter("sort");

		request.removeAttribute("prodotti");
		try {
			request.setAttribute("prodotti", model.doRetrieveAll(sort));
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductV.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
