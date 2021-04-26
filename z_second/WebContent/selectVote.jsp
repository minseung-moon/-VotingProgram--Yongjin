<%@page import="DTO.VoteDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.VoteDAO"%>
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
			<h2>투표검수조회</h2>
			<table>
				<thead>
					<tr>
						<th>성명</th>
						<th>생년월일</th>
						<th>나이</th>
						<th>성별</th>
						<th>후보번호</th>
						<th>투표시간</th>
						<th>유권자확인</th>
					</tr>
				</thead>
				<tbody>
				<%
					VoteDAO dao = new VoteDAO();
					ArrayList<VoteDTO> dtos = dao.selectVote();
					for(VoteDTO dto : dtos){
				%>
				<tr>
						<td><%=dto.getV_name() %></td>
						<td><%=dto.getV_jumin() %></td>
						<td>만 <%=dto.getV_age() %></td>
						<td><%=dto.getV_gender() %></td>
						<td><%=dto.getM_no() %></td>
						<td><%=dto.getV_time() %></td>
						<td><%=dto.getV_confirm() %></td>
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