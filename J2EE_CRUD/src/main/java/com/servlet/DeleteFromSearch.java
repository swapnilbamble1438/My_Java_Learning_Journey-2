package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.DBConnect;
import com.dao.StudentDAO;
import com.entity.Student;


@WebServlet("/deleteFromSearch")
public class DeleteFromSearch extends HttpServlet{
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String iddd = req.getParameter("id");
		int id =  Integer.parseInt(iddd);
		
		Student idd = new Student();
		
		idd.setId(id);
		
		StudentDAO dao = new StudentDAO(DBConnect.getConn());
		
		String name = dao.getStudentById(id).getName();
		
		boolean f = dao.deleteStudent(idd);
		
		String studentsArray = null;
				
		PrintWriter out = resp.getWriter();
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		
		try {		
		
			studentsArray = dao.searchStudentByName(name);
			System.out.println(studentsArray);
			out.print(studentsArray);
			out.flush();

	
		}catch(Exception e)
		{
			out.print(studentsArray);
			out.flush();
			
		}

		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
	}
	
}
