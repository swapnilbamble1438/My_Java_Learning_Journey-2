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
import com.dao.AdminDAO;
import com.dao.VotersDAO;
import com.entity.Admin;
import com.entity.Voters;





@MultipartConfig
@WebServlet("/addAdmin")
public class addAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public addAdmin() {
       
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		String name = new String(request.getParameter("name"));
		name = name.trim();
		
		String password = new String(request.getParameter("password"));
		password = password.trim();
		
		
		
		
		Admin adm = new Admin();
		adm.setName(name);
		adm.setPassword(password);
	
		
		try{
			AdminDAO dao = new AdminDAO(DBConnect.getConn());
			
			
		 	if(dao.checkadmin2(adm) == true)
			{
				
				response.sendRedirect("fail.jsp");
				
				
			}
			else
			{
		
			    if(dao.addAdmin(adm) > 0)
			    {
			    	Cookie admadded = new Cookie("admadded","admadded");
					admadded.setMaxAge(10);
					response.addCookie(admadded);
			    	response.sendRedirect("adminlogin.jsp");
			    }
			    else {
			    	Cookie admnotadded = new Cookie("admnotadded","admnotadded");
					admnotadded.setMaxAge(10);
					response.addCookie(admnotadded);
			    	response.sendRedirect("fail.jsp");
			    }
			
			}
			
		}catch (Exception ex){
			System.out.println(ex);
		}

	
			
	
				
			
			
		
		
	}

}
