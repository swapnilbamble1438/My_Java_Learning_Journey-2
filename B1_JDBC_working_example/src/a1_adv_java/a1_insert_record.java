
package a1_adv_java;
import java.sql.*;

public class a1_insert_record {

	public static void main(String[] args)throws Exception
	{
		System.out.println("WELCOME TO JDBC");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/fullstackjava","root","root");
		String s="Insert into student2 values (6,'Rakesh',4)";
		Statement st=con.createStatement();
		st.execute(s);
		con.close();
}
}

