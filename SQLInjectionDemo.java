import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Formatter;
import java.util.Scanner;

public class SQLInjectionDemo {
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Welecome to CIS 452!\n");
		try {
			System.out.print("Please enter your username:");
			String username = sc.nextLine();
			System.out.print("Please enter your password:");
			String password = sc.nextLine();
			String password_hash = encryptPassword(password);
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection conn = DriverManager.getConnection(  
					"jdbc:mysql://localhost:3306/SQL_Injection","root","toor@DB@");  
			
			
			
			
//			String sql = "select count(*) as exist from USERS where username = ? and password = ?";
//			//String sql = "INSERT INTO USERS values (3,?,?)";
//			PreparedStatement preStatement = conn.prepareStatement(sql);
//			preStatement.setString(1, username);
//			preStatement.setString(2, password_hash);
//			System.out.println(preStatement);

			//preStatement.execute();
			//ResultSet resultSet = preStatement.executeQuery();
			
			String sql = "select count(*) as exist from USERS where username = \""+username+"\" and password=\""+password_hash+"\"";
			Statement statement = conn.createStatement();
			//System.out.println(statement);
			ResultSet resultSet = statement.executeQuery(sql);
			//attack string " OR 1=1 #
			
			resultSet.next();
		
			
			int exist = resultSet.getInt("exist");
			
			
			if(exist>0) {
				System.out.print("\nYou successfully logged in to the system!");
			}else {
				System.out.print("\nInvalid username or password!");
			}
				
				
			sc.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	
	private static String encryptPassword(String password)
	{
	    String sha1 = "";
	    try
	    {
	        MessageDigest crypt = MessageDigest.getInstance("SHA-1");
	        crypt.reset();
	        crypt.update(password.getBytes("UTF-8"));
	        sha1 = byteToHex(crypt.digest());
	    }
	    catch(Exception e)
	    {
	        e.printStackTrace();
	    }
	    return sha1;
	}
	
	private static String byteToHex(final byte[] hash)
	{
	    Formatter formatter = new Formatter();
	    for (byte b : hash)
	    {
	        formatter.format("%02x", b);
	    }
	    String result = formatter.toString();
	    formatter.close();
	    return result;
	}

}