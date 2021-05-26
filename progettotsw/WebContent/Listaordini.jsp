<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.*"%>
<%


	ListaOrdiniBean lista =(ListaOrdiniBean) request.getAttribute("listaordini");
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
<h2>ORDINI</h2>
	
		<table border="1">
		<tr>
			<th>Numero Ordine</th>
			<th>username</th>
			<th>prezzo</th>
			<th>dettagli</th>
		</tr>
		<% 	int numeroOrdine=0;
			String Username;
			double prezzo=0;
			
		   for(OrdineBean ordine: listaOrdini ) {
			  Username=ordine.getUsername();
			  numeroOrdine=ordine.getId();
			  prezzo=ordine.getPrezzo();
		%>
		<tr>
		
			<td><%=numeroOrdine%></td>
			<td><%=Username%></td>
			<td><%=prezzo%></td>
			<td><a href="product?action=dettagliordine&codice=<%=numeroOrdine%>">dettagli</a></td>
		</tr>
		
	
		<% }	%>	
	<jsp:include page="footer.jsp"/>
</body>
</html>