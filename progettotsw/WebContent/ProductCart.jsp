<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page  import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.*"%>
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
	<% if (currentUser==null){%>
	<jsp:include page="menu.jsp"/>
<% } %>
<% if (currentUser!=null && !currentUser.isAdmin()){%>
	<jsp:include page="menu2.jsp"/>
<% } %>
<%if(currentUser!=null && currentUser.isAdmin()){ %>
	<jsp:include page="menu3.jsp"/>
<% } %>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="NewFile.css" rel="stylesheet" type="text/css">
	<title>Storage DS/BF</title>
</head>

<body>
	<%if (cart.size()==0){ %>
	<h1>IL CARRELLO E' VUOTO!</h1>
	<%} %>
	
	<% if(cart != null) { %>

	
		<table class="cart">
		<% 	int quant;
			int code;
			double price;
			double prezzototale=0;
		   for(ProductCart beancart: prodcart) {
			  String name= beancart.getProduct().getName();
			   quant=beancart.getNumProduct();
			   code= beancart.getProduct().getCode();
			   price=beancart.getTotalCost();
			   prezzototale=prezzototale+price;
		%>
		<tr>
		<%if(quant>0){ %>
			<td><img src="./getPicture?id=<%=beancart.getProduct().getCode()%>" width="150" height="150"></td>
			<td>NOME PRODOTTO:<br> <%=name%></td>
			<td>QUANTITA':<br> <%=quant%></td>
			<td>PREZZO: <br> <%=price%></td>
			<td><a class="rm" href="product?action=deleteC&id=<%=code%>">RIMUOVI</a></td>
			
		</tr>
		<%} %>
		<%}%>
		
		
		<%if (currentUser!=null){%>
		<br> <br> <a class="mn" href="product?action=checkout&carrello=<%=request.getAttribute("cart")%>">ACQUISTA</a>
		<h2>PREZZO TOTALE:<%=prezzototale %></h2>
		<%} if(currentUser==null) { %>
		<h2>DEVI EFFETTUARE IL <a href="LoginPage.jsp"> LOGIN</a> PRIMA DI POTER ACQUISTARE </h2>
		<%}%>
		<%}%>
		
	</table>	
	<jsp:include page="footer.jsp"/>
</body>
</html>