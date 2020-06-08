<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <link rel="stylesheet" href="login.css">
    </head>
    <body>
        <h1 style="font-size: 300%">WELCOME TO TEMPLE DATABASE</h1><br><br>
        <form method="post" action="search2.jsp">
        <input type="text" name="tsearch" placeholder="SEARCH FOR TEMPLE" style="font-size:200%;" size="50">
        <input type="submit" value="Search" name="search" style="font-size:190%;">
        <div class="topright">
            <p style="font-size: 190%">
            <h2><b>Menu</b></h2>
            <a href="tlist.jsp">List all Temples</a><br>
            <a href="templereg.html">Register A New Temple</a><br>
            <a href="panch.jsp">Panchangam</a><br>
            <a href="seva.jsp">List of Sevas</a><br>
            <a href="events.jsp">Calendar Of Events</a>
            </p>
    </div>
                <%@ page import="javax.sql.*"%>
        <%
            String search = request.getParameter("tsearch");
            String searched = request.getParameter("searched");
            if(searched!=null){
            %>
            <table>
            <tr>
            <th> Temple Name</th>
            <th> Temple Address</th>
        </tr>
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
        <%
    }
    %>

</body>
</html>


