import java.sql.*;




public class LoginDoctor{
	
	public boolean getData(String user,String pwd)
	{
		
		Connection conn=null;
		boolean flag=false;
		try{

		Class.forName("oracle.jdbc.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","system");
			System.out.println("connected to oracle database");
		 boolean isValid=false;
				String query="select * from DoctorLogin where loginId = ? and password = ?";
					
				System.out.println("ggggggggg");
				PreparedStatement ps=conn.prepareStatement(query);
					ps.clearParameters();
					ps.setString(1, user);
					ps.setString(2, pwd);
					ResultSet rs=ps.executeQuery();
					if(rs.next()){
						flag=true;
						
					}
		 }
		 catch(ClassNotFoundException e1)
		 {e1.printStackTrace();}
		 catch(Exception e)
		{
		    e.printStackTrace();
		}
		return flag;

}
}
