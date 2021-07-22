<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page  import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.*"%>
<%

	
	ListaOrdiniBean lista =(ListaOrdiniBean) request.getAttribute("tuttiordini");
	List<OrdineBean> listaOrdini = lista.getOrdini();
	UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
%>

<!DOCTYPE html>
<html>


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="NewFile.css" rel="stylesheet" type="text/css">
	<title>Lista Ordini</title>
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
	<% if (currentUser!=null) {%>
	<table border="1" id="customers">
	<div class="container">
	<form action="product" method="get">
                <input type="hidden" name="action" value="ricercauser"> 
                <label for="username"> USERNAME: </label><br> 
                <input name="username" type="text" class="log" placeholder="inserisci username"><br> 
                <button type="submit" class="signupbtn2">CERCA</button> <button type="submit" class="cancelbtn2">RESET</button><br>
                </form>
                <br>
                <form action="product" method="get">
                <input type="hidden" name="action" value="ricercaData"> 
                <label for="DataOrdine1">Data inizio: </label><br> 
                <input name="DataOrdine1" type="text" class="log" maxlength="20"  placeholder="inserisci data inizio"><br> 
                <label for="DataOrdine2">Data fine: </label><br>
                <input name="DataOrdine2" type="text" class="log" maxlength="20"  placeholder="inserisci data fine"><br> 
               <button type="submit" class="signupbtn2">CERCA</button> <button type="submit" class="cancelbtn2">RESET</button><br>
                </form>
                </div>
		<tr>
			<th>Numero Ordine</th>
			<th>username</th>
			<th>prezzo</th>
			<th>data</th>
			<th>dettagli</th>
		</tr>
		<% 	int numeroOrdine=0;
			String Username;
			double prezzo=0;
			Date data;
		   for(OrdineBean ordine: listaOrdini) {
			  Username=ordine.getUsername();
			  numeroOrdine=ordine.getId();
			  prezzo=ordine.getPrezzo();
			  data=ordine.getData();
		%>
		<tr>
		
			<td><%=numeroOrdine%></td>
			<td><%=Username%></td>
			<td><%=prezzo%>.00 € </td>
			<td><%=data%></td>
			<td><a href="product?action=dettagliordine&codice=<%=numeroOrdine%>">dettagli</a></td>
				
		</tr>
		
		<% }	%>	
		<% }%>
		

		</table>
	<jsp:include page="footer.jsp"/>
</body>
</html>