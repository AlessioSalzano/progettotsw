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
</head>
<body>
<%if(currentUser==null){ %>
<form action="Register">
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
</body>
</html>