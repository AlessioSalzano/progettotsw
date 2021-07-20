<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page  import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.*"%>
    <%UserBean currentUser = (UserBean) session.getAttribute("currentSessionUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="NewFile.css" rel="stylesheet" type="text/css">
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

<h1>GRAZIE PER L'ACQUISTO!</h1>
</body>
	<jsp:include page="footer.jsp"/>
</html>