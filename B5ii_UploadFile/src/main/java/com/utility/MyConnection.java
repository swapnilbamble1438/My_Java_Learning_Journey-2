package com.utility;
import java.sql.*;
public class MyConnection {
	public static Connection DatabaseConnection()throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root");
		return con;
	}
}
