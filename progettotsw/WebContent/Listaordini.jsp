<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page  import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.*"%>
<%

	
	ListaOrdiniBean lista =(ListaOrdiniBean) request.getAttribute("listaordini");
	List<OrdineBean> listaOrdini = lista.getOrdini();
	 UserBean currentUser = (UserBean) session.getAttribute("currentSessionUser");
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
	
	<table border="1" id="customers">
		<tr>
			<th>NUMERO ORDINE</th>
			<th>PREZZO</th>
			<th>DATA</th>
			<th>DETTAGLI</th>
		</tr>
		<% 	int numeroOrdine=0;
			String Username;
			double prezzo=0;
			Date data;
		   for(OrdineBean ordine: listaOrdini ) {
			  Username=ordine.getUsername();
			  numeroOrdine=ordine.getId();
			  prezzo=ordine.getPrezzo();
			  data=ordine.getData();
		%>
		<tr>
		
			<td><%=numeroOrdine%></td>
			<td><%=prezzo%>0 € </td>
			<td><%=data%></td>
			<td><a href="product?action=dettagliordine&codice=<%=numeroOrdine%>">dettagli</a></td>
				
		</tr>
		
		<% }	%>	
		</table>
	<jsp:include page="footer.jsp"/>
</body>
</html>