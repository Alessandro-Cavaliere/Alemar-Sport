<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="it.unisa.AccountBean"
   %>
<% 
// Check user credentials
  AccountBean currentUser = (AccountBean) (session.getAttribute("currentSessionUser"));
if ((currentUser==null)||(!currentUser.isValid()))
{	
    response.sendRedirect("./LoginInvalido.jsp");
    return;
}

%>
 
   <!DOCTYPE html>

   <html>

      <head>
         <meta http-equiv="Content-Type" 
            content="text/html; charset=windows-1256">
         <title>   User Logged Successfully   </title>
      </head>
	
      <body>

       
         Welcome <%= currentUser.getNomeUtente() %>
         
        

      </body>
	
   </html>