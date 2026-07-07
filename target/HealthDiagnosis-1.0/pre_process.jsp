<%@page import="CBF.Stem"%>
<%@page import="CBF.Stopwords"%>
<html>
<head>
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<title>
</title>
<style>
a#des
{
    background: #c70707;border-radius: 12px;height: 27px;border-style: double;
}
div#readfile
{
    margin-left: 296px;
    margin-top: 0px;
    border-style: groove;
    width: 400px;
    height: 100px;
}
</style>
</head>
<body>
<div id="header-wrapper" style="
    background: url('Images/himg.gif');
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    height: 89px; 
    border-radius: 20px;
    border-style: double;
    border-color: aliceblue;
    
    border-radius: 18px;">
	<div id="header" class="container"> 
		<div id="logo">
                    <h1 style="color: mediumvioletred;"><a href="#"></a></h1>
		</div>
		<div id="menu">
			<ul style="color: mediumvioletred;">
				<li><a href="Admin_Home.jsp" id='des'>Home</a></li>
				<li><a href="UploadDataSet.jsp">Upload Datasets</a></li>
                                <li><a href="View_Datasets.jsp">View Datasets</a></li>
                                <li><a href="pre_process.jsp">Pre-processing</a></li>
				<li><a href="Search.jsp">Search Details</a></li>				
				<li><a href="OverallAnalysis.jsp">Analysis</a></li>
                                
			</ul>
		</div>
	</div>
</div>
    <br><br>
<div id="header-featured">
	<div id="banner" class="container">
            <p align="center" style="font-size: larger;color: chartreuse;">View Pre-Processed Data</p>
            <table align="center" border=1 style="width: 996px;text-transform: uppercase;text-align: center;color: wheat;font-weight: bold;line-height: 2;background: purple;border-radius: 13px;">
                <tr style="background: black;color: yellow;">
                    <td>Patient id</td>
                    <td>Diagnosis Level</td>
                    <td>Recording Times</td>
                    <td>Diagnosis Events</td>
                    <td>Diagnosis Times</td>
                    <td>Counselling Times</td>
                    <td>Failure Rate</td>
                    
                </tr> 
                <%@include file="Connection.jsp"%>
                <%
                Stem s=new Stem();
                Stopwords st=new Stopwords();
                    query=con.prepareStatement("select * from dataset1");
                    rs=query.executeQuery();
                    while(rs.next())
                    {
                        %>
                            <tr>
                                <td style="background: red;">
                                    <%=rs.getString(1)%>
                                </td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td><%=rs.getString(6)%></td>
                                <td><%=rs.getString(7)%></td>
                                <td><%=rs.getString(8)%></td>
                                
                            </tr>
                        <%
                    }
                %>
            </table>
            <br><br><br>
        </div>
</div>
</body>
</html>