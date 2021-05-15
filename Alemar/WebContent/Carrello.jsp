<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
	
	OrdineBean ordine=(OrdineBean) request.getAttribute("ordine");
	AccountBean account= (AccountBean) session.getAttribute("currentSessionUser");
	ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");
	
	Cart cart = (Cart) request.getAttribute("Cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.*"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>ACQUISTO</title>
</head>

<body>

		<h2>Carrello</h2>
		<table border="1">
		<tr>
			<th>Nome</th>
			<th>Costo totale</th>
			<th>Quantità</th>
			<th>Action</th>
		</tr>
		<%
		List<CartProduct> ProdottiCarrello= cart.getProducts();
		   for(CartProduct beancart: ProdottiCarrello) {
		%>
		<tr>
			<% if(beancart.getPezzi()>0){ %>
			<td><%=beancart.getNome() %></td>
			<td><%=beancart.Costototale() %></td>
			<td><%=beancart.getPezzi() %></td>
			<td><a href="prodotto?action=deleteC&IDProdotto=<%=beancart.getIDProdotto()%>"><button>CANCELLA UN ARTICOLO</button></a></td>
			<%}}%>
			
			<%if(account!=null){ %>
			<tr><a href="prodotto?action=acquista"><button>ACQUISTA</button></a></tr>
			<%}%>
		<%if(account==null) {%><tr><a href="LoginPage.jsp"><button>ACQUISTA</button></a></tr>
		<%}%>
		</tr>
		
	</table>		
	<a href="./ProductV.jsp">HOME</a>
</body>
</html>