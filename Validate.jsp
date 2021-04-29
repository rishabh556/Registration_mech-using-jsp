<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
ResultSet rs;
String Email=request.getParameter("email1");
String Password=request.getParameter("password1");

Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rishu","root", "root123");
String sql="SELECT Email, Password from Employee where email=? and password=?";
 PreparedStatement ps=con.prepareStatement(sql);
 ps.setString(1, Email);
 ps.setString(2, Password);
 rs=ps.executeQuery();
 if(rs.next()){
 	String a=rs.getString("Email");
 	String b=rs.getString("Password");
 	if(Email.equals(a) && Password.equals(b))
 	{
 		
 		response.sendRedirect("Welcome.html"); 

 }
 
 else
 {
	 out.println("Invalid username or password!!!, Try again!!");
	//response.sendRedirect("LoginF.html"); 
 }
 }
%>
</body>
</html>

