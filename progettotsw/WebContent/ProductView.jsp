<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Storage DS/BF</title>
</head>

<body>
	<h2>Products</h2>
	<a href="product?action=vediordini">ORDINI</a>
	<a href="product?action=vedicarrello">CART</a>
	<a href="LoginPage.jsp">LOGIN</a>
	<a href="Paginadiregistrazione.jsp">REGISTRAZIONE</a>
	<a href="product?action=vediordini">ORDINI</a>
	<table border="1">
		<tr>
			<th>Codice <a href="product?sort=code">Sort</a></th>
			<th>Nome<a href="product?sort=name">Sort</a></th>
			<th>Prezzo</th>
			<th>Quantità</th>
			<th>Descrizione <a href="product?sort=description">Sort</a></th>
			<th>Azione</th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
					%>
		<tr>
			<td><%=bean.getCode()%></td>
			<td><%=bean.getName()%></td>
			<td><%=bean.getPrice()%></td>
			<td><%=bean.getQuantity()%></td>
			<td><%=bean.getDescription()%></td>
			<td><a href="product?action=read&id=<%=bean.getCode()%>" target=_blank>Details</a><br>
				<a href="product?action=addC&id=<%=bean.getCode()%>">Add to cart</a>
				</td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">No products available</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>