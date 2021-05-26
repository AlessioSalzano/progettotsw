<%@ page language="java" 
    contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
     <%@ page import="java.util.*,it.unisa.model.*"%>
    <% 
   UserBean currentUser = (UserBean) session.getAttribute("currentSessionUser");
   
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	<link href="NewFile.css" rel="stylesheet" type="text/css">
                                <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<title>Login Page</title>
	</head>
<jsp:include page="header.jsp"/>
	<jsp:include page="menu.jsp"/>
	<body>
	<% if(currentUser==null)  { %>
		<form action="Login">

			Please enter your username 		
			<input type="text" name="un"/><br>		
		
			Please enter your password
			<input type="password" name="pw"/>
			
			<input type="submit" value="submit">			
		
		</form>
		<h3>Registrati <a href="Paginadiregistrazione.jsp">qui</a></h3>
	<%	}%>
<% if(currentUser!=null)  { %>
<h1>HAI GIA EFFETTUATO IL LOGIN</h1>
		<%	}%>
	<jsp:include page="footer.jsp"/>
	</body>
</html>
