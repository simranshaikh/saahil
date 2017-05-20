<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		int count = 0;
		Connection conn = null;
		try {

			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", "system","system");

			boolean isValid = false;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		String query = "select count(*) from appointment where  DATEOFAPPOINMENT=? AND slot=? AND dId=?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.clearParameters();
		String da=request.getParameter("date");
		SimpleDateFormat sdf = new SimpleDateFormat("MM-DD-yyyy");
		java.util.Date ud=sdf.parse(da);
		java.sql.Date sd= new java.sql.Date(ud.getTime());
		
		ps.setDate(1, sd);
		ps.setString(2, request.getParameter("time"));
		ps.setString(3, request.getParameter("DoctorNumber"));
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			count = rs.getInt(1);
			if (count < 30) {
				out.println("Appointment date available . Click on confirm");
				response.sendRedirect("confirm.html");
			} else {
				response.sendRedirect("Availability.html");
			}
		} else {
			out.println("Appointment date available . Click on confirm");
			response.sendRedirect("confirm.html");

		}
	%>

</body>
</html>