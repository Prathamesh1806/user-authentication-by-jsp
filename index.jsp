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
<h1>Login page</h1>
<form  method ="POST">
<input type="text" name="un" placeholder="enter username"/>
<br/><br/>
<input type="password" name="pw" placeholder="enter password"/>
<br/><br/>
<input type="submit" value="Login" name="btn"/>
</form>
<a href="signup.jsp">New User</a>
<br/>
<%
if(request.getParameter("btn")!=null)
{
String username=request.getParameter("un");
String password=request.getParameter("pw");
try{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/kc24sep22";
String un="root";
String pw="abc123";
Connection con=DriverManager.getConnection(url,un,pw);
String sql="select * from users where username=? and password=?";
PreparedStatement pst=con.prepareStatement(sql);
pst.setString(1,username);
pst.setString(2,password);
ResultSet rs=pst.executeQuery();
if(rs.next())
{
request.getSession().setAttribute("user",username);
response.sendRedirect("home.jsp");
}else
{
	out.println("invalid Login");
}
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