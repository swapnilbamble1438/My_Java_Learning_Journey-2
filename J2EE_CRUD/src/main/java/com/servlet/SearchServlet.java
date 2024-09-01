package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.DBConnect;
import com.dao.StudentDAO;
import com.entity.Student;


@WebServlet("/search")
public class SearchServlet extends HttpServlet{
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String name = req.getParameter("name");
		
		String studentsArray = null;
		
		StudentDAO dao = new StudentDAO(DBConnect.getConn());
		
		PrintWriter out = resp.getWriter();
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		
		try {		
		
			studentsArray = dao.searchStudentByName(name);
		
				System.out.println(studentsArray);
				out.print(studentsArray);
				out.flush();
	//	    out.print(studentsArray);
	//			req.setAttribute("studentList",studentList);
	//			resp.sendRedirect("search.jsp");
	
		}catch(Exception e)
		{
	//		System.out.println("Exception: " + e);
			out.print(studentsArray);
			out.flush();
	//		System.out.println("studentEmail: Not Found");
	//		resp.sendRedirect("search.jsp");
			
		}
	
	}

	
	
}
