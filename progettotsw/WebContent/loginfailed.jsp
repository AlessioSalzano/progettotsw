<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.util.*,it.unisa.model.*"%>
    <%  UserBean currentUser = (UserBean) session.getAttribute("currentSessionUser");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGIN ERRATO</title>
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
<h1>HAI SBAGLIATO AD INSERIRE EMAIL O PASSWORD <a href="LoginPage.jsp">RIPROVA</a></h1>
</body>
	<jsp:include page="footer.jsp"/>
</html>