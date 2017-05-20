<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Original Appointment Details</title>
<link
	href="https://fonts.googleapis.com/css?family=Overpass:100,100i,200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="styles/common.css" />
</head>
<body>

	<header>
		<img src="images/logo.jpg" alt="logo">
	</header>
<center>
<h2>PATIENT APPOINTMENT DETAILS</h2>
<%
Connection conn=null;
try{

Class.forName("oracle.jdbc.OracleDriver");
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");
	out.println("connected to oracle database");
 boolean isValid=false;}
  catch(SQLException e)
{e.printStackTrace();
}

String query = "select a.slot,a.couponno,a.pid,p.pname,d.Id,d.dname from doctor d,Appointment a,patient p where d.ID=a.ID AND a.pid=p.pid AND p.pid=?";
PreparedStatement ps = conn.prepareStatement(query);
ps.clearParameters();
ps.setString(1, request.getParameter("pid"));
ResultSet rs = ps.executeQuery();
 %>
 <table border="1">
 <tr>
 
 
 <th>Slot</th>
 <th>CouponNo</th>
 <th>Patient_ID</th>
 <th>Patient_Name</th>
 <th>Doctor_ID</th>
 <th>Doctor_Name</th>
 </tr>
 
 <tr>
 <%
 while(rs.next())
{
  %>
  
 <td><%= rs.getString(1) %></td>
 <td><%= rs.getString(2) %></td>
 <td><%= rs.getString(3) %></td>
 <td><%= rs.getString(4) %></td>
 <td><%= rs.getString(5) %></td>
 <td><%= rs.getString(6) %></td>

 </tr>
 <%
 }
 %>
 
 </table>
 <div class="discretePageUnits">
						<a href="TransferAppointment.html"><input type="button"
							class="buttons" value="Click to transfer"></a>
					</div>
 
 
 
</center>
</body>
</html>