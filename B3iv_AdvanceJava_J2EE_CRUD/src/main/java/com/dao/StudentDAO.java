package com.dao;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Student;
import com.mysql.cj.protocol.Resultset;


public class StudentDAO 
{

	private Connection conn;

	public StudentDAO(Connection conn) 
	{
		
		this.conn = conn;
	}
	// Add Student
	public boolean addStudent(Student student)
	{
		boolean f = false;
		
		try { 
			String sql = "insert into student (id,name,dob,address,qualification,email) values(?,?,?,?,?,?)";
			 
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, student.getId());
			ps.setString(2, student.getName());
			ps.setString(3, student.getDob());
			ps.setString(4, student.getAddress());
			ps.setString(5, student.getQualification());
			ps.setString(6, student.getEmail());
					
			
			int i = ps.executeUpdate();
			
					
			if(i == 1)
			{
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	// do this after Add Student
	
	// Display Student in Home Page
	
	public List<Student> getAllStudent()
	{
		List<Student> list = new ArrayList<Student>();
		
		Student s = null;
		
		try {
			String sql = "select * from student";
			PreparedStatement ps = conn.prepareStatement(sql);
			
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			s = new Student();
			s.setId(rs.getInt(1));
			s.setName(rs.getString(2));
			s.setDob(rs.getString(3));
			s.setAddress(rs.getString(4));
			s.setQualification(rs.getString(5));
			s.setEmail(rs.getString(6));
			list.add(s);
			
		}
		
		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// do this after displaying student table at home page
	
	// display selected student values in edit student page
	
	public Student getStudentById(int id) {
		
		Student s = null;
		

		try {
			String sql = "select * from student where id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			s = new Student();
			s.setId(rs.getInt(1));
			s.setName(rs.getString(2));
			s.setDob(rs.getString(3));
			s.setAddress(rs.getString(4));
			s.setQualification(rs.getString(5));
			s.setEmail(rs.getString(6));
			
			
		}
		
		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return s;
		
	
		
	}
	
	// Update Student
	
	public boolean updateStudent(Student student)
	{
		boolean f = false;
		
		try { 
			String sql = "update student set id=?,name=?,dob=?,address=?,qualification=?,email=? where id = ? ";
			 
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, student.getId());
			ps.setString(2, student.getName());
			ps.setString(3, student.getDob());
			ps.setString(4, student.getAddress());
			ps.setString(5, student.getQualification());
			ps.setString(6, student.getEmail());
			
			ps.setInt(7, student.getId()); // this seventh parameter is for 'where id = ?';
					
			
			int i = ps.executeUpdate();
			
					
			if(i == 1)
			{
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	// Delete Student
	
	public boolean deleteStudent(Student idd)
	{
		boolean f = false;
		
		try {
			
			String sql = "delete from student where id = ?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, idd.getId());
			
			int i = ps.executeUpdate();
			
			
			if(i == 1)
			{
				f = true;
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	

}
