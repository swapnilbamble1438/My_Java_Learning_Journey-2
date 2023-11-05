package com.servlet;

import java.io.IOException;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.DBConnect;
import com.dao.VotersDAO;
import com.entity.Voters;





@MultipartConfig
@WebServlet("/addVoters")
public class addVoters extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public addVoters() {
       
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		String name = new String(request.getParameter("name"));
		name = name.trim();
		
		String password = new String(request.getParameter("password"));
		password = password.trim();
		
		String email = new String(request.getParameter("email"));
		email = email.trim();
	
		String phone = new String(request.getParameter("phone"));
		phone = phone.trim();
		
		
		Voters vtr = new Voters();
		vtr.setName(name);
		vtr.setPassword(password);
		vtr.setEmail(email);
		vtr.setPhone(Integer.parseInt(phone));
		
		
		
		
		try{
			VotersDAO dao =new VotersDAO(DBConnect.getConn());
			
			
		 	if(dao.checkVoters2(vtr) == true)
			{
		 		Cookie vtrnotadded = new Cookie("vtrnotadded","vtrnotadded");
				vtrnotadded.setMaxAge(10);
				response.addCookie(vtrnotadded);
				response.sendRedirect("voterregistration.jsp");
				
				
			}
			else
			{
		
			    if(dao.addVoters(vtr) > 0)
			    {
			    	Cookie vtradded = new Cookie("vtradded","vtradded");
					vtradded.setMaxAge(10);
					response.addCookie(vtradded);
			    	response.sendRedirect("voterlogin.jsp");
			    }
			    else {
			    	Cookie vtrnotadded = new Cookie("vtrnotadded","vtrnotadded");
					vtrnotadded.setMaxAge(10);
					response.addCookie(vtrnotadded);
			    	response.sendRedirect("voterregistration.jsp");
			    }
			
			}
			
		}catch (Exception ex){
			System.out.println(ex);
		}

	
			
	
				
			
			
		
		
	}

}
