import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class sql {
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
	//createTable();
		insertData();
		
	}
	public static void insertData() throws ClassNotFoundException, SQLException {
		
		Connection connection= getConnection();
		
		String qString = "insert into users(Name,Birthday,Email_Id) values('Swapnil','24 Oct 1996','swapnilbamble4@gmail.com')";
	
		Statement statement = connection.createStatement();
		
		boolean result = statement.execute(qString);
		System.out.println(result);
	
	}
	
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException 
	{
		
		Class.forName("org.sqlite.JDBC");
		
		Connection connection = DriverManager.getConnection("jdbc:sqlite:MyDB.db");
		
		return connection;
	}
	
	public static void createTable() throws ClassNotFoundException, SQLException {
		
		Connection connection = getConnection();
		
		System.out.println(connection);
		
		String query = "create table users (Name varchar(100), Birthday varchar(100), Email_Id varchar(100))";
		
		Statement statement = connection.createStatement();
		
		boolean result = statement.execute(query);
		
		System.out.println(result);
		
		connection.close();
	}
}
