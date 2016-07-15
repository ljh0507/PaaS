package test.db;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class DBconnection {
		public static Connection getCon() throws SQLException{
						
			try{
				String url    = "jdbc:mysql://us-cdbr-iron-east-04.cleardb.net/ad_1e669fbb4858ab0";
				String user   = "b0cf60a7448cfb";
				String passwd = "2d449dfb";
				  
			   Class.forName("com.mysql.jdbc.Driver");
			   Connection conn = (Connection) DriverManager.getConnection(url, user, passwd);
			   return conn;
			   //Statement stmt = conn.createStatement();
				
			}catch(ClassNotFoundException ce){
				System.out.println(ce.getMessage());
				return null;
			}
		}

}
