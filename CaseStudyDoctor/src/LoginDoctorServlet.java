
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginDoctorServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("0");
		String u = request.getParameter("LoginID");
		String p = request.getParameter("password");
		System.out.println("1");
		LoginDoctor ldb = new LoginDoctor();
		System.out.println("2");
		Boolean result = ldb.getData(u, p);
		System.out.println("3");

		if (result == true) {
			System.out.println("4");
			RequestDispatcher rd = request.getRequestDispatcher("ViewMyAppointments.html");
			rd.forward(request, response);
		} else {
			System.out.println("5");
			RequestDispatcher rd1 = request.getRequestDispatcher("Redirect.html");
			rd1.forward(request, response);
		}
	}

}
