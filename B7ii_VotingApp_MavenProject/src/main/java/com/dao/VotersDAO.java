package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.conn.DBConnect;
import com.entity.Voters;


public class VotersDAO {
	
private Connection conn;
	
	public VotersDAO(Connection conn) {
	// conn=	DBConnect.getConn();
		this.conn = conn;
		
	}
	
	
	

	//view all Voters


	public List<Voters> getVoters(){
		List<Voters> list = new ArrayList<Voters>();
		
		Voters vtr = null;
		
		try {
			String sql = "select * from voters";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				vtr = new Voters();
				vtr.setId(rs.getInt(1));
				vtr.setName(rs.getString(2));
				vtr.setPassword(rs.getString(3));
				vtr.setEmail(rs.getString(4));
				vtr.setPhone(rs.getInt(5));
				list.add(vtr);
				
			}
			
			
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
	
	// view voters by id

	public List<Voters> getVotersById(int id){
		List<Voters> list = new ArrayList<Voters>();
		
		Voters vtr = null;
		
		try {
			String sql = "select * from voters where id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				vtr = new Voters();
				vtr.setName(rs.getString(1));
				vtr.setPassword(rs.getString(1));
				vtr.setEmail(rs.getString(1));
				vtr.setPhone(rs.getInt(1));
				
				list.add(vtr);
				
			}
			
			
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
	
	// view voters by email

		public List<Voters> getVotersByEmail(String email){
			List<Voters> list = new ArrayList<Voters>();
			
			Voters vtr = null;
			
			try {
				String sql = "select * from voters where email = ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setString(1, email);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next())
				{
					vtr = new Voters();
					vtr.setName(rs.getString(1));
					vtr.setPassword(rs.getString(1));
					vtr.setEmail(rs.getString(1));
					vtr.setPhone(rs.getInt(1));
					
					list.add(vtr);
					
				}
				
				
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				return list;
			}
		
		
		
		// add Voters
public int addVoters(Voters vtr) {
			
			int i = 0;
			try{
				String sql = "insert into voters (name,password,email,phone) values(?,?,?,?)" ;
				PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ps.setString(1, vtr.getName());
			ps.setString(2, vtr.getPassword());
			ps.setString(3, vtr.getEmail());
			ps.setInt(4, vtr.getPhone());
			
			i = ps.executeUpdate();
			if(i > 0)
				i = 1;
			
			
			}catch(Exception ex){
			   System.out.println(ex.getMessage());
			}

		return i;
			
			
			
		}
		
		
		//delete Voters 
		

				public void deleteVoters(int id) {
					
					
					try{
						String sql = "delete from voters where id = ?";
						PreparedStatement ps = conn.prepareStatement(sql);
					
					ps.setInt(1, id);
					
				ps.executeUpdate();
					
					
					}catch(Exception ex){
					   System.out.println(ex.getMessage());
					}

					
					
				}
			
			
				
				//update Voters
				
				public int updateVoters(int id,Voters vtr) {
							
							int l = 0;
							try{
								String sql = "update voters set name = ? , password=? , email = ?, phone = ? where id = "+ id+"";
								PreparedStatement ps = conn.prepareStatement(sql);
							
								ps.setString(1, vtr.getName());
								ps.setString(2, vtr.getPassword());
								ps.setString(3, vtr.getEmail());
								ps.setInt(4, vtr.getPhone());
								
							
							
							l = ps.executeUpdate();
							if(l > 0)
								l = 1;
							
							
							}catch(Exception ex){
							   System.out.println(ex.getMessage());
							}

						return l;
							
							
							
						}
				
				
				// check Voters login
				
				public boolean checkVoters(Voters vtr)
				{
					boolean f = false;
				
				
					try{
						String sql = "select * from Voters  where email=? and password=?";
						PreparedStatement ps = conn.prepareStatement(sql);
					
					
					ps.setString(1, vtr.getEmail());
					ps.setString(2, vtr.getPassword());
					
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
				
				
				
				// check Voters login before new voter registration
				
				public boolean checkVoters2(Voters vtr)
				{
					boolean f = false;
				
				
					try{
						String sql = "select * from Voters  where email=?";
						PreparedStatement ps = conn.prepareStatement(sql);
					
					
					ps.setString(1, vtr.getEmail());
					
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
