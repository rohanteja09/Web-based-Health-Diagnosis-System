<%@page import="pro.ConfusionMatrix"%>
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
    <%@include file="Connection.jsp"%>    
       <%
                ConfusionMatrix cm = new ConfusionMatrix();
		PreparedStatement query1=con.prepareStatement("SELECT * FROM dataset1");
		ResultSet rs1=query1.executeQuery();
                String comm="";int rk=0;
                while(rs1.next())
		{
                    String id=rs1.getString("pid");
                     comm=rs1.getString("g");
                    String rank=rs1.getString("h");
                    rk=rs1.getInt("h");
                    String sub=rank.substring(0,3);
                    System.out.println(sub);
   
           %>
				<tr>
                                        <th style="color:darkblue;"><%=id%></th>
					<th style="color:darkblue;"><%=comm%></th>
					<th style="color:darkblue;"><%=sub%></th>
				</tr>
			
		<%	
                
                }
                
      
                    %>
                </table>
                
                <%
                PreparedStatement pst67 = con.prepareStatement("SELECT pid, COUNT(*)h FROM dataset1 ");
                ResultSet rs67 = pst67.executeQuery();
                while(rs67.next())
                {
                cm.increaseValue("Cinema", rs67.getString("pid"), rs67.getInt("h"));
                }
                 
            double p = cm.getPrecisionForLabel("Cinema");
            double r = cm.getRecallForLabel("Cinema");
            double fm = cm.getFMeasureForLabels().get("Cinema");
            double acc = cm.getConfidence95AccuracyHigh();  
            System.out.println(cm);
            String resultofcm=cm.toString();            
            
            System.out.println("Precision : " + p);            
           
            System.out.println("Recall : " + r);            
            
            System.out.println("F-measure  F_tp,fp: " + fm);
            
            System.out.println("Accuracy : "+acc);
            %>
            <br><br><br>
            <div style="background-color: white;margin-left:230px;margin-right:230px;">
                
   <h1 style="color: blue; font-size: 27px;">&emsp; &emsp;Classification Result & Performance Metrics <br><br></h1>
   
   <h3>&emsp; &emsp;Precision Value is : <span  style="color: blue;"><%=p%></span></h3>
   <br>
    <h3>&emsp; &emsp;Recall Value is : <span  style="color: blue;"><%=r%></span></h3>
   <br>
    <h3>&emsp; &emsp;F1 Measure Value is : <span  style="color: blue;"><%=fm%></span></h3>
   <br>
    <h3>&emsp; &emsp;Accuracy Value is : <span  style="color: blue;"><%=acc%></span></h3>
   <br><br>
            <br>
            <div id="banner" class="container">
            <br><br><br>
        </div>
    </div>
</body>
</html>