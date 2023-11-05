package com.utility;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class MyUtilities {

	public String UploadFile(FileItem item,String destinationpath,ArrayList<String> ext)throws Exception
	{
		String newfilename="";
			if(!item.isFormField()) {
				//retrive extension from file name
				String fname=item.getName();
				String fileextension=fname.substring(fname.lastIndexOf('.'));
				if(ext.contains(fileextension) && (item.getSize()/(1024*1024))<=10)
				{
					//create new file name
					 //newfilename=((int)(Math.random()*1000))+fname;
					newfilename=fname;
					item.write(new File(destinationpath+newfilename));
					
				}
				
				
			}
		
		
		
		return newfilename;
	}
	
}
