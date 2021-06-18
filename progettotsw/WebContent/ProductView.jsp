<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="NewFile.css" rel="stylesheet" type="text/css">
	<title>Storage DS/BF</title>
</head>

<body>
<jsp:include page="header.jsp"/>
	<jsp:include page="menu.jsp"/>

		<% int j=0;
		 String[] nomi= {"column side","column middle","column side"};
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				ArrayList<ProductBean> ls=new ArrayList();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
					ls.add(bean);} %>
				  <div class= "row">
				<% for(int i=0;i<ls.size();i++){%>
				 <div class="<%=nomi[j]%>">
		 <br> <p class="descr"> <%=ls.get(i).getName()%> </p>
			<img src="./getPicture?id=<%=ls.get(i).getCode()%>" width="300" height="300"> </br>
			PREZZO: <%=ls.get(i).getPrice()%>  </br>
			<a class="mn" href="product?action=read&id=<%=ls.get(i).getCode()%>" target=_blank>DETTAGLI</a> 
				<a class="mn" href="product?action=addC&id=<%=ls.get(i).getCode()%>">ACQUISTA</a> </br>
				</div>
		
		 <%
        if(j<2) j++;
            else j=0;

                }  %>
				  </div>
				  <%
            } 
        %>
       
		
		
	<jsp:include page="footer.jsp"/>
</body>
</html>