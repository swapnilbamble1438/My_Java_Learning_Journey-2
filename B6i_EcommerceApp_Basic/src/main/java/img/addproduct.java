package img;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import jakarta.servlet.http.Part;
import java.sql.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;



import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@MultipartConfig
@WebServlet("/addproduct")
public class addproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


        String bid = request.getParameter("bid");
         int bbid = 0;                 
         if(bid.equals("samsung")) bbid = 1;
         else if(bid.equals("sony")) bbid =2; 
         else if(bid.equals("lenovo")) bbid =3; 
         else if(bid.equals("acer")) bbid =4; 
         else if(bid.equals("onida")) bbid =5; 
         
         String cid = request.getParameter("cid");
         int ccid= 0;
         if (cid.equals("laptop")) ccid =1; 
         else if(cid.equals("tv")) ccid =2; 
         else if(cid.equals("mobile")) ccid =3; 
         else if(cid.equals("watch")) ccid =4; 
         
         

 		Part file = request.getPart("pimage");

 		String iname = file.getSubmittedFileName(); // get selected image file name

 		String uploadPath = "C:/Users/Swapnil/eclipse-workspace/B6i_EcommerceApp_Basic/src/main/webapp/images/"
 				+ iname; // upload path where we have to upload our actual image.

 		// Uploading our selected image into images folder.

 		try {

 			FileOutputStream fos = new FileOutputStream(uploadPath);
 			InputStream is = file.getInputStream();

 			byte[] data = new byte[is.available()];
 			is.read(data);
 			fos.write(data);
 			fos.close();

 		} catch (Exception e) {
 			e.printStackTrace();
 		}
         
         
       try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imagetable","root","root");
          PreparedStatement ps=con.prepareStatement("insert into product(pname,pprice,pquantity,pimage,bid,cid) values(?,?,?,?,?,?)");
       
      	   ps.setString(1, request.getParameter("pname"));
      		ps.setInt(2, Integer.parseInt(request.getParameter("pprice")));
   		ps.setInt(3, Integer.parseInt(request.getParameter("pqty")));
   		ps.setString(4,iname);
   		ps.setInt(5,bbid );
   		ps.setInt(6, ccid);
 
  		int row = ps.executeUpdate(); // it returns no of rows affected.

		if (row > 0) {
			System.out.println("Image added into database successfully.");
		} else {
			System.out.println("Failed to upload Image.");
		}

	} catch (Exception e) {
		System.out.println(e);
	}
        
	}
	

}
