<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과정평가형 자격 CBQ</title>
<script type="text/javascript" src="./js/inputMember.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<section id="main">
		<div class="container">
			<h2>투표하기</h2>
			<form action="inputViteProc.jsp" method="post">
				<table>
					<tr>
						<td><label for="v_jumin">주민번호</label></td>
						<td><input type="text" name="v_jumin" id="v_jumin" maxlength="13"> <span>예 : 8906153154726</span></td>
					</tr>
					<tr>
						<td><label for="v_name">성명</label></td>
						<td><input type="text" name="v_name" id="v_name" maxlength="10"></td>
					</tr>
					<tr>
						<td><label for="v_num">투표번호</label></td>
						<td><select name="m_no" id="v_num">
							<option>후보선택</option>
							<option value="1">[1] 김후보</option>
							<option value="2">[2] 이후보</option>
							<option value="3">[3] 박후보</option>
							<option value="4">[4] 조후보</option>
							<option value="5">[5] 최후보</option>
						</select></td>
					</tr>
					<tr>
						<td><label for="v_time">투표시간</label></td>
						<td><input type="text" name="v_time" id="v_time" maxlength="4"></td>
					</tr>
					<tr>
						<td><label for="v_area">투표장소</label></td>
						<td><input type="text" name="v_area" id="v_area" maxlength="10"></td>
					</tr>
					<tr>
						<td>유권자확인</td>
						<td>
							<input type="radio" name="v_confirm" class="v_confirm" id="v_confirm1" value="Y"><label for="v_cinfirm1">확인</label>
							<input type="radio" name="v_confirm" class="v_confirm" id="v_confirm2" value="N"><label for="v_cinfirm2">미확인</label>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="투표하기" onclick="return validate()">
							<input type="reset" value="다시하기">
						</td>
					</tr>
				
				</table>
			</form>
		</div>
	</section>

	<jsp:include page="footer.jsp" />
</body>
</html>