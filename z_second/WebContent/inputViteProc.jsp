<%@page import="DAO.VoteDAO"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bean" class="DTO.VoteInDTO" />
<jsp:setProperty property="*" name="bean"/>
<%@page import="DTO.VoteInDTO"%>
<%
	VoteDAO dao = new VoteDAO();
	boolean check = dao.inputVote(bean);
	if(check) System.out.println("성공");
	else System.out.println("실패");
	response.sendRedirect("selectVote.jsp");
%>