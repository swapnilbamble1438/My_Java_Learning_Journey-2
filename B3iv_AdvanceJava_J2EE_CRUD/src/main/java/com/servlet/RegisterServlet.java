package com.servlet;

import java.sql.*;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.StudentDAO;
import com.entity.Student;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String idd = req.getParameter("id");
		int id =  Integer.parseInt(idd);
		String name = req.getParameter("name");
		String dob = req.getParameter("dob");
		String address = req.getParameter("address");
		String qualification = req.getParameter("qualification");
		String email = req.getParameter("email");
		
		Student student = new Student();
		student.setId(id);
		student.setName(name);
		student.setDob(dob);
		student.setAddress(address);
		student.setQualification(qualification);
		student.setEmail(email);
	
		StudentDAO dao = new StudentDAO(DBConnect.getConn());
		
		// HttpSession session = req.getSession();
		
		boolean f = dao.addStudent(student);
		
		if(f)
		{
			//session.setAttribute("succMsg","Student Details submit successfully");
		//	resp.sendRedirect("recordpass.jsp");
			resp.sendRedirect("index.jsp");
			
		//	System.out.println("Student Details submit successfully");
		}
		else {
			
			//session.setAttribute("succMsg","Something went wrong on server");
			resp.sendRedirect("recordfail.jsp");
		
		//	System.out.println("Something went wrong on server");
		}
		
		
		
		// do this after inserting
		
	
		
		
		
		
		
		
	}
	
	

}
