package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBConn.DBConn;
import DTO.MemberDTO;

public class MemberDAO {
	private DBConn dbConn = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public MemberDAO() {
		dbConn = new DBConn();
		con = DBConn.getConnection();
	}
	
	public ArrayList<MemberDTO> selectMember() {
		ArrayList<MemberDTO> selectMembers = new ArrayList<MemberDTO>();
		
		try {
			sql = "select m.m_no, m.m_name, p.p_name, m.p_school, m.m_jumin, m.m_city, p.p_tel1, p.p_tel2, p.p_tel3 from TBL_MEMBER_202005 m inner join TBL_PARTY_202005 p on m.p_code = p.p_code";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setM_no(rs.getString(1));
				dto.setM_name(rs.getString(2));
				dto.setP_name(rs.getString(3));
				// 1 고졸, 2 학사, 3 석사
				String school = rs.getString(4).equals("1")?"고졸":rs.getString(4).equals("2")?"학사":"석사";
				dto.setP_school(school);
				String jumin = rs.getString(5).substring(0, 6) + "-" + rs.getString(5).substring(6);
				dto.setM_jumin(jumin);
				dto.setM_city(rs.getString(6));
				dto.setP_tel(rs.getString(7)+"-"+rs.getString(8)+"-"+rs.getString(9));
				selectMembers.add(dto);
			}
		}catch(SQLException e){
			System.out.println("member의 정보를 갖고 오지 못했습니다");
		}finally{
			dbConn.close(con, pstmt, rs);
		}
		
		return selectMembers;
	}
	
	
//	public static void main(String[] args) {
//		MemberDAO dao = new MemberDAO();
//		ArrayList<MemberDTO> list = dao.selectMember();
//		MemberDTO dto = list.get(0);
//		System.out.println(dto.getM_jumin());
//	}
}
