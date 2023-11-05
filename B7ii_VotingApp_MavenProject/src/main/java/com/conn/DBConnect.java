package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect 
{

	private static Connection conn = null;
	
	private DBConnect()
	{
		
	}
	
	public static Connection getConn()
	{
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yash","root","root");

		//	 Class.forName("org.sqlite.JDBC");
		//	conn = DriverManager.getConnection("jdbc:sqlite:sqlite.db");
		//	conn = DriverManager.getConnection("jdbc:sqlite:C:/Users/Swapnil/eclipse-workspace/Z_App/sqlite.db");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return conn;
	}
	
	
}
