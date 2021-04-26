package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBConn.DBConn;
import DTO.MemberRankDTO;

public class MemberRankDAO {
	private DBConn dbConn = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public MemberRankDAO() {
		dbConn = new DBConn();
		con = DBConn.getConnection();
	}
	
	public ArrayList<MemberRankDTO> selectMemberRank() {
		ArrayList<MemberRankDTO> selectMemberRanks = new ArrayList<MemberRankDTO>();
		
		try{
			sql = "select m.m_no,m.m_name, count(*) from TBL_MEMBER_202005 m inner join TBL_VOTE_202005 v on m.m_no = v.m_no group by (m.m_name, m.m_no) order by count(*) desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberRankDTO dto = new MemberRankDTO();
				dto.setM_no(rs.getString(1));
				dto.setM_name(rs.getString(2));
				dto.setV_total(rs.getString(3));
				selectMemberRanks.add(dto);
			}
		}catch(SQLException e){
			System.out.println("memberrank를 못 갖고 왔습니다");
		}finally{
			dbConn.close(con, pstmt, rs);
		}
		return selectMemberRanks;
	}
	
//	public static void main(String[] args) {
//		MemberRankDAO dao = new MemberRankDAO();
//		dao.selectMemberRank();
//	}
}
