package com.dao;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.conn.DBConnect;
import com.entity.User;




public class UserDAO 
{
	
	private Connection conn;
	
	


	public UserDAO(Connection conn)
	{
		
		this.conn = conn;
	}
	
	
	
	
	
	// Display User
	
	public List<User> getAllStudent()
	{
		List<User> list = new ArrayList<User>();
		
		User s = null;
		
		try {
			String sql = "select * from Users";
			PreparedStatement ps = conn.prepareStatement(sql);
			
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			s = new User();
			s.setName(rs.getString(1));
			s.setBirthday(rs.getString(2));
			s.setEmail_Id(rs.getString(3));
			
			list.add(s);
			
		}
		System.out.println("=======================================================================================");
		System.out.println(conn);
		System.out.println("=======================================================================================");

			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		try 
		{
		     if (conn != null) 
		     	{ conn.close(); 
		     	}
		   
		}
		catch (Exception e) 
		{
		     System.out.println(e);
		}
		
		return list;
	}
	
	public void show()
	{
		System.out.println(conn);
	}
	
	
	
	
	
	

}
