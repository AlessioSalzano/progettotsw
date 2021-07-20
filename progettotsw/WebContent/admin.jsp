<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");

	
	ProductBean product = (ProductBean) request.getAttribute("product");
	UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.*"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="NewFile.css" rel="stylesheet" type="text/css">
	<title>ADMINPAGE</title>
</head>

<body>
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
	
	<%if(currentUser==null || !currentUser.isAdmin()){ %>
	<h1>NON HAI I PERMESSI PER ENTRARE IN QUESTA SEZIONE</h1>
	<%} %>
	<%if(currentUser!=null && currentUser.isAdmin()){ %>
	<h2>PAGINA DELL'AMINISTRATORE</h2>
	 <a href="product?action=tuttigliordini" class="mn"> ELENCO ORDINI</a>
	  <a  href="Inserimento.jsp" class="mn"> INSERIMENTO</a>
	   <a href="Modifica.jsp" class="mn"> MODIFICA</a>
	<table class="admin">
		<tr>
			<th></th>
			<th>CODICE</th>
			<th>RICONDIZIONATO</th>
			<th>IVA</th>
			<th>NOME</th>
			<th>PREZZO</th>
			<th>DESCRIZIONE</th>
			<th></th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
		<tr>
			<td><img src="./getPicture?id=<%=bean.getCode()%>" width="150" height="150"></td>
			<td><%=bean.getCode()%></td>
			<td><%=bean.getRicondizionato()%></td>
			<td><%=bean.getIva()%></td>
			<td><%=bean.getName()%></td>
			<td><%=bean.getPrice()%> € </td>
			<td><%=bean.getDescription()%>  </td>
			<td><a class="rm" href="product?action=delete&id=<%=bean.getCode()%>">Delete</a><br>
		</tr>
		<%}%>
	</table>

<%} %>
<%} %>
	<jsp:include page="footer.jsp"/>
</body>
</html>