<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
	
	
	ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");
	
	Cart cart = (Cart) request.getAttribute("Cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.*"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	
</head>

<body>
		<h1>Grazie per l'acquisto!!</h1>
 		<a href="./ProductV.jsp"><button>HOME</button></a>
</body>
</html>
