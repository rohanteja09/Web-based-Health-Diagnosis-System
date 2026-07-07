<%@page import="java.sql.*"%>

<%
Connection con = null;
PreparedStatement query = null;
ResultSet rs = null;

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    String url = "REDACTED?sslMode=REQUIRED";

    String user = "REDACTED";

    String password = "YOUR_TIDB_PASSWORD";

    con = DriverManager.getConnection(url, user, password);

}
catch(Exception e)
{
    out.println(e);
}
%>
