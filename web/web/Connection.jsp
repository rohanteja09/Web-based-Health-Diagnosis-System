<%@page import="java.sql.*"%>

<%
Connection con = null;
PreparedStatement query = null;
ResultSet rs = null;

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    String url = "REDACTED?sslMode=REQUIRED";

    String user = "REDACTED";

    String password = "REDACTED";

    con = DriverManager.getConnection(url, user, password);

    out.println("<h3 style='color:green'>Database Connected Successfully</h3>");

} catch (Exception e) {

    e.printStackTrace(new java.io.PrintWriter(out));

}
%>
