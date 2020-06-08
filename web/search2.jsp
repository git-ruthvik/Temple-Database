
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="login.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Temple database</title>
    </head>
    <body background="bg03.jpg">
          
        <table border="1" width="600">
            <tr>
            <th> Temple Name</th>
            <th> Temple Address</th>
        </tr>
 <%@ page import="java.sql.*"%>
        <%@ page import="javax.sql.*"%>
        <%
            String search = request.getParameter("tsearch");

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/temple?useSSL=false", "root", "Ruthvik67");

            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select * from temples where temple_name LIKE '%"+search+"%'");
            if (rs.next()) {
            %>
            <tr>
                <td><% out.println(rs.getString("temple_name")); %></td>
                <td><% out.println(rs.getString("address")); %></td>
            </tr>
            <%
            } else {
                out.println("No such temples found");
            }
        %>
    </table>

    </body>
</html>