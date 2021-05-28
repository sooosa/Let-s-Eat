<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="resources/js/jquery-3.6.0.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/CS_css.css">
<title>1:1 문의</title>

</head>
<body>

	<div class="CS_leftHome">
		<button class="CS_homeButton" onclick="location.href='cs_Index'"
			style='cursor: pointer'>고객센터 페이지로</button>
	</div>
	
	<div class="inquiry">
		<button onclick="location.href='cs_inquiry'">1:1문의</button>
	</div>
	
	<div class="CS_loginStatus">
			<c:if test="${sessionScope.mloginId != null || sessionScope.cloginId != null}">
			${sessionScope.mloginId}${sessionScope.cloginId}님 접속 중
			<button onclick="location.href='logout'">로그아웃</button>
		</c:if>
	</div>
	
	
	<c:if test="${sessionScope.mloginId != null || sessionScope.cloginId != null}">
	<div class="CS_MainBody">
		<div class="CS_MainLeftBody">
			<div>
				<h3>1:1문의</h3>
			</div>

		</div>
		
		<div class="CS_MainRightBody">
			<form action="cs_inquiryReg" method="POST">
			<table>
				<tr>
					<th>회원구분</th>
					<td><select name="mc">
							<optgroup label="회원구분">
								<option value="1">회원</option>
								<option value="0">점주</option>
							</optgroup>
						</select>
					</td>
					
					<th>카테고리</th>
					<td><select name="mQnACat">
							<optgroup label="카테고리">
								<option value="예약관련">예약관련</option>
								<option value="사이트 이용">사이트 이용</option>
								<option value="결제">결제</option>
								<option value="기타">기타</option>
							</optgroup>
						</select>
					</td>
				</tr>
					
				<tr>
					<input type="hidden" name="mQnAmId" value="${sessionScope.mloginId}">
					<input type="hidden" name="mQnAcId" value="${sessionScope.cloginId}">
					<th>아이디</th>
					<td>${sessionScope.mloginId}${sessionScope.cloginId}</td>
				</tr>
				
				<br>
				
				<tr>
					<th style="width: 10%;">제목</th>
					<td colspan="3"><input type="text" name="mQnATitle"
						style="width: 90%;"></td>
				</tr>
				
				

				<tr>
					<th style="width: 10%;">내용</th>
					<td colspan="3"><textarea style="width: 90%; height: 300px;"
							name="mQnAContents"></textarea></td>
				</tr>
				
				<br>
				
				<tr>
					<td colspan="2"><input type="submit" value="등록"></td>
				</tr>
			</table>	
			</form>
			
		</div>
	</div>
	</c:if>
	
	<c:if test="${sessionScope.mloginId == null && sessionScope.cloginId == null}">
		<h1 style="text-align : center;"><br><br><br><br><br><br>1:1문의 작성은 먼저 로그인을 하시고 이용해 주세요! </h1>
	</c:if>
	
</body>
</html>

