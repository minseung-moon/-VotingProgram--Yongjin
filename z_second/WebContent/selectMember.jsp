<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DTO.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.MemberDAO"%>
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
			<h2>후보조회</h2>
			<table>
				<thead>
					<tr>
						<th>후보번호</th>
						<th>성명</th>
						<th>소속정당</th>
						<th>학력</th>
						<th>주민번호</th>
						<th>지역구</th>
						<th>대표전화</th>
					</tr>
				</thead>
				<tbody>
					<%
						MemberDAO dao = new MemberDAO();
						ArrayList<MemberDTO> dtos = dao.selectMember();
						for(MemberDTO dto : dtos) {
					%>
					<tr>
						<td><%=dto.getM_no() %></td>
						<td><%=dto.getM_name() %></td>
						<td><%=dto.getP_name() %></td>
						<td><%=dto.getP_school() %></td>
						<td><%=dto.getM_jumin() %></td>
						<td><%=dto.getM_city() %></td>
						<td><%=dto.getP_tel() %></td>
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