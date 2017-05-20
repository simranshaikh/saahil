<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Appointment Details</title>
</head>
<body>
<center>
<h2>APPOINTMENT DETAILS</h2>
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

String query = "select a.date_of_app,a.slot,a.couponno,a.pid,p.pname,p.page,p.pgender,p.pcontact from doctor d,Appointment a,patient p where d.ID=a.ID AND a.pid=p.pid AND d.ID=?";
PreparedStatement ps = conn.prepareStatement(query);
ps.clearParameters();
ps.setString(1, request.getParameter("Id"));
ResultSet rs = ps.executeQuery();
 %>
 <table border="1">
 <tr>
 
 <th>Date</th>
 <th>Slot</th>
 <th>CouponNo</th>
 <th>Patient_ID</th>
 <th>Patient_Name</th>
 <th>Patient_Age</th>
 <th>Patient_Gender</th>
 <th>Patient_ContactNo</th>
 
 </tr>
 
 <tr>
 <%
 while(rs.next())
{
  %>
  
 <td><%= rs.getDate(1) %></td>
 <td><%= rs.getString(2) %></td>
 <td><%= rs.getString(3) %></td>
 <td><%= rs.getString(4) %></td>
 <td><%= rs.getString(5) %></td>
 <td><%= rs.getString(6) %></td>
 <td><%= rs.getString(7) %></td>
 <td><%= rs.getString(8) %></td>
 </tr>
 <%
 }
 %>
 
 
 </table>
 
 
 
</center>
</body>
</html>