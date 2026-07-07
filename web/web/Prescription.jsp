<%@page import="algorithm.LSTM"%>
<%@page import="algorithm.CNN"%>
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
    <p align="center" style="font-size: 30px;color: cyan;"><%=request.getParameter("risk")%></p>
    <%@include file="Connection.jsp"%>    
        <%
            String risk=request.getParameter("risk");
            if(risk.equalsIgnoreCase("Your Disease Result (High Risk)"))
            {
                %>
                    <div style="
                                margin-left: 50px;
                                width: 1161px;
                                height: 500px;
                                background: whitesmoke;
                                border-radius: 8px;
                                font-size: 20px;
                                color: navy;
                                padding-left: 15px;
                                padding-right: 5px;
                    ">
                    <h1>Medications</h1>
                    <p align="justify">&emsp;Heart disease is a lifelong condition and for most people this will mean taking lifelong medication.</p>
                    <p align="justify">&emsp;Discover more about common types of heart medications in the section. Tips for staying safe while taking heart medications:</p>
                        <p align="justify" style="margin-left: 50px">1. Ask your doctor or pharmacist all your questions about your medications. Make sure you understand why you are taking these pills and how long you need to take them for</p>
                        <p align="justify" style="margin-left: 50px">2. Remember to take each dose when you need to, but if you do forget one don&rsquo;t try to catch up by taking extra tablets next time</p>
                        <p align="justify" style="margin-left: 50px">3. Plan ahead &ndash;&nbsp;Get your prescription filled in plenty of time so that you don&rsquo;t&nbsp;run out of pills</p>
                        <p align="justify" style="margin-left: 50px">4. Don&#39;t skip doses of your pills, even when you feel well and don&#39;t stop taking them without advice from your doctor or nurse - stopping suddenly can be dangerous</p>
                        <p align="justify" style="margin-left: 50px">5. Carry a list of your pills with you at all times.</p>
                </div>
                <%
            }
            else
            {
                %>
                    <div style="
                                margin-left: 50px;
                                width: 1161px;
                                height: 500px;
                                background: whitesmoke;
                                border-radius: 8px;
                                font-size: 20px;
                                color: navy;
                                padding-left: 15px;
                                padding-right: 5px;
                    ">
                    <h1>Heart attack warning signs</h1>
                    <p align="justify">&emsp;Heart attack is a leading cause of death in New Zealand. Learn to recognise the warning signs and symptoms of a heart attack, so you know what to do if you see or experience them.</p>
                    <p align="justify" style="margin-left: 50px"><img src="Heart Attack.JPG"></p>
                </div>
                <%
            }
        %>
            <br>
            <div id="banner" class="container">
            <br><br><br>
        </div>
    </div>
</body>
</html>