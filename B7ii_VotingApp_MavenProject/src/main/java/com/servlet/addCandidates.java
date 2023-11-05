package com.servlet;

import java.io.IOException;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.DBConnect;
import com.dao.AdminDAO;
import com.dao.CandidatesDAO;
import com.dao.VotersDAO;
import com.entity.Admin;
import com.entity.Candidates;
import com.entity.Voters;





@MultipartConfig
@WebServlet("/addCandidates")
public class addCandidates extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public addCandidates() {
       
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		String candidate = new String(request.getParameter("Candidates"));
		candidate = candidate.trim();
		
		String voter = new String(request.getParameter("voter"));
		System.out.println(voter);
		
		String candidate1 = null;
		String candidate2 = null;
		String candidate3 = null;
		String candidate4 = null;
		

		if(candidate.equals("candidate1"))
			 candidate1 = voter;
		else if(candidate.equals("candidate2"))
		   candidate2 = voter;
		else if(candidate.equals("candidate3"))
			candidate3 = voter;
		else if(candidate.equals("candidate4"))
			candidate4 = voter;
		
		
		
		Candidates cnd = new Candidates();
		cnd.setCandidate1(candidate1);
		cnd.setCandidate2(candidate2);
		cnd.setCandidate3(candidate3);
		cnd.setCandidate4(candidate4);
		
	
		
		try{
			CandidatesDAO dao = new CandidatesDAO(DBConnect.getConn());
			
			
		 	if(dao.checkCandidates2(voter) == true)
			{
		 		Cookie cndnotadded = new Cookie("cndnotadded","cndnotadded");
				cndnotadded.setMaxAge(10);
				response.addCookie(cndnotadded);
				response.sendRedirect("voterhome.jsp");
				
				
			}
			else
			{
		
			    if(dao.addCandidates(cnd) > 0)
			    {
			    	Cookie cndadded = new Cookie("cndadded","cndadded");
					cndadded.setMaxAge(10);
					response.addCookie(cndadded);
			    	response.sendRedirect("voterhome.jsp");
			    }
			    else {
			    	Cookie cndnotadded = new Cookie("cndnotadded","cndnotadded");
					cndnotadded.setMaxAge(10);
					response.addCookie(cndnotadded);
			    	response.sendRedirect("voterhome.jsp");
			    }
			
			}
			
		}catch (Exception ex){
			System.out.println(ex);
		}

	
			
	
				
			
			
		
		
	}

}
