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
    <p align="center" style="font-size: 30px;color: chartreuse;">Risk Based on Patients and Diagnostic Data</p>
    <%@include file="Connection.jsp"%>    
        <table align="left" border=1 style="width: 432px;text-transform: uppercase;text-align: center;color: black;font-weight: bold;line-height: 2;background: aliceblue;border-radius: 13px;">
            <tr align="center" style="color: navy; background: antiquewhite;"><td colspan="3">Diagnostic Data Risk</td></tr>
            <tr align="center" style="color: navy; background: antiquewhite; font-size: 13px;"><td colspan="3">risk based on (gender, age,name, diagnostic times, recording times, diagnostic events)</td></tr>
            <%
                String uid=request.getParameter("id");
                query=con.prepareStatement("select * from dataset where id='"+uid+"' ");
                rs=query.executeQuery();
                //Decision Tree Algorithm Code
                int cp=0,trestbps=0,chol=0,fbs=0,restecg=0,thalach=0,exang=0,oldpeak=0,slope=0,ca=0,thal=0,num=0; 
                int age=0,gender=0;
                while(rs.next())
                {
                    age=rs.getInt(2);
                    gender=rs.getInt(3);
                    cp=rs.getInt(4);
                    trestbps=rs.getInt(5);
                    chol=rs.getInt(6);
                    fbs=rs.getInt(7);
                    restecg=rs.getInt(8);
                    thalach=rs.getInt(9);
                    exang=rs.getInt(10);
                    oldpeak=rs.getInt(11);
                    slope=rs.getInt(12);
                    ca=rs.getInt(13);
                    thal=rs.getInt(14);
                    num=rs.getInt(15);
                }
                //CNN Algorithm Processing
                int S_L=0,S_N=0,S_H=0;
                int US_L=0,US_N=0,US_H=0;
                
                CNN c=new CNN();
                System.out.println("Set User Datasets Value");
                c.chest_pain(cp);
                c.resting_blood_pressure(trestbps);
                c.serum_cholestoral(chol);
                c.fasting_blood_sugar(fbs);
                c.resting_electrocardiographic_results(restecg);
                c.heart_rate_achieved(thalach);
                c.exercise_induced_angina(exang);
                c.ST_depression_induced_by_exercise(oldpeak);
                c.slope_of_the_peak_exercise(slope);
                c.number_of_major_vessels(ca);//ca
                c.thal(thal);
                c.num(num);
        
                System.out.println("Display Users Datasets Value Result");
                String cp1=c.get_chest_pain();
                String rbp1=c.get_resting_blood_pressure();
                String sc1=c.get_serum_cholestoral();
                String fbs1=c.get_fasting_blood_sugar();
                String rer1=c.get_resting_electrocardiographic_results();
                String hra1=c.get_heart_rate_achieved();
                String eia1=c.get_exercise_induced_angina();
                String sibye1=c.get_ST_depression_induced_by_exercise();
                String sotpe1=c.get_slope_of_the_peak_exercise();
                String nomv1=c.get_number_of_major_vessels();
                String thal1=c.get_thal();
                String num1=c.get_num();
                
                //CART (Classification And Regression Tree) algorithm calling function
                LSTM d=new LSTM();
                d.set_decision_tree(""+age, ""+gender, "David");
                String ar[]=d.get_decision_tree();
                System.out.println(ar[0]);
                System.out.println(ar[1]);
                
                query=con.prepareStatement("select * from dataset where id='"+uid+"' ");
                rs=query.executeQuery();
                if(rs.next())
                {
                    %>
                    <tr>
                        <td>id</td><td><%=rs.getString(1).substring(0, rs.getString(1).lastIndexOf("."))%></td>
                        <td>---</td>
                    </tr>
                        <tr>
                            <td>age</td><td><%=rs.getString(2)%></td>
                            <%
                                    if(ar[0].equalsIgnoreCase("HIGH LEVEL"))
                                    {
                                        S_H++;
                                        %>
                                            <td style="background: red;color: white;"><%=ar[0]%></td>
                                        <%
                                    }
                                    else if(ar[0].equalsIgnoreCase("LOW LEVEL"))
                                    {
                                        S_L++;
                                        %>
                                        <td  style="background: yellow;color: black;"><%=ar[0]%></td>
                                        <%
                                    }
                                    else if(ar[0].equalsIgnoreCase("NORMAL LEVEL"))
                                    {
                                        S_N++;
                                        %>
                                            <td  style="background: green;color: white;"><%=ar[0]%></td>
                                        <%
                                    }
                                %>
                        </tr>
                        <tr>
                            <td>gender</td><td><%=rs.getString(3)%></td>
                            <%
                                    if(ar[1].equalsIgnoreCase("HIGH LEVEL"))
                                    {
                                        S_H++;
                                        %>
                                            <td style="background: red;color: white;"><%=ar[1]%></td>
                                        <%
                                    }
                                    else if(ar[1].equalsIgnoreCase("LOW LEVEL"))
                                    {S_L++;
                                        %>
                                        <td  style="background: yellow;color: black;"><%=ar[1]%></td>
                                        <%
                                    }
                                    else if(ar[1].equalsIgnoreCase("NORMAL LEVEL"))
                                    {S_N++;
                                        %>
                                            <td  style="background: green;color: white;"><%=ar[1]%></td>
                                        <%
                                    }
                                %>
                        </tr>
                        <tr>
                            <td>name</td><td>xxx</td>
                            <td>---</td>
                        </tr>
                    <%
                }
                    %>
            </table>
            
            <!--UnStructured Data Risk-->
            <table align="right" border=1 style="width: 432px;text-transform: uppercase;text-align: center;color: black;font-weight: bold;line-height: 2;background: aliceblue;border-radius: 13px;">
            <tr align="center" style="color: navy; background: antiquewhite;"><td colspan="3">Patient Data Risk</td></tr>
            <tr align="center" style="color: navy; background: antiquewhite; font-size: 11px;"><td colspan="3">un risk based on (cp, trestbps, chol, fbs, restecg, thalach, exang, oldpeak, slope, ca, thal,num)</td></tr>
            <%
                query=con.prepareStatement("select * from dataset where id='"+uid+"' ");
                rs=query.executeQuery();
                if(rs.next())
                {
                    %>
                        <tr>
                            <td>cp</td>
                            <td><%=rs.getString(4)%></td>
                                <%
                                    if(cp1.equalsIgnoreCase("HIGH LEVEL"))
                                    {US_H++;
                                        %>
                                            <td style="background: red;color: white;"><%=cp1%></td>
                                        <%
                                    }
                                    else if(cp1.equalsIgnoreCase("LOW LEVEL"))
                                    {US_L++;
                                        %>
                                        <td  style="background: yellow;color: black;"><%=cp1%></td>
                                        <%
                                    }
                                    else if(cp1.equalsIgnoreCase("NORMAL LEVEL"))
                                    {US_N++;
                                        %>
                                            <td  style="background: green;color: white;"><%=cp1%></td>
                                        <%
                                    }
                                %>
                        </tr>
                        <tr>
                            <td>trestbps</td><td><%=rs.getString(5)%></td>
                                <%
                                    if(rbp1.equalsIgnoreCase("HIGH LEVEL"))
                                    {US_H++;
                                        %>
                                            <td style="background: red;color: white;"><%=rbp1%></td>
                                        <%
                                    }
                                    else if(rbp1.equalsIgnoreCase("LOW LEVEL"))
                                    {US_L++;
                                        %>
                                        <td  style="background: yellow;color: black;"><%=rbp1%></td>
                                        <%
                                    }
                                    else if(rbp1.equalsIgnoreCase("NORMAL LEVEL"))
                                    {US_N++;
                                        %>
                                            <td  style="background: green;color: white;"><%=rbp1%></td>
                                        <%
                                    }
                                %>
                        </tr>
                        <tr>
                            <td>chol</td><td><%=rs.getString(6)%></td>
                            <%
                                    if(sc1.equalsIgnoreCase("HIGH LEVEL"))
                                    {US_H++;
                                        %>
                                            <td style="background: red;color: white;"><%=sc1%></td>
                                        <%
                                    }
                                    else if(sc1.equalsIgnoreCase("LOW LEVEL"))
                                    {US_L++;
                                        %>
                                        <td  style="background: yellow;color: black;"><%=sc1%></td>
                                        <%
                                    }
                                    else if(sc1.equalsIgnoreCase("NORMAL LEVEL"))
                                    {US_N++;
                                        %>
                                            <td  style="background: green;color: white;"><%=sc1%></td>
                                        <%
                                    }
                                %>
                        </tr>
                        <tr>
                            <td>fbs</td><td><%=rs.getString(7)%></td>
                            <%
                                    if(fbs1.equalsIgnoreCase("HIGH LEVEL"))
                                    {US_H++;
                                        %>
                                            <td style="background: red;color: white;"><%=fbs1%></td>
                                        <%
                                    }
                                    else if(fbs1.equalsIgnoreCase("LOW LEVEL"))
                                    {US_L++;
                                        %>
                                        <td  style="background: yellow;color: black;"><%=fbs1%></td>
                                        <%
                                    }
                                    else if(fbs1.equalsIgnoreCase("NORMAL LEVEL"))
                                    {US_N++;
                                        %>
                                            <td  style="background: green;color: white;"><%=fbs1%></td>
                                        <%
                                    }
                                %>
                        </tr>
                        <tr>
                            <td>restecg</td><td><%=rs.getString(8)%></td>
                            <%
                                    if(rer1.equalsIgnoreCase("HIGH LEVEL"))
                                    {US_H++;
                                        %>
                                            <td style="background: red;color: white;"><%=rer1%></td>
                                        <%
                                    }
                                    else if(rer1.equalsIgnoreCase("LOW LEVEL"))
                                    {US_L++;
                                        %>
                                        <td  style="background: yellow;color: black;"><%=rer1%></td>
                                        <%
                                    }
                                    else if(rer1.equalsIgnoreCase("NORMAL LEVEL"))
                                    {US_N++;
                                        %>
                                            <td  style="background: green;color: white;"><%=rer1%></td>
                                        <%
                                    }
                                %>
                        </tr>
                        <tr>
                            <td>thalach</td><td><%=rs.getString(9)%></td>
                            <%
                                    if(hra1.equalsIgnoreCase("HIGH LEVEL"))
                                    {US_H++;
                                        %>
                                            <td style="background: red;color: white;"><%=hra1%></td>
                                        <%
                                    }
                                    else if(hra1.equalsIgnoreCase("LOW LEVEL"))
                                    {US_L++;
                                        %>
                                        <td  style="background: yellow;color: black;"><%=hra1%></td>
                                        <%
                                    }
                                    else if(hra1.equalsIgnoreCase("NORMAL LEVEL"))
                                    {US_N++;
                                        %>
                                            <td  style="background: green;color: white;"><%=hra1%></td>
                                        <%
                                    }
                                %>
                        </tr>
                        <tr>
                            <td>exang</td><td><%=rs.getString(10)%></td>
                            <%
                                    if(eia1.equalsIgnoreCase("HIGH LEVEL"))
                                    {US_H++;
                                        %>
                                            <td style="background: red;color: white;"><%=eia1%></td>
                                        <%
                                    }
                                    else if(eia1.equalsIgnoreCase("LOW LEVEL"))
                                    {US_L++;
                                        %>
                                        <td  style="background: yellow;color: black;"><%=eia1%></td>
                                        <%
                                    }
                                    else if(eia1.equalsIgnoreCase("NORMAL LEVEL"))
                                    {US_N++;
                                        %>
                                            <td  style="background: green;color: white;"><%=eia1%></td>
                                        <%
                                    }
                                %>
                        </tr>
                        <tr>
                            <td>oldpeak</td><td><%=rs.getString(11)%></td>
                            <%
                                    if(sibye1.equalsIgnoreCase("HIGH LEVEL"))
                                    {US_H++;
                                        %>
                                            <td style="background: red;color: white;"><%=sibye1%></td>
                                        <%
                                    }
                                    else if(sibye1.equalsIgnoreCase("LOW LEVEL"))
                                    {US_L++;
                                        %>
                                        <td  style="background: yellow;color: black;"><%=sibye1%></td>
                                        <%
                                    }
                                    else if(sibye1.equalsIgnoreCase("NORMAL LEVEL"))
                                    {US_N++;
                                        %>
                                            <td  style="background: green;color: white;"><%=sibye1%></td>
                                        <%
                                    }
                                %>
                        </tr>
                        <tr>
                            <td>slope</td><td><%=rs.getString(12)%></td>
                            <%
                                    if(sotpe1.equalsIgnoreCase("HIGH LEVEL"))
                                    {US_H++;
                                        %>
                                            <td style="background: red;color: white;"><%=sotpe1%></td>
                                        <%
                                    }
                                    else if(sotpe1.equalsIgnoreCase("LOW LEVEL"))
                                    {US_L++;
                                        %>
                                        <td  style="background: yellow;color: black;"><%=sotpe1%></td>
                                        <%
                                    }
                                    else if(sotpe1.equalsIgnoreCase("NORMAL LEVEL"))
                                    {US_N++;
                                        %>
                                            <td  style="background: green;color: white;"><%=sotpe1%></td>
                                        <%
                                    }
                                %>
                        </tr>
                        <tr>
                            <td>ca</td><td><%=rs.getString(13)%></td>
                            <%
                                    if(nomv1.equalsIgnoreCase("HIGH LEVEL"))
                                    {US_H++;
                                        %>
                                            <td style="background: red;color: white;"><%=nomv1%></td>
                                        <%
                                    }
                                    else if(nomv1.equalsIgnoreCase("LOW LEVEL"))
                                    {US_L++;
                                        %>
                                        <td  style="background: yellow;color: black;"><%=nomv1%></td>
                                        <%
                                    }
                                    else if(nomv1.equalsIgnoreCase("NORMAL LEVEL"))
                                    {US_N++;
                                        %>
                                            <td  style="background: green;color: white;"><%=nomv1%></td>
                                        <%
                                    }
                                %>
                        </tr>
                        <tr>
                            <td>thal</td><td><%=rs.getString(14)%></td>
                            <%
                                    if(thal1.equalsIgnoreCase("HIGH LEVEL"))
                                    {US_H++;
                                        %>
                                            <td style="background: red;color: white;"><%=thal1%></td>
                                        <%
                                    }
                                    else if(thal1.equalsIgnoreCase("LOW LEVEL"))
                                    {US_L++;
                                        %>
                                        <td  style="background: yellow;color: black;"><%=thal1%></td>
                                        <%
                                    }
                                    else if(thal1.equalsIgnoreCase("NORMAL LEVEL"))
                                    {US_N++;
                                        %>
                                            <td  style="background: green;color: white;"><%=thal1%></td>
                                        <%
                                    }
                                %>
                        </tr>
                        <tr>
                            <td>num</td><td><%=rs.getString(15)%></td>
                            <%
                                    if(num1.equalsIgnoreCase("HIGH LEVEL"))
                                    {US_H++;
                                        %>
                                            <td style="background: red;color: white;"><%=num1%></td>
                                        <%
                                    }
                                    else if(num1.equalsIgnoreCase("LOW LEVEL"))
                                    {US_L++;
                                        %>
                                        <td  style="background: yellow;color: black;"><%=num1%></td>
                                        <%
                                    }
                                    else if(num1.equalsIgnoreCase("NORMAL LEVEL"))
                                    {US_N++;
                                        %>
                                            <td  style="background: green;color: white;"><%=num1%></td>
                                        <%
                                    }
                                %>
                        </tr>
                    <%
                }
                System.out.println("This is all value USH= "+US_H+"  USL = "+US_L+" SH = "+S_H+"  SL = "+S_L);
                    %>
            </table>
            <h2 align="center"><a href="RiskResult.jsp?usn=<%=US_N%>&&usl=<%=US_L%>&&ush=<%=US_H%>&&sn=<%=S_N%>&&sl=<%=S_L%>&&sh=<%=S_H%>" style="color: wheat;">Check Over all Risk</a></h2>
	<div id="banner" class="container">
            <br><br><br>
        </div>
    </div>
</body>
</html>