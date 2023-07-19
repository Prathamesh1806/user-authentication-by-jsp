<%@ page import="java.sql.*"%>

<html>
	<head>
		<title>Auth app </title>
		<style>*{font-size:40px;}
		*{background-color:azure;}	
	</style>
	</head>
	<body>
	<center>
	<h1>Signup page</h1>
	<form  method ="POST">
	<input type="text" name="un" placeholder="enter username"/>
		<br/><br/>
	<input type="password" name="pw1" placeholder="enter password"/>
		<br/><br/>
<input type="password" name="pw2" placeholder="confirm password"/>
<br/><br/>
<input type="submit" name="btn" value="Register"/>
</form>
<a href="index.jsp">Login</a>
<br/>
<%
if(request.getParameter("btn")!=null)
{
String username=request.getParameter("un");
String password1=request.getParameter("pw1");
String password2=request.getParameter("pw2");
if(! password1.equals(password2))
{
out.println("passwords did not match");
return;
}
try{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/kc24sep22";
String un="root";
String pw="abc123";
Connection con=DriverManager.getConnection(url,un,pw);
String sql="insert into users values(?,?)";
PreparedStatement pst=con.prepareStatement(sql);
pst.setString(1,username);
pst.setString(2,password1);
pst.executeUpdate();
response.sendRedirect("index.jsp");
con.close();
}
catch(SQLException e)
{
out.println("issues"+e+"user already exits");
}
}
%>
</center>
</body>
</html>