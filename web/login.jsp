<%-- 
    Document   : reg
    Created on : 23 Oct, 2018, 11:16:46 AM
    Author     : ruthv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Temple database</title>
    </head>
    <body>
        <%@ page import="java.sql.*"%>
        <%@ page import="javax.sql.*"%>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/temple?useSSL=false", "root", "Ruthvik67");

            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select * from user where username='" + username + "' and password='" + password + "'");
            if (rs.next()) {
                session.setAttribute("userid", username);
                response.sendRedirect("home.html");
            } else {
                response.sendRedirect("fail.html");
            }
        %>
    </body>
</html>
