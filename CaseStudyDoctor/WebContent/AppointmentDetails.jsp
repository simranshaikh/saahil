<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Appointment Details</title>
<link
	href="https://fonts.googleapis.com/css?family=Overpass:100,100i,200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/common.css" />
</head>
<body>
	<header> 
		<%@include file="header.jsp"%>
	</header>
	<center>
		<h2>APPOINTMENT DETAILS</h2>
		<%
			Connection conn = null;
			try {

				Class.forName("oracle.jdbc.OracleDriver");
				conn = DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:XE", "system",
						"system");

				boolean isValid = false;
			} catch (SQLException e) {
				e.printStackTrace();
			}

			String query = "select a.dateOfAppoinment,a.slot,a.couponNo,a.pId,p.pName,a.dId,d.dName,d.specialization from doctor d,Appointment a,patient p where d.dId=a.dId AND a.pId=p.pId AND a.pId=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.clearParameters();
			
			ps.setString(1, request.getParameter("pId"));
			ResultSet rs = ps.executeQuery();
		%>
		<%= request.getParameter("pid")%>
		<table border="1">
			<tr>

				<th>Date</th>
				<th>Slot</th>
				<th>Coupon Number</th>
				<th>Patient ID</th>
				<th>Patient Name</th>
				<th>Doctor ID</th>
				<th>Doctor Name</th>
				<th>Doctor Specialization</th>
			</tr>

			<tr>
				<%
					while (rs.next()) {
				%>

				<td><%=rs.getDate(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
			</tr>
			<%
				}
			%>









		</table>



	</center>
</body>
</html>