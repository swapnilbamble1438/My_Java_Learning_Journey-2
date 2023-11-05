package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.conn.DBConnect;
import com.entity.Candidates;
import com.entity.Voters;

public class CandidatesDAO {
	
	
private Connection conn;
	
	public CandidatesDAO(Connection conn) {
	//	conn =	DBConnect.getConn();
		this.conn = conn;
	}
	
	
	
	

	//view Candidates  (View votes of candidates)


	public List<Candidates> getCandidates(){
		List<Candidates> list = new ArrayList<Candidates>();
		
		Candidates cnd = null;
		
		try {
			String sql = "select * from candidates";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				cnd = new Candidates();
				cnd.setId(rs.getInt(1));
				cnd.setCandidate1(rs.getString(2));
				cnd.setCandidate2(rs.getString(3));
				cnd.setCandidate3(rs.getString(4));
				cnd.setCandidate4(rs.getString(5));
				list.add(cnd);
				
			}
			
			
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
	
	
	
	// add Candidates (do votes for candidates)
	
			public int  addCandidates(Candidates cnd) {
				
				
				
				
					int a =  0;
					try {
					
						
						String sql = "insert into candidates(candidate1,candidate2,candidate3,candidate4) values(?,?,?,?)";
						PreparedStatement ps= conn.prepareStatement(sql);
						

						
						ps.setString(1, cnd.getCandidate1());
						ps.setString(2, cnd.getCandidate2());
						ps.setString(3, cnd.getCandidate3());
						ps.setString(4, cnd.getCandidate4());
						
						
						a  = ps.executeUpdate();
						 
						if( a > 0)
							a =1;
						
					
						
					}catch (Exception e) {
						System.out.println(e);
					}
				return a;
					
				}
			
	
	

	//Delete Candidates (delete votes of candidates)

		public boolean deleteCandidates(int id)
		{
			boolean f = false;
			
			try {
				
				String sql = "delete from candidates where id = ?";
				
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setInt(1, id);			
				
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
		
		
		
		
		
	

		// show voters status
				
				public boolean checkCandidates2(String v)
				{
					boolean f = false;
					
					Candidates cnd;
				
					try{
						String sql = "select * from candidates where candidate1='"+v+"' or candidate2='"+v+"' or candidate3='"+v+"' or candidate4='"+v+"'";
						PreparedStatement ps = conn.prepareStatement(sql);
				
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
