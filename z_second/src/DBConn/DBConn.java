package DBConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConn {
	public static Connection getConnection() {
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		String id = "system";
		String pw = "1234";
		Connection con 
		= null;
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("정상 접속 되었습니다");
		}catch(ClassNotFoundException e) {
			System.out.println("클래스 드라이브 접속 실패");
		}catch (SQLException e) {
			System.out.println("데이터베이스 접속 실패");
		}
		
		return con;
	}
	
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try{
			if(rs != null) rs.close();
		} catch (Exception e){
			System.out.println("result set close 실패");
		}
		
		try{
			if(pstmt != null) pstmt.close();
		} catch (Exception e){
			System.out.println("pstmt close 실패");
		}
		
		try{
			if(con != null) con.close();
		} catch (Exception e){
			System.out.println("con close 실패");
		}
	}
	
//	public static void main(String[] args) {
//		Connection con = DBConn.getConnection();
//	}
}
