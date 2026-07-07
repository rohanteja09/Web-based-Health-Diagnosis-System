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
            <p align="center" style="font-size: larger;color: chartreuse;">Disease Search By Patient ID</p>
            <form action="SearchAction.jsp">
            <table align="center" border=1 style="width: 454px;text-transform: uppercase;text-align: center;color: wheat;font-weight: bold;line-height: 2;background: purple;border-radius: 13px;">
                <tr>
                    <td>Enter Id</td>
                    <td><input type="text" name="id" required></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Search" style="width: 111px;height: 37px;"></td>
                </tr>
            </table>
           </form>
        </div>
</div>
</body>
</html>