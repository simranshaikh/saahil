
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
	 public class LoginServlet extends HttpServlet
	 {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		
		 String u=request.getParameter("LoginID");
		 String p=request.getParameter("password");
		 
		System.out.println(p);
		
		 LoginDb ldb=new LoginDb();
		 Boolean result=ldb.getData(u,p);
	
		
		
		 
		 if(result==true){
			 RequestDispatcher rd=request.getRequestDispatcher("MidPage.jsp");
		 	 rd.forward(request,response);
		 }
		 else{ RequestDispatcher rd1=request.getRequestDispatcher("Redirect.html");
			 rd1.forward(request, response);
		 		}
	}

}
