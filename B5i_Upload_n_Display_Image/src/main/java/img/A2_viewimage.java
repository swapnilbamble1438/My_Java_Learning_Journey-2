package img;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import jakarta.servlet.http.Part;
import java.sql.*;

@WebServlet("/A2_viewimage")
public class A2_viewimage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String imageId = request.getParameter("imageId");
		int id = Integer.parseInt(imageId);
		
		// getting database connection (jdbc code)
		Connection connection = null;

		int imgId = 0;
		String imgFileName = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/imagetutorial", "root", "root");
			String query = "select * from putimage";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				if (rs.getInt("imageId") == id) {
					imgId = rs.getInt("imageId");
					imgFileName = rs.getString("imageFileName");
				}

			}
			
		} catch (Exception e) {
			System.out.println(e);
		}

		System.out.println("imgId: " + imgId + " imgFileName: " + imgFileName);
		
		RequestDispatcher rd;
		request.setAttribute("id", String.valueOf(imgId)); // valueOf
		request.setAttribute("img", imgFileName);
		rd = request.getRequestDispatcher("A2_viewimage.jsp");
		rd.forward(request, response);
	}

}
