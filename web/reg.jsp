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
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/temple?useSSL=false","root","Ruthvik67");
                
            CallableStatement calstat=con.prepareCall("{call reg (?,?,?,?)}");
                            calstat.setString(1,name);
                            calstat.setString(2,email);
                            calstat.setString(3,username);
                            calstat.setString(4,password);
                            
                            ResultSet rs=calstat.executeQuery();
                            con.close();
                            calstat.close();
                 response.sendRedirect("login.html");
        %>
    </body>
</html>

