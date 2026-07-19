<%@page import="java.sql.*"%>

<%
Connection con = null;
PreparedStatement query = null;
ResultSet rs = null;

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    String url = System.getenv("DB_URL");

    String user = System.getenv("DB_USER");

    String password = System.getenv("DB_PASSWORD");

    con = DriverManager.getConnection(url, user, password);

    out.println("<h3 style='color:green'>Database Connected Successfully</h3>");

} catch (Exception e) {

    e.printStackTrace(new java.io.PrintWriter(out));

}
%>
