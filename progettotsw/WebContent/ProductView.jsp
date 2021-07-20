<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="NewFile.css" rel="stylesheet" type="text/css">
	<title>HOME</title>
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
			<b>PREZZO: <%=ls.get(i).getPrice()%> € </b></br> </br> </br>
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