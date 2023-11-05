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
import com.entity.Admin;




@MultipartConfig
@WebServlet("/checkAdmin")
public class checkAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public checkAdmin() {
        super();
     
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
			
			
			if (dao.checkadmin(adm)==true)
			{
				Cookie admin = new Cookie("admin",name);
				admin.setMaxAge(9999);
				response.addCookie(admin);
				response.sendRedirect("adminhome.jsp");
			}
				else
				{
					Cookie admfail = new Cookie("adminfail","admfail");
					admfail.setMaxAge(10);
					response.addCookie(admfail);
					response.sendRedirect("adminlogin.jsp");
				}
			
			}catch(Exception ex){
			   System.out.println(ex.getMessage());
			}
			
	
				
			
			
		
		
	}

}
