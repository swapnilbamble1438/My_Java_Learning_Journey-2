package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.DBConnect;
import com.dao.StudentDAO;
import com.entity.Student;


@WebServlet("/delete")
public class DeleteServlet extends HttpServlet{
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String iddd = req.getParameter("id");
		int id =  Integer.parseInt(iddd);
		
		Student idd = new Student();
		
		idd.setId(id);
		
		StudentDAO dao = new StudentDAO(DBConnect.getConn());
		
		boolean f = dao.deleteStudent(idd);
		
		
		if(f)
		{
			//session.setAttribute("succMsg","Student Details submit successfully");
			resp.sendRedirect("index.jsp");
			
		//	System.out.println("Student Details submit successfully");
		}
		else {
			
			//session.setAttribute("succMsg","Something went wrong on server");
			resp.sendRedirect("recordfail.jsp");
		
		//	System.out.println("Something went wrong on server");
		}	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
	}
	
}
