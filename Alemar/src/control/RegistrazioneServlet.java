package control;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.AccountBean;
import it.unisa.UserDAO;

@WebServlet("/Registrazione")
/**
 * Servlet Implementazione Registrazione
 */
public class RegistrazioneServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
	                       throws ServletException, java.io.IOException {
	try{
		String Username = request.getParameter("Username");
		String Password = request.getParameter("Password");
		String Nome = request.getParameter("Nome");
		String Cognome = request.getParameter("Cognome");
		String Email =request.getParameter("Email");
		String CF = request.getParameter("CF");
		Date x=new Date();
		java.sql.Date DataRegistrazione = new java.sql.Date(x.getTime());
		AccountBean bean = new AccountBean();
		bean.setUsername(Username);
		bean.setPassword(Password);
		bean.setDataRegistrazione(DataRegistrazione);
		bean.setNome(Nome);
		bean.setCognome(Cognome);
		bean.setEmail(Email);
		bean.setCF(CF);
		UserDAO.doSave(bean);
		System.out.println(bean);
		
			
	  if (bean.isValid())
	     {
	          HttpSession session = request.getSession(true);
	          session.setAttribute("currentSessionUser",bean); 
	          response.sendRedirect("LoginPage.jsp"); //logged-in page
	     }

	     else 
	          response.sendRedirect("Registrazione.jsp"); //error page 
	} 
	    		
	catch (Throwable theException) {
	     System.out.println(theException); 
	     }
	}

protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	doGet(request, response);
}
}
		
	       

