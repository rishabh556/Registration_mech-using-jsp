<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");
String connectionURL = "jdbc:mysql://localhost:3306/rishu";
Connection connection = null;
PreparedStatement pstatement = null;
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionURL,"root", "root123");
String queryString = "INSERT INTO employee VALUES (?, ?, ?)";
pstatement = connection.prepareStatement(queryString);
pstatement.setString(1, name);
pstatement.setString(2, email);
pstatement.setString(3, password);
int updateQuery = pstatement.executeUpdate();
if (updateQuery != 0) {
System.out.println("it run");
response.sendRedirect("Login.html");

}
}
catch (Exception ex) {
out.println(ex);
out.println("Error occured");
}
finally { }
%>
</body>
</html>
