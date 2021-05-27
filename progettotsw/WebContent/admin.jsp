<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");

	
	ProductBean product = (ProductBean) request.getAttribute("product");
	UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.*"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="NewFile.css" rel="stylesheet" type="text/css">
	<title>Storage DS/BF</title>
</head>

<body>
<jsp:include page="header.jsp"/>
	<jsp:include page="menu.jsp"/>
	
	<%if(currentUser==null || !currentUser.isAdmin()){ %>
	<h1>NON HAI I PERMESSI PER ENTRARE IN QUESTA SEZIONE</h1>
	<%} %>
	<%if(currentUser!=null && currentUser.isAdmin()){ %>
	<h2>VEDI ELENCO ORDINI: </h2>
	 <a href="product?action=tuttigliordini"> <button>ELENCO</button></a>
	<table border="1">
		<tr>
			<th>Code <a href="product?sort=code">Sort</a></th>
			<th>Name <a href="product?sort=name">Sort</a></th>
			<th>Description <a href="product?sort=description">Sort</a></th>
			<th>Action</th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
		<tr>
			<td><%=bean.getCode()%></td>
			<td><%=bean.getName()%></td>
			<td><%=bean.getDescription()%></td>
			<td><a href="product?action=delete&id=<%=bean.getCode()%>">Delete</a><br>
				<a href="product?action=read&id=<%=bean.getCode()%>">Details</a><br>

				</td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">No products available</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		if (product != null) {
	%>
	<table border="1">
		<tr>
			<th>Code</th>
			<th>Name</th>
			<th>Description</th>
			<th>Price</th>
			<th>Quantity</th>
		</tr>
		<tr>
			<td><%=product.getCode()%></td>
			<td><%=product.getName()%></td>
			<td><%=product.getDescription()%></td>
			<td><%=product.getPrice()%></td>
			<td><%=product.getQuantity()%></td>
		</tr>
	</table>
	<%
		}
	%>
	<h2>Insert</h2>
	<form action="product" method="post">
		<input type="hidden" name="action" value="insert"> 
		
		<label for="name">Name:</label><br> 
		<input name="name" type="text" maxlength="20" required placeholder="enter name"><br> 
		
		<label for="description">Description:</label><br>
		<textarea name="description" maxlength="100" rows="3" required placeholder="enter description"></textarea><br>
		
		<label for="price">Price:</label><br> 
		<input name="price" type="number" min="0" value="0" required><br>

		<label for="quantity">Quantity:</label><br> 
		<input name="quantity" type="number" min="1" value="1" required><br>
		
		<label for="sconto">Sconto</label><br> 
		<input name="sconto" type="number" min="0" value="1" required><br>
		
		<label for="iva">iva:</label><br> 
		<input name="iva" type="number" min="0" value="1" required><br>
		
		<label for="ricondizionato">Ricondizionato:</label><br> 
		<input name="ricondizionato" type="text" maxlength="20" required placeholder="enter the status"><br> 
		

		<input type="submit" value="Add"><input type="reset" value="Reset">
	</form>
	<h2>Modifica Prodotti</h2>
		
		<form action="product" method="post">
			<input type="hidden" name="action" value="modificaid"> 
			<label for="codiceid">Codice prodotto da modificare: </label><br> 
			<input name="codiceid" type="text" maxlength="20"  placeholder="inserisci codice"><br> 
			<label for="ricondizionato">Ricondizionato: </label><br>
			<textarea name="ricondizionato" maxlength="2" rows="3"  placeholder="inserire se è ricondizionato o no"></textarea><br>
			<input type="submit" value="submit"><input type="reset" value="Reset">
		</form>
		
		<form action="product" method="post">
			<input type="hidden" name="action" value="modificaNome"> 
			<label for="codiceid">Codice prodotto da modificare: </label><br> 
			<input name="codiceid" type="text" maxlength="20"  placeholder="inserisci codice"><br> 
			<label for="Nome">Nome:</label><br>
			<textarea name="Nome" maxlength="45" rows="3"  placeholder="inserire nome prodotto"></textarea><br>
			<input type="submit" value="submit"><input type="reset" value="Reset">
		</form>
		
		<form action="product" method="post">
			<input type="hidden" name="action" value="modificaDescrizione"> 
			<label for="codiceid">Codice prodotto da modificare: </label><br> 
			<input name="codiceid" type="text" maxlength="20"  placeholder="inserisci codice"><br> 
			<label for="Descrizione">Descrizione: </label><br>
			<textarea name="Descrizione" maxlength="100" rows="3" placeholder="inserire descrizione prodotto"></textarea><br>
			<input type="submit" value="submit"><input type="reset" value="Reset">
		</form>
		
		<form action="product" method="post">
			<input type="hidden" name="action" value="modificaPrezzo"> 
			<label for="codiceid">Codice prodotto da modificare: </label><br> 
			<input name="codiceid" type="text" maxlength="20"  placeholder="inserisci codice"><br> 
			<label for="PrezzoNoIVA">Prezzo senza IVA:</label><br> 
			<input name="PrezzoNoIVA" type="number" value="0"><br>
			<input type="submit" value="submit"><input type="reset" value="Reset">
		</form>
		
		<form action="product" method="post">
			<input type="hidden" name="action" value="modificaSconto">
			<label for="codiceid">Codice prodotto da modificare: </label><br> 
			<input name="codiceid" type="text" maxlength="20"  placeholder="inserisci codice"><br>  
			<label for="Sconto">Sconto: </label><br> 
			<input name="Sconto" type="number" value="0"><br>
			<input type="submit" value="submit"><input type="reset" value="Reset">
		</form>
		
		<form action="product" method="post">
			<input type="hidden" name="action" value="modificaDisponibilita"> 
			<label for="codiceid">Codice prodotto da modificare: </label><br> 
			<input name="codiceid" type="text" maxlength="20"  placeholder="inserisci codice"><br> 
			<label for="Disponibilita">Disponibilita : </label><br> 
			<input name="Disponibilita" type="number" value="0"><br>
			<input type="submit" value="submit"><input type="reset" value="Reset">
		</form>
			<%
		}
	%>
	<jsp:include page="footer.jsp"/>
</body>
</html>