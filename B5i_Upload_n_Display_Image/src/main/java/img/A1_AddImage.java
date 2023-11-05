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

@MultipartConfig
@WebServlet("/A1_AddImage")
public class A1_AddImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("In do post method of Add Image Servlet.");

		Part file = request.getPart("image");

		String imageFileName = file.getSubmittedFileName(); // get selected image file name
		System.out.println("Selected Image File Name: " + imageFileName);

		String uploadPath = "C:/Users/Swapnil/eclipse-workspace/B5i_Upload_n_Display_Image/src/main/webapp/images/"
				+ imageFileName; // upload path where we have to upload our actual image.
		System.out.println("Upload Path: " + uploadPath);

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
		// *******************************

		// getting database connection (jdbc code)
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/imagetutorial", "root", "root");
			String query = "insert into image(imageFileName) values(?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, imageFileName);
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
