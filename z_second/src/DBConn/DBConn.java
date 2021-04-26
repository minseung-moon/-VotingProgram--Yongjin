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
			System.out.println("���� ���� �Ǿ����ϴ�");
		}catch(ClassNotFoundException e) {
			System.out.println("Ŭ���� ����̺� ���� ����");
		}catch (SQLException e) {
			System.out.println("�����ͺ��̽� ���� ����");
		}
		
		return con;
	}
	
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try{
			if(rs != null) rs.close();
		} catch (Exception e){
			System.out.println("result set close ����");
		}
		
		try{
			if(pstmt != null) pstmt.close();
		} catch (Exception e){
			System.out.println("pstmt close ����");
		}
		
		try{
			if(con != null) con.close();
		} catch (Exception e){
			System.out.println("con close ����");
		}
	}
	
//	public static void main(String[] args) {
//		Connection con = DBConn.getConnection();
//	}
}
