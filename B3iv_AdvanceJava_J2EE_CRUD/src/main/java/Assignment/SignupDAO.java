package Assignment;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

import Assignment.SignupEntity;


public class SignupDAO 
{

	private Connection conn;

	public SignupDAO(Connection conn) 
	{
		
		this.conn = conn;
	}
	// Add Student
	public boolean add(SignupEntity signup)
	{
		boolean f = false;
		
		try { 
			String sql = "insert into signup (Number,Name,Email_Id,State,City) values(?,?,?,?,?)";
			 
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, signup.getNumber());
			ps.setString(2, signup.getName());
			ps.setString(3, signup.getEmail_Id());
			ps.setString(4, signup.getState());
			ps.setString(5, signup.getCity());
			
					
			
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
	
	public List<SignupEntity> display()
	{
		List<SignupEntity> list = new ArrayList<SignupEntity>();
		
		SignupEntity s = null;
		
		try {
			String sql = "select * from signup";
			PreparedStatement ps = conn.prepareStatement(sql);
			
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			s = new SignupEntity();
			s.setNumber(rs.getInt(1));
			s.setName(rs.getString(2));
			s.setEmail_Id(rs.getString(3));
			s.setState(rs.getString(4));
			s.setCity(rs.getString(5));
		
			list.add(s);
			
		}
		
		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	

}
