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

@WebServlet("/viewpictures")
public class viewpictures extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("imageId");
		
		
		// getting database connection (jdbc code)
		Connection connection = null;

		String imgId = null;
		String imgFileName = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/imagetutorial", "root", "root");
			String query = "select * from pictures";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				if (rs.getString("imageId").equals(id))
					{
					imgId = rs.getString("imageId");
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
		rd = request.getRequestDispatcher("viewpictures.jsp");
		rd.forward(request, response);
	}

}
