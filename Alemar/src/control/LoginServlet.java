package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import it.unisa.*;
import javax.servlet.annotation.*;
@WebServlet("/Login")

/**
 * Servlet Implementazione LOGIN
 */
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			           throws ServletException, java.io.IOException {
			try{	    

		     AccountBean bean = new AccountBean();
		     bean.setNomeUtente(request.getParameter("Username"));
		     bean.setPassword(request.getParameter("Password"));
		     bean = UserDAO.doRetrieve(bean);
		
		     if (bean.isValid())
		     {  
		          HttpSession session = request.getSession(true);	    
		          session.setAttribute("currentSessionUser",bean); 
		          response.sendRedirect("ProductV.jsp"); //log-in page      		
		     }
			        
		     else 
		          response.sendRedirect("Registrazione.jsp"); //log-in ERRATO
		} 
				
				
		catch (Throwable theException) 	    
		{
		     System.out.println(theException); 
		}
		       
}
}
