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

@WebServlet("/A3_showimg")
public class A3_showimg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("imageId");
		
		
		// getting database connection (jdbc code)
		Connection connection = null;

		String imageId = null;
		String imageFileName = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/imagetutorial", "root", "root");
			String query = "select * from addimg";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				if (rs.getString("imgId").equals(id))
					{
					imageId = rs.getString("imgId");
					imageFileName = rs.getString("img");
				}

			}
			
		} catch (Exception e) {
			System.out.println(e);
		}

		System.out.println("imageId: " + imageId + " imageFileName: " + imageFileName);
		
		RequestDispatcher rd;
		request.setAttribute("idd", String.valueOf(imageId)); // valueOf
		request.setAttribute("imgg", imageFileName);
		rd = request.getRequestDispatcher("A3_showimg.jsp");
		rd.forward(request, response);
	}

}
