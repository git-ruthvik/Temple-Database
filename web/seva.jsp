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
String id = request.getParameter("userid");
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
    <head>
        <link rel="stylesheet" href="login.css">
    </head>
<body background="bg03.jpg">
<center>
<h1>SEVA</h1>
<table border="2">
<tr>
<th>Seva_Name</th>
<th>PRICE(Rupees)</th>


</tr>
<%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/temple?useSSL=false","root","Ruthvik67");
statement=connection.createStatement();
String sql ="select * from seva";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("seva_name") %></td>
<td><%=resultSet.getString("price") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</center>
</body>
</html>