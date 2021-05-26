<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.*"%>
<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");

	ProductBean product = (ProductBean) request.getAttribute("product");
	UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
	Cart cart = (Cart) request.getAttribute("cart");
	
	List<ProductCart> prodcart=cart.getProducts(); 
%>

<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"/>
	<jsp:include page="menu.jsp"/>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="NewFile.css" rel="stylesheet" type="text/css">
	<title>Storage DS/BF</title>
</head>

<body>
	 <a href="product">List</a>
	<% if(cart != null) { %>

		<h2>Cart</h2>
		<table border="1">
		<tr>
			<th>Name</th>
			<th>Quantity</th>
			<th>TotalPrice</th>
			<th>Action</th>
		</tr>
		<% 	int quant;
			int code;
			double price;
		   for(ProductCart beancart: prodcart) {
			  String name= beancart.getProduct().getName();
			   quant=beancart.getNumProduct();
			   code= beancart.getProduct().getCode();
			   price=beancart.getTotalCost();
		%>
		<tr>
		<%if(quant>0){ %>
			<td><%=name%></td>
			<td><%=quant%></td>
			<td><%=price%></td>
			<td><a href="product?action=deleteC&id=<%=code%>">Delete from cart</a></td>
			
		</tr>
		<%} %>
		<%}%>
		
		
		<%if (currentUser!=null){%>
		<a href="product?action=checkout&carrello=<%=request.getAttribute("cart")%>">CHECK OUT</a>
		<%} if(currentUser==null) { %>
		DEVI EFFETTUARE IL<a href="LoginPage.jsp">LOGIN</a> PRIMA DI POTER ACQUISTARE
		<%}%>
		<%}%>
	</table>	
	<jsp:include page="footer.jsp"/>
</body>
</html>