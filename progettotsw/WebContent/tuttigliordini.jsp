<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.*"%>
<%

	
	ListaOrdiniBean lista =(ListaOrdiniBean) request.getAttribute("tuttiordini");
	List<OrdineBean> listaOrdini = lista.getOrdini();
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
	<jsp:include page="menu.jsp"/>
	
	<table border="1">
	<form action="product" method="get">
                <input type="hidden" name="action" value="ricercauser"> 
                <label for="username"> USERNAME: </label><br> 
                <input name="username" type="text" placeholder="inserisci username"><br> 
                <input type="submit" value="submit"><input type="reset" value="Reset">
                </form>
                <br>
                <form action="product" method="get">
                <input type="hidden" name="action" value="ricercaData"> 
                <label for="DataOrdine1">Data inizio: </label><br> 
                <input name="DataOrdine1" type="text" maxlength="20"  placeholder="inserisci data inizio"><br> 
                <label for="DataOrdine2">Data fine: </label><br>
                <input name="DataOrdine2" type="text" maxlength="20"  placeholder="inserisci data fine"><br> 
                <input type="submit" value="submit"><input type="reset" value="Reset">
                </form>
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
			<td><%=prezzo%></td>
			<td><%=data%></td>
			<td><a href="product?action=dettagliordine&codice=<%=numeroOrdine%>">dettagli</a></td>
				
		</tr>
		
		<% }	%>	
		</table>
	<jsp:include page="footer.jsp"/>
</body>
</html>