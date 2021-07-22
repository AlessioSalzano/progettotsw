<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page  import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.*"%>
<%


	ListaComposizione lista =(ListaComposizione) request.getAttribute("listacomposizione");
	List<ComposizioneBean> listacomposizione = lista.getOrdini();
	UserBean currentUser = (UserBean) session.getAttribute("currentSessionUser");
%>

<!DOCTYPE html>
<html>


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="NewFile.css" rel="stylesheet" type="text/css">
	<title>DETTAGLI ORDINE</title>
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
	<h1>DETTAGLI ORDINE</h1> <br>
		<hr>
		
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

		%>

			<br> <img src="./getPicture?id=<%=codice%>" width="300" height="300"> <br>
			<b>NUMERO DELL'ORDINE: </b><%=numordine%> <br>
			<b>CODICE DEL PRODOTTO: </b><%=codice%> <br>
			<b>QUANTITA' ACQUISTATE: </b><%=quant%> <br>
			<b>IVA: </b><%=iva%> <br>
			<b>PREZZO DEL SINGOLO PRODOTTO: </b><%=singolopezzo%>.00 €  <br>
			<b>PREZZO TOTALE DELL'ACQUISTO: </b><%=prezzototale%>0 €  <br> <br>
		
		
	
		<% }	%>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>