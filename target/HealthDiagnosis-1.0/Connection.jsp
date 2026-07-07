<%@page import="java.sql.*"%>

<%
Connection con = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    String url = "REDACTED?sslMode=REQUIRED";

    String user = "REDACTED";

    String password = "YOUR_GENERATED_PASSWORD";

    con = DriverManager.getConnection(url, user, password);

} catch (Exception e) {
    out.println(e);
}
%>
