package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.conn.DBConnect;
import com.entity.Admin;
import com.entity.Voters;


public class AdminDAO {

	
private Connection conn;
	
	public AdminDAO(Connection conn) {
	//	conn=	DBConnect.getConn();
		this.conn = conn;
	}
	
	
	
	
	// add Admin
public int addAdmin(Admin adm) {
		
		int i = 0;
		try{
			String sql = "insert into admin (name,password) values(?,?)" ;
			PreparedStatement ps = conn.prepareStatement(sql);
		
		
		ps.setString(1, adm.getName());
		ps.setString(2, adm.getPassword());
		
		
		i = ps.executeUpdate();
		if(i > 0)
			i = 1;
		
		
		}catch(Exception ex){
		   System.out.println(ex.getMessage());
		}

	return i;
		
		
		
	}
	
	
	
	// view Admin


	public List<Admin> getAdmin(){
		List<Admin> list = new ArrayList<Admin>();
		
		Admin adm = null;
		
		try {
			String sql = "select * from admin";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				adm = new Admin();
				adm.setId(rs.getInt(1));
				adm.setName(rs.getString(2));
				adm.setPassword(rs.getString(3));
				list.add(adm);
				
			}
			
			
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
	
	
	// view Admin by id

		public List<Admin> getAdminById(int id){
			List<Admin> list = new ArrayList<Admin>();
			
			Admin adm = null;
			
			try {
				String sql = "select * from admin where id = ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setInt(1, id);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next())
				{
					adm = new Admin();
					adm.setName(rs.getString(1));
					adm.setPassword(rs.getString(2));
					
					
					list.add(adm);
					
				}
				
				
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				return list;
			}
		
		
		//delete Admin 
		

		public void deleteAdmin(int id) {
			
			
			try{
				String sql = "delete from admin where id = ?";
				PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, id);
			
		ps.executeUpdate();
			
			
			}catch(Exception ex){
			   System.out.println(ex.getMessage());
			}

			
			
		}
	
		
		// check Admin login
		
			public boolean checkadmin(Admin adm)
			{
				boolean f = false;
			
			
				try{
					String sql = "select * from admin  where name=? and password=?";
					PreparedStatement ps = conn.prepareStatement(sql);
				
				
				ps.setString(1, adm.getName());
				ps.setString(2, adm.getPassword());
				
				ResultSet rs=ps.executeQuery();
				if (rs.next()==true)
					f = true;
				else
					f = false;
				
				}catch(Exception ex){
				   System.out.println(ex.getMessage());
				}

			return f;
					
			}
			
			
			// check Admin login before new admin registration
			
				public boolean checkadmin2(Admin adm)
				{
					boolean f = false;
				
				
					try{
						String sql = "select * from admin  where name=?";
						PreparedStatement ps = conn.prepareStatement(sql);
					
					
					ps.setString(1, adm.getName());
					
					ResultSet rs=ps.executeQuery();
					if (rs.next()==true)
						f = true;
					else
						f = false;
					
					}catch(Exception ex){
					   System.out.println(ex.getMessage());
					}

				return f;
						
				}
			
	
		
			

}
