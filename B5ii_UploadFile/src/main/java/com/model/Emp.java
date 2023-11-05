package com.model;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.utility.MyConnection;
import com.utility.MyUtilities;
public class Emp {
	
	public boolean AddEmployee(HttpServletRequest request,String path)
	{
		
		path = "C:/Users/Swapnil/eclipse-workspace/B5ii_UploadFile/src/main/webapp/";
		boolean rvalue=false;
		
		try {
		int eid=0;
		String ename="";
		String rfilename="";
				
		
			
			Connection con=MyConnection.DatabaseConnection();
			PreparedStatement ps=con.prepareStatement("Insert into employee values(?,?,?)");
			
			List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
		
			for(FileItem item1 : multiparts){
				if(item1.isFormField())
				{
					if(item1.getFieldName().equals("eid"))
						eid=Integer.parseInt(item1.getString());
					if(item1.getFieldName().equals("ename"))
						ename=item1.getString();
				}
				else
				{
					MyUtilities m1=new MyUtilities();
					String destinationpath=path + "ProfilePic/";
					ArrayList <String> ext=new ArrayList();
					ext.add(".jpg");ext.add(".bmp");ext.add(".jpeg");ext.add(".png");
					rfilename=m1.UploadFile(item1, destinationpath, ext);

				}
			}
			
		
			if(rfilename.equals("Problem with upload")==false)
			{
			ps.setInt(1, eid);
			ps.setString(2, ename);
			ps.setString(3, rfilename);
			ps.executeUpdate();
			rvalue=true;
			}
			con.close();
			
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		return rvalue;
	}
}
