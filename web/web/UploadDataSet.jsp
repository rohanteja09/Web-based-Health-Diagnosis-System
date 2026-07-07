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
    height: 160px;
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
<div id="header-featured">
	<div id="banner" class="container">
	<p style="margin-top: 90px;color: mediumvioletred;font-size: -webkit-xxx-large;">Upload Disease Related DataSets</p> 
	<div id=readfile align=center>
	<br>
        <form action="Datasets"name="form1" method="post" enctype="multipart/form-data">
            <table align="center" style="
                color: lightpink;
                font-size: 20px;
                
            ">
            <tr><td>Upload Datasets</td><td><input type="file" name="data"></td></tr>
            <tr align="center"><td colspan="2"><input type="submit" value="Upload"></td></tr>
        </table>
        </form>
        <form action="Diagnos_Dataset"name="form1" method="post" enctype="multipart/form-data">
            <table align="center" style="
                color: lightpink;
                font-size: 20px;
                
            ">
            <tr><td>Upload Datasets</td><td><input type="file" name="file"></td></tr>
            <tr align="center"><td colspan="2"><input type="submit" value="Upload"></td></tr>
        </table>
        </form>
	</div>
	</div>
</div>
</body>
</html>