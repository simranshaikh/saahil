<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Checking..</title>
</head>
<body>
<%
int count=0;
Connection conn=null;
try{

Class.forName("oracle.jdbc.OracleDriver");
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");
	
 boolean isValid=false;}
 catch(SQLException e)
 {
 e.printStackTrace();
 }

String query = "select count(*) from appointment where Date_of_App=? AND slot=? AND ID=?";
PreparedStatement ps = conn.prepareStatement(query);
ps.clearParameters();
ps.setString(1, request.getParameter("date"));
ps.setString(2, request.getParameter("time"));
ps.setString(3, request.getParameter("DoctorNumber"));
ResultSet rs = ps.executeQuery();

if(rs.next())
{
count=rs.getInt(1);
if(count<30)
{
out.println("Appointment date available . Click on confirm");
response.sendRedirect("confirm.html");
}
else
{
response.sendRedirect("Availability.html");
}
}
else
{
out.println("Appointment date available . Click on confirm");
response.sendRedirect("confirm.html");

}


 %>
</body>
</html>