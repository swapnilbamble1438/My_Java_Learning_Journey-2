
package a1_adv_java;
import java.sql.*;

public class a2_delete_record {

	public static void main(String[] args)throws Exception
	{
		System.out.println("WELCOME TO JDBC");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/fullstackjava","root","root");
		String s="delete from student2 where studentid = 6";
		Statement st=con.createStatement();
		st.execute(s);
		con.close();
}
}
