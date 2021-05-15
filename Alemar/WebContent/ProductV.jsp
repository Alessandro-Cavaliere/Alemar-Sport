<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
	if(prodotti == null) {
		response.sendRedirect("./prodotto");	
		return;
	}
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.ProductBean"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>AlemarSport DS/BF</title>
</head>

<body>
	<h2>Prodotti</h2>
	<table border="1">
		<tr>
			<th>IDProdotto</th>
			<th>Nome </th>
			<th>Descrizione </th>
			<th>Prezzo</th>
			<th>Sconto</th>
			<th>Azioni</th>
		</tr>
		<%
			if (prodotti != null && prodotti.size() != 0) {
				Iterator<?> it = prodotti.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
		<tr>
			<td><%=bean.getCode()%></td>
			<td><%=bean.getName()%></td>
			<td><%=bean.getDescription()%></td>
			<td><%=bean.getPrice() %></td>
			<td><%=bean.getSconto() %></td>
			<td><a href="prodotto?action=read&IDProdotto=<%=bean.getCode()%>" target=_blank><button>DETTAGLI</button></a>
			<br>
			<a href="prodotto?action=addC&IDProdotto=<%=bean.getCode()%>"target=_blank><button>INSERIMENTO CARRELLO</button></a></td>
			
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">Non ci sono prodotti</td>
		</tr>
		<%
			}
		%>
	</table>
	<a href="Login.jsp">Login</a>
	<a href="Registrazione.jsp">Registrati</a>
	<a href="Carrello.jsp">CARRELLO</a>
</body>
</html>