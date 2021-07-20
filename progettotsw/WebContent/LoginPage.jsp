<%@ page language="java" 
    contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
     <%@ page import="java.util.*,it.unisa.model.*"%>
    <% 
   UserBean currentUser = (UserBean) session.getAttribute("currentSessionUser");
   
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	<link href="NewFile.css" rel="stylesheet" type="text/css">
                                <meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
		<title>Login Page</title>
	</head>
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
	<body>
	<% if(currentUser==null)  { %>
<form action="Login" style="border:1px solid #ccc">
  <div class="container">
    <h1>EFFETTUA IL LOG-IN</h1>

    <hr>

    <label for="email"><b>Email</b> <br></label>
    <input type="text" placeholder="Enter Email" name="un" class="log" required> <br>

    <label for="psw"><b>Password</b><br></label>
    <input type="password" placeholder="Enter Password" name="pw" class="log" required><br>
    
   
    <h3>ALTRIMENTI REGISTRATI <a class="nn" href="Paginadiregistrazione.jsp">QUI</a></h3>
   

    <div class="clearfix">
    
      <button type="submit" class="signupbtn">Log-in</button>
    </div>
  </div>
</form>


	<%	}%>
<% if(currentUser!=null)  { %>
<h1>HAI GIA EFFETTUATO IL LOGIN</h1>
		<%	}%>
	<jsp:include page="footer.jsp"/>
	</body>
</html>
