<html>
 	<head>
		<title>Auth app </title>
		<style>*{font-size:40px;}
				*{background-color:lightblue;}		
				.btn:hover {
  background-color: #4CAF50; 
  color: white;
  border-radius: 8px;
}
</style>
	</head>
	<body>
		<center>
			<h1>Home page</h1>
			<form  method ="POST">
			<input type="submit" name="btn" value="Logout" ;/>
			</form>
	<%
		if(session.getAttribute("user")!=null)
		{
			String user=(String)session.getAttribute("user");
			out.println("welcome  "+user);
		}
		else
		{
			response.sendRedirect("index.jsp");	
		}
%>
<%
	if(request.getParameter("btn")!=null)
		{
			request.getSession().invalidate();
			response.sendRedirect("index.jsp");	
		}
%>
		</center>
	</body>
</html>