package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.DBConnect;
import com.dao.AdminDAO;
import com.dao.VotersDAO;
import com.entity.Admin;
import com.entity.Voters;




@MultipartConfig
@WebServlet("/checkVoters")
public class checkVoters extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public checkVoters() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
		
		
		String password = new String(request.getParameter("password"));
		password = password.trim();
		
		String email = new String(request.getParameter("email"));
		email = email.trim();
		
		
		
		Voters vtr = new Voters();
		vtr.setEmail(email);
		vtr.setPassword(password);
		
		
		
		
		
		try{
			VotersDAO dao = new VotersDAO(DBConnect.getConn());
			
			
			if (dao.checkVoters(vtr)==true)
			{
				Cookie voter = new Cookie("voter",email);
				voter.setMaxAge(99);
				response.addCookie(voter);
				response.sendRedirect("voterhome.jsp");
			}
				else
				{
					Cookie vtrfail = new Cookie("vtrfail","vtrfail");
					vtrfail.setMaxAge(10);
					response.addCookie(vtrfail);
					response.sendRedirect("voterlogin.jsp");
				}
			
			}catch(Exception ex){
			   System.out.println(ex.getMessage());
			}
			
	
				
			
			
		
		
	}

}
