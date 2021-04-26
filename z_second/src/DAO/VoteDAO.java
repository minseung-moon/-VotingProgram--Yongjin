package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import DBConn.DBConn;
import DTO.VoteDTO;
import DTO.VoteInDTO;

public class VoteDAO {
	private DBConn dbConn = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public VoteDAO() {
		dbConn = new DBConn();
		con = DBConn.getConnection();
	}
	
	public ArrayList<VoteDTO> selectVote() {
		ArrayList<VoteDTO> selectVotes = new ArrayList<VoteDTO>();
		String year, month, day;
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String time[] = format.format(date).split("-");
		int age;
		try{
			sql = "select v_name, v_jumin, m_no, v_time, v_confirm from TBL_VOTE_202005";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				VoteDTO dto = new VoteDTO();
				dto.setV_name(rs.getString(1));
				String jumin = rs.getString(2);
				year = "19"+jumin.substring(0, 2);
				month = jumin.substring(2, 4);
				day = jumin.substring(4, 6);
				String birth = year+"년"+month+"월"+day+"일생";
				dto.setV_jumin(birth);
				
				age = Integer.parseInt(time[0]) - Integer.parseInt(year) - 1;
				if(Integer.parseInt(month) > Integer.parseInt(time[1])) age--;
				else if(Integer.parseInt(day) > Integer.parseInt(time[2])) age--;
				
				dto.setV_age(Integer.toString(age));
				
				dto.setV_gender(rs.getString(2).substring(6,7).equals("1")?"남":"여");
				dto.setM_no(rs.getString(3));
				dto.setV_time(rs.getString(4).substring(0,2)+":"+rs.getString(4).substring(2));
				dto.setV_confirm(rs.getString(5).equals("Y")?"확인":"미확인");
				
				selectVotes.add(dto);
			}
		}catch(SQLException e){
			System.out.println("vote error");
		}finally{
			dbConn.close(con, pstmt, rs);
		}
		
		return selectVotes;
	}
	
	public boolean inputVote(VoteInDTO dto){
		boolean check = false;
		
		try{
			sql = "insert into TBL_VOTE_202005 values(?, ?, ?, ?, ?, ?)";
			// insert into TBL_VOTE_202005 values(99010110001, '김유권', 1, 0930, '제1투표장', 'N');
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getV_jumin());
			pstmt.setString(2, dto.getV_name());
			pstmt.setString(3, dto.getM_no());
			pstmt.setString(4, dto.getV_time());
			pstmt.setString(5, dto.getV_area());
			pstmt.setString(6, dto.getV_confirm());
			
			check = pstmt.executeUpdate() == 1 ? true : false;
		}catch(SQLException e){
			System.out.println("vote에 insert 못함");
		}finally{
			dbConn.close(con, pstmt, rs);
		}
		return check;
	}
	
//	public static void main(String[] args) {
//		DateFormat format = new SimpleDateFormat("yyyy-MM");
//		Date date = new Date();
//		String time[] = format.format(date).split("-");
//		int age = Integer.parseInt("02") < Integer.parseInt(time[1]) ? Integer.parseInt(time[0]) - Integer.parseInt("1997") : Integer.parseInt(time[0]) - Integer.parseInt("1997") -1;
//		System.out.println(age);
//		VoteDAO dao = new VoteDAO();
//		dao.selectVote();
//	}
}
