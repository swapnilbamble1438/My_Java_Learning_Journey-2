package Assignment;


import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;







@WebServlet("/addServlet")
public class addServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String id = req.getParameter("Number");
		int Number =  Integer.parseInt(id);
		String Name = req.getParameter("Name");
		String Email_Id = req.getParameter("Email_Id");
		String State = req.getParameter("State");
		String City = req.getParameter("City");
		
		
		SignupEntity signup = new SignupEntity();
		signup.setNumber(Number);
		signup.setName(Name);
		signup.setEmail_Id(Email_Id);
		signup.setState(State);
		signup.setCity(City);
		
	
		SignupDAO dao = new SignupDAO(DBConnect.getConn());
		
		// HttpSession session = req.getSession();
		
		boolean f = dao.add(signup);
		
		if(f)
		{
			
		//	resp.sendRedirect("recordpass.jsp");
			//session.setAttribute("succMsg","Student Details submit successfully");
			Cookie on = new Cookie("one","two");
			on.setMaxAge(9999);
			resp.addCookie(on);
		
			resp.sendRedirect("displaySignup.jsp");
			
			
		//	System.out.println("Student Details submit successfully");
		}
		else {
			
			//session.setAttribute("succMsg","Something went wrong on server");
			// resp.sendRedirect("recordfail.jsp");
		
			System.out.println("Something went wrong on server");
		}
		
		
		
		// do this after inserting
		
	
		
		
		
		
		
		
	}
	
	

}
