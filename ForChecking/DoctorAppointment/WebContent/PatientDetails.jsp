<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Details</title>
</head>
<body>
<%
out.println("this is jsp page");
Connection conn=null;
try{

Class.forName("oracle.jdbc.OracleDriver");
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");
	out.println("connected to oracle database");
 boolean isAdded=false;
 
 try{
 
 String query = "insert into patient(pid,pname,page,pgender,pcontact,paddress) values(?,?,?,?,?,?)";
 PreparedStatement ps=conn.prepareStatement(query);
 ps.clearParameters();
 ps.setString(1,request.getParameter("pid"));
 ps.setString(2, request.getParameter("name"));
 ps.setString(3, request.getParameter("age"));
  ps.setString(4, request.getParameter("gender"));
 ps.setString(5, request.getParameter("contact"));
 ps.setString(6, request.getParameter("address"));
 
 int count = ps.executeUpdate();
 
 HttpSession s = request.getSession(true);
 s.setAttribute("pid", request.getParameter("pid"));
 
 
 if(count==1)
 {
 isAdded=true;
 out.println("*****user added*******");
  response.sendRedirect("Appointment.html");
 String q="commit";
 PreparedStatement ps1 = conn.prepareStatement(q);
 ps.clearParameters();
 ps.execute();
 }
 }
catch(SQLException e)
{
e.printStackTrace();
response.sendRedirect("PatientDetailsExisting.html");
}
}

catch(Exception e1)
{
e1.printStackTrace();
}




 %>
</body>
</html>