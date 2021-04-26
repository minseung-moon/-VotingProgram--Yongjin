package DTO;

public class MemberDTO {
	private String m_no;
	private String m_name;
	// P1 A정당, P2 B정당, P3 C정당, P4 D정당, P5 E정당 from TBL_PARTY_202005
	private String p_name;
	// 1 고졸, 2 학사, 3 석사
	private String p_school;
	private String m_jumin;
	private String m_city;
	// p_tel1 + p_tel2 + p_tel3 from TBL_PARTY_202005
	private String p_tel;
	
	public MemberDTO() {
		super();
	}

	public String getM_no() {
		return m_no;
	}

	public void setM_no(String m_no) {
		this.m_no = m_no;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_school() {
		return p_school;
	}

	public void setP_school(String p_school) {
		this.p_school = p_school;
	}

	public String getM_jumin() {
		return m_jumin;
	}

	public void setM_jumin(String m_jumin) {
		this.m_jumin = m_jumin;
	}

	public String getM_city() {
		return m_city;
	}

	public void setM_city(String m_city) {
		this.m_city = m_city;
	}

	public String getP_tel() {
		return p_tel;
	}

	public void setP_tel(String p_tel) {
		this.p_tel = p_tel;
	}
	
}
