<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.util.*,it.unisa.model.*"%>
    <% 
   UserBean currentUser = (UserBean) session.getAttribute("currentSessionUser");
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<link href="NewFile.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="header.jsp"/>
	<jsp:include page="menu.jsp"/>

<%if(currentUser==null){ %>
<form action="Register">
			INSERISCI L'EMAIL:
			<input type="text" name="em"/><br>
			INSERISCI IL TUO USERNAME:
			<input type="text" name="us"/><br>
			
			INSERISCI IL TUO NOME:
			<input type="text" name="un"/><br>		
		
			INSERISCI IL TUO COGNOME:
			<input type="text" name="cg"/><br>	
			
			INSERISCI IL TUO PASSWORD:
			<input type="password" name="pw"/><br>	
			
			INSERISCI IL TUO INDIRIZZO:
			<input type="text" name="ind"/><br>	
			
			INSERISCI IL TUO NUMERO DI CARTA:
			<input type="text" name="carta"/><br>	
			
			INSERISCI IL TUO NUMERO CVV:
			<input type="text" name="cvv"/><br>	
			
			INSERISCI L'INTESTARARIO DELLA CARTA:
			<input type="text" name="inte"/><br>	
			
			<input type="submit" value="submit">			
		
		</form>
		<%} %>
		<% if(currentUser!=null)  { %>
<h1>HAI GIA EFFETTUATO IL LOGIN</h1>
		<%	}%>
	<jsp:include page="footer.jsp"/>
</body>
</html>