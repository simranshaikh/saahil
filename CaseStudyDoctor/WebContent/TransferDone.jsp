<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transfer Doing</title>
</head>
<body >

<%
out.println("this is Transferdone jsp page");
Connection conn=null;

try{

Class.forName("oracle.jdbc.OracleDriver");
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");
	out.println("connected to oracle database");
 boolean isValid=false;}
 catch(SQLException e)
 {
 e.printStackTrace();
 }
 try
 {
String q = "update appointment set dateOfAppoinment=?,slot=?,couponNo=? where pId=?";
PreparedStatement ps = conn.prepareStatement(q);
ps.setString(1, request.getParameter("date"));
out.println(request.getParameter("date"));
ps.setString(2, request.getParameter("time"));
ps.setInt(3, Integer.parseInt(request.getParameter("Coupon_Num")));
ps.setInt(4, Integer.parseInt(request.getParameter("pid")));

int count = ps.executeUpdate();


if(count>0)
{
out.print("updated successfully");
}
else
{
out.print("not updated");
}
}
catch(SQLException e)
{
e.printStackTrace();
response.sendRedirect("Transfer.html");
}


 %>



</body>
</html>