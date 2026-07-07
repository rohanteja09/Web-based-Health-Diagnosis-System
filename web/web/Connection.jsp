<%@ page import="java.sql.*" %>

<%
Connection con = null;

Class.forName("com.mysql.cj.jdbc.Driver");

String url =
"jdbc:mysql://gateway01.ap-southeast-1.prod.alibaba.tidbcloud.com:4000/disease_prediction?sslMode=VERIFY_IDENTITY";

String user = "YOUR_USERNAME";
String password = "YOUR_PASSWORD";

con = DriverManager.getConnection(url, user, password);
%>
