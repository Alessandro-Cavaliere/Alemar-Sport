<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> ordini = (Collection<?>) request.getAttribute("ordini");
	if(ordini == null) {
		response.sendRedirect("./ordine");	
		return;
	}
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.*"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Ordini</title>
</head>

<body>
	<h2>Ordini</h2>
	<table border="1">
		<tr>
			<th>IDOrdine</th>
			<th>NumeroProdotti </th>
			<th>DescrizioneProdotti</th>
			<th>StatoOrdine</th>
			<th>DataSpedizione</th>
			<th>DataConsegna</th>
			<th>DataOrdine</th>
		</tr>
		<%
			if (ordini != null && ordini.size() != 0) {
				Iterator<?> it = ordini.iterator();
				while (it.hasNext()) {
					OrdineBean bean = (OrdineBean) it.next();
		%>
		<tr>
			<td><%=bean.getIDOrdine()%></td>
			<td><%=bean.getNumProdotti()%></td>
			<td><%=bean.getDescrizioneProdotti() %></td>
			<td><%=bean.getStatoOrdine() %></td>
			<td><%=bean.getDataSpedizione()%></td>
			<td><%=bean.getDataConsegna() %></td>
			<td><%=bean.getDataOrdine()%></td>
		
			
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">Non ci sono ordini</td>
		</tr>
		<%
			}
		%>
	</table>
	<a href="./ProductV.jsp">HOME</a>
</body>
</html>