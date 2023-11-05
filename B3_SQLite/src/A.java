import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;



public class A {
	
	
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException 
	{
		
		Class.forName("org.sqlite.JDBC");
		
		Connection connection = DriverManager.getConnection("jdbc:sqlite:MyDB.db");
		
		return connection;
	}
	
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		insert();
	}
	
public static void insert() throws ClassNotFoundException, SQLException {
		
		Connection connection= getConnection();
		
		String sql = "insert into users(Name,Birthday,Email_Id) values('Swapnil2','24 Oct 1996','swapnilbamble4@gmail.com')";
	
		PreparedStatement ps = connection.prepareStatement(sql);
		
		int i = ps.executeUpdate();
		System.out.println(i + " row inserted....");
	
	}


	
}
