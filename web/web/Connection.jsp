<%@page import="java.sql.*"%>
<%
    Connection con = null;
    PreparedStatement query = null;
    ResultSet rs = null;

    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/disease_prediction?useSSL=false&serverTimezone=UTC",
        "root",
        "Murali@123"
    );
%>
