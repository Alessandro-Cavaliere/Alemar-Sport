
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");

%>

<!DOCTYPE html>
<html>
	<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.*"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>AlemarSport DS/BF</title>
</head>
	
	<body>
		<h2>Details</h2>
		
		<table border="1">
			<tr>
				<th>Codice</th>
				<th>Nome</th>
				<th>Descrizione</th>
				<th>Prezzo</th>
				<th>Quantità</th>
				<th>Sconto</th>
			</tr>
			
			<tr>
				<td><%=prodotto.getCode()%></td>
				<td><%=prodotto.getName()%></td>
				<td><%=prodotto.getDescription()%></td>
				<td><%=prodotto.getPrice()%></td>
				<td><%=prodotto.getQuantity()%></td>
				<td><%=prodotto.getSconto()%></td>
				
				<td><a href="prodotto?action=addC&IDProdotto=<%=prodotto.getCode()%>"target=_blank><button>INSERIMENTO CARRELLO</button></a></td>		
			</tr>
		
		</table>
		<a href="./ProductV.jsp">HOME</a>
	</body>
</html>