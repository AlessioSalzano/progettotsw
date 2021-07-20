<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="NewFile.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="topnav" id="myTopnav">
 <a class="na" href="product">HOME</a>
	<a class="na" href="product?action=vediordini">ORDINI</a>
	<a class="na" href="product?action=vedicarrello">CART</a>
	<a class="na" href="LoginPage.jsp">LOGIN</a>
	<a class="na" href="Paginadiregistrazione.jsp">REGISTRAZIONE</a>
  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>



<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>

</body>
</html>