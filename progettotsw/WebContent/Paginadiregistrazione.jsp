<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.util.*,it.unisa.model.*"%>
    <% 
   UserBean currentUser = (UserBean) session.getAttribute("currentSessionUser");
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<link href="NewFile.css" rel="stylesheet" type="text/css">
<script type = "text/javascript" src = "http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
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

<%if(currentUser==null){ %>
			<script>

			
			function check(obj){
				var valid1=true;
				var valid2=true;
				var valid3=true;
				var valid4=true;
				valid1=checkemail();
				valid2=checkpassword();
				valid3=checkcvv();
				valid4=checkcard();
				if(valid1==true && valid2==true && valid3==true && valid4==true ){
					obj.submit();
				}
				
			}
			
			function checkemail(ema){
				var email=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
				var ema=document.getElementById("em");
				if(ema.value.match(email)){
					ema.classList.remove("error");
					document.getElementById("emerr").innerHTML = "";
					return true;
				}
				else{
					ema.classList.add("error");
					document.getElementById("emerr").innerHTML = "inserire un email valida";
					return false;
				}
					
				}
			
			function checkpassword(pw){
				
				var password=/^(?=.{10,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*$/;
				var pw=document.getElementById("pw");
				if(pw.value.match(password)){
					pw.classList.remove("error");
					document.getElementById("pwerr").innerHTML = " ";
					return true;
				}
				else{
					
					pw.classList.add("error");
					document.getElementById("pwerr").innerHTML = "Almeno 10 caratteri, Almeno 1 maiuscolo, Almeno 1 minusco Almeno, 1 speciale";
					return false;
				}
					
				}

			function checkcvv(cvv){
				
				var name=/[0-9]{3}/;
				var cvv=document.getElementById("cvv");
				if(cvv.value.match(name)){
					cvv.classList.remove("error");
					document.getElementById("cvverr").innerHTML = " ";
					return true;
				}
				else{
					
					cvv.classList.add("error");
					document.getElementById("cvverr").innerHTML = "Almeno 3 numeri";
					return false;
				}
					
				}
			function checkcard(card){
				
				var name=/[0-9]{5}/;
				var card=document.getElementById("card");
				if(card.value.match(name)){
					card.classList.remove("error");
					document.getElementById("carderr").innerHTML = " ";
					return true;
				}
				else{
				
					card.classList.add("error");
					document.getElementById("carderr").innerHTML = "Almeno 16 numeri";
					return false;
				}
					
				}
	
		$(document).ready(function(){
			$('#em').blur(function(){
				var email= $('#em').val();
				$.ajax({
				type:'POST',
				data:{email:email},
				url:'Controlloreg',
				success:function(result){
				$('#ccc').html(result);	
				}
				});
			});
		});
		
		$(document).ready(function(){
			$('#user').blur(function(){
				var user= $('#user').val();
				$.ajax({
				type:'POST',
				data:{user:user},
				url:'Controllouser',
				success:function(result){
				$('#usererr').html(result);	
				}
				});
			});
		});
				

</script>


<form action="Register" method="get" class="form"  style="border:1px solid #ccc" onsubmit="event.preventDefault(); check(this)">
  <div class="container">
    <h1>EFFETTUA LA REGISTRAZIONE</h1> 

    <hr>

    <label for="email"><b>Email</b> <br></label>
    <span id="emerr" class="errormx"></span> <br>
    <span id="ccc" class="errormx"></span> <br>
    <input type="text" placeholder="Inserisci Email" name="em" class="log" id="em" required onblur="checkemail()"> <br> 
 	
    <label for="psw"><b>Password</b><br></label>
     <span id="pwerr" class="errormx"></span> <br>
    <input type="password" placeholder="Inserisci Password" name="pw" class="log" id="pw" required onblur="checkpassword()"><br>
     <label for="email"><b>Username</b> <br></label>
       <span id="usererr" class="errormx"></span> <br>
    <input type="text" placeholder="Inserisci Username" name="us" class="log" id="user" required> <br>
     <label for="email"><b>Nome</b> <br></label>
    <input type="text" placeholder="Inserisci Nome" name="un" class="log" required> <br>
     <label for="email"><b>Cognome</b> <br></label>
    <input type="text" placeholder="Inserisci Cognome" name="cg" class="log" required> <br>
     <label for="email"><b>Indirizzo di spedizione</b> <br></label>
    <input type="text" placeholder="Inserisci indirizzo di spedizione" name="ind" class="log" required> <br>
     <label for="email"><b>Numero carta di credito</b> <br></label>
     <span id="carderr" class="errormx"></span> <br>
    <input type="text" placeholder="Inserisci il numero della carta" name="carta" class="log" id="card" required onblur="checkcard()"> <br>
     <label for="email"><b>Numero CVV</b> <br></label>
       <span id="cvverr" class="errormx"></span> <br>
    <input type="text" placeholder="Inserisci numero cvv" name="cvv" class="log" id="cvv" required onblur="checkcvv()"> <br>
     <label for="email"><b>Intestatario Carta</b> <br></label>
    <input type="text" placeholder="Inserisci intestatario della carta" name="inte" class="log" required> <br>
   

    <div class="clearfix">
    
      <button type="submit" class="signupbtn">REGISTRATI</button>
    </div>
  </div>
</form>
		<%} %>
		<% if(currentUser!=null)  { %>
<h1>HAI GIA EFFETTUATO IL LOGIN</h1>
		<%	}%> 
	<jsp:include page="footer.jsp"/>
</body>
</html>