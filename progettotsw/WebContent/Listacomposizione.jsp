<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.*"%>
<%


	ListaComposizione lista =(ListaComposizione) request.getAttribute("listacomposizione");
	List<ComposizioneBean> listacomposizione = lista.getOrdini();
%>

<!DOCTYPE html>
<html>


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="NewFile.css" rel="stylesheet" type="text/css">
	<title>DETTAGLI ORDINE</title>
</head>

<body>
<h2>ORDINI</h2>
	<jsp:include page="header.jsp"/>
	<jsp:include page="menu.jsp"/>
		<table border="1">
		<tr>
			<th>Numero Ordine</th>
			<th>codice prodotto</th>
			<th>quantita</th>
			<th>iva</th>
			<th>prezzo singolo pezzo</th>
			<th>prezzo totale</th>
			
		</tr>
		<% 	int numordine;
			int codice;
			int quant;
			int iva;
			int singolopezzo;
			double prezzototale;
			
		   for(ComposizioneBean composizione: listacomposizione ) {
				 numordine=composizione.getNumeroordine();
				 codice=composizione.getCodice();
				 quant=composizione.getQuantità();
				 iva= composizione.getIva();
				 singolopezzo=composizione.getPrezzosingolopezzo();
				 prezzototale =composizione.getPrezzototale();
				System.out.println(numordine+" "+prezzototale);
			
			
		%>
		<tr>
		
			<td><%=numordine%></td>
			<td><%=codice%></td>
			<td><%=quant%></td>
			<td><%=iva%></td>
			<td><%=singolopezzo%></td>
			<td><%=prezzototale%></td>
		</tr>
		
	
		<% }	%>
	<jsp:include page="footer.jsp"/>
</body>
</html>