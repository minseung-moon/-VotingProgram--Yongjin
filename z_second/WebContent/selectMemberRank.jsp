<%@page import="DTO.MemberRankDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.MemberRankDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과정평가형 자격 CBQ</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<section id="main">
		<div class="container">
			<h2>후보자등수</h2>
			<table>
				<thead>
					<tr>
						<th>후보번호</th>
						<th>성명</th>
						<th>총 투표 건수</th>
					</tr>
				</thead>
				<tbody>
				<%
					MemberRankDAO dao = new MemberRankDAO();
					ArrayList<MemberRankDTO> dtos = dao.selectMemberRank();
					for(MemberRankDTO dto : dtos){
				%>
					<tr>
						<td><%=dto.getM_no() %></td>
						<td><%=dto.getM_name() %></td>
						<td><%=dto.getV_total() %></td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
		</div>
	</section>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>