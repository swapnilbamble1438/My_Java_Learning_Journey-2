package com.codeFactory;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	
	private final String UPLOAD_DIRECTORY = "C:/Users/Swapnil/eclipse-workspace/B5iii_UploadMultipleImages/src/main/webapp/Images";
	
	private static final long serialVersionUID = 1L;
       
    
    public UploadServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		if(ServletFileUpload.isMultipartContent(request))
		{
			try
			{
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				for(FileItem item : multiparts)
				{
					if(!item.isFormField())
					{
						String name = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
					}
				}
				request.setAttribute("message", "File uploaded successfully.");
				
			
			}catch(Exception ex)
			{
				request.setAttribute("message", "File upload failed due to : " + ex);
			}
			
		}
		else
		{
			request.setAttribute("message","Sorry this servlet only handles file upload request.");
		}
		request.getRequestDispatcher("/result.jsp").forward(request,response);
	}

}
