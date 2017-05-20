

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OriginalDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public OriginalDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Connection conn=null;
		
			response.setContentType("text/html");
			PrintWriter pw = response.getWriter();
			
		Class.forName("oracle.jdbc.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");
			
		 boolean isValid=false;
		 
		}
		ResultSet rs=null;
		int m_id=Integer.parseInt(request.getParameter("pId"));
		String query = "select a.slot,a.couponNo,a.pId,p.pName,d.dId,d.dName from doctor d,Appointment a,patient p where d.dId=a.dId AND a.pId=p.pId AND a.pId=?;";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.clearParameters();
		System.out.println(request.getParameter("pId"));
		ps.setInt(1,m_id);
		rs = ps.executeQuery();
		
		 <table border="1">
		 <tr>
		 
		 
		 <th>Slot</th>
		 <th>Coupon No</th>
		 <th>Patient ID</th>
		 <th>Patient Name</th>
		 <th>Doctor ID</th>
		 <th>Doctor Name</th>
		 </tr>
		 
		 <tr>
		
		 while(rs.next())
		{
		 
		  
		 <td><%= rs.getString(1) %></td>
		 <td><%= rs.getString(2) %></td>
		 <td><%= rs.getString(3) %></td>
		 <td><%= rs.getString(4) %></td>
		 <td><%= rs.getString(5) %></td>
		 <td><%= rs.getString(6) %></td>

		 </tr>
		 
		 }
		 
		 
	
	
	
	
	
	}

}
