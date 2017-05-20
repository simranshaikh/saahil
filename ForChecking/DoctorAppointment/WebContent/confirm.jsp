<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CONFIRM</title>

<link
	href="https://fonts.googleapis.com/css?family=Overpass:100,100i,200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="styles/common.css" />

</head>
<body>
<header>
		<img src="images/logo.jpg" alt="logo">
	</header>
<%
//out.println("this is jsp page");
Connection conn=null;
try{

Class.forName("oracle.jdbc.OracleDriver");
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");
	//out.println("connected to oracle database");
 boolean isAdded=false;
 
 try{
 int pid=Integer.parseInt((session.getAttribute("pid")).toString());
 int DID = Integer.parseInt(request.getParameter("doctor"));
 int couponNo = Integer.parseInt(request.getParameter("Coupon_Num"));
 String query = "insert into appointment(Date_of_App,slot,couponNo,pid,ID) values(?,?,?,?,?)";
 
 
 PreparedStatement ps=conn.prepareStatement(query);
 ps.clearParameters();
  ps.setString(1,request.getParameter("date"));
 ps.setString(2,request.getParameter("time"));
 ps.setInt(3,couponNo);
   ps.setInt(4, pid);
 ps.setInt(5, DID);
 
 
 
 int count = ps.executeUpdate();
 
 if(count==1)
 {
 isAdded=true;
 
 out.println("                        APPOINTMENT CONFIRMED");
  
 String q2="commit";
 PreparedStatement ps1 = conn.prepareStatement(q2);
 ps.clearParameters();
 ps.execute();

 }
 }
catch(SQLException e)
{
e.printStackTrace();
}
}

catch(Exception e1)
{
e1.printStackTrace();
}




 %>
 <center>
 <h2>Patient  Appointment Already Exist</h2>
 <div class="discretePageUnits">
						<a href="AlreadyExistingPatient.html"><input type="button"
							class="buttons" value="View Appointment" style="width: 179px; "></a>
					</div>
 
 </center>
 
</body>
</html>