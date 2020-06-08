<%-- 
    Document   : panch
    Created on : 27 Nov, 2018, 10:53:56 AM
    Author     : ruthv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/temple?useSSL=false";
String database = "temple";
String userid = "root123";
String password = "Ruthvik67";
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body> 
<center>
<h1>TEMPLES LIST</h1>
<table border="1" bgcolor="#ADD8E6">
<tr>
    <td><b>Address</b></td>
    <td><b>Temple</b></td>


</tr>
<%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/temple?useSSL=false","root","Ruthvik67");
statement=connection.createStatement();
String sql ="select * from temples";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("temple_name") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
out.println("Error");
}
%>
</table>
</center>
</body>
</html>