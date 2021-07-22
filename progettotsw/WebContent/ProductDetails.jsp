<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	ProductBean product = (ProductBean) request.getAttribute("product");
	UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="NewFile.css" rel="stylesheet" type="text/css">
	<title>DETTAGLI</title>
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
	<br>
	<h1>DETTAGLI PRODOTTO</h1> <br>
		<hr>
<a class="mn" href="product?action=addC&id=<%=product.getCode()%>">ACQUISTA</a></br>
		<img src="./getPicture?id=<%=product.getCode()%>" width="300" height="300"> </br>
			<p class="descr">CODICE PRODOTTO: <%=product.getCode()%></br> 
			NOME PRODOTTO: <%=product.getName()%></br>
			DESCRIZIONE PRODOTTO: <%=product.getDescription()%></br>
			PREZZO DEL PRODOTTO: <%=product.getPrice()%>.00 € </br>
			SCONTO SUL PRODOTTO: <%=product.getSconto()%></br>
			IVA DEL PRODOTTO: <%=product.getIva()%></br>
			RICONDIZIONATO: <%=product.getRicondizionato()%></br>
			
	</p>
</br></br>	<jsp:include page="footer.jsp"/>
</body>
</html>