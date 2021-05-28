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
<title>고객센터</title>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>

</head>
<body>

	<div class="CS_leftHome">
		<button class="CS_homeButton" onclick="location.href='index'"
			style='cursor: pointer'>홈 로고(메인페이지로)</button>
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


	<div class="CS_MainBody">
		<div class="CS_MainLeftBody">
			<div>
				<h3>자주 묻는 질문</h3>
			</div>

		</div>
		
		<div class="CS_MainRightBody">
			<form action="cs_selCat">
			<th>카테고리 검색</th>
			<td><select name="FAQCat">
					<optgroup label="카테고리">
						<option value="예약" ${FAQCat == '예약' ? 'selected="selected"' : '' }>예약</option>
						<option value="사이트 이용" ${FAQCat == '사이트 이용' ? 'selected="selected"' : '' }>사이트 이용</option>
						<option value="결제" ${FAQCat == '결제' ? 'selected="selected"' : '' }>결제</option>
						<option value="기타" ${FAQCat == '기타' ? 'selected="selected"' : '' }>기타</option>
					</optgroup>
				</select>
				
				<input type="submit" value="검색">
			</td>
			</form>
			
			
			<table class="CS_FAQView">
				<tr>
					<th width="15%">카테고리</th>
					<th width="85%">제목</th>
				<tr>
				
					<c:forEach var="cl" items="${CSList}">
						<tr>
							<td>${cl.FAQCat}</td>
							<td><a href="javascript:viewContents('${cl.FAQCode}');">
									${cl.FAQTitle}</a></td>
						</tr>
						
						<tr>
							<td colspan="2" id="contents${cl.FAQCode}"
								style="display: none; text-align: left;">
								${fn:replace(cl.FAQContents, cn, br)}</td>
						</tr>
					</c:forEach>
					
			</table>
			
		</div>
	</div>
	
</body>


<script>
	// 자주묻는 질문 내용 보이거나 안보이게 하는 함수
	function viewContents(val) {
		if (document.all("contents" + val).style.display == "none") {
			$('#contents' + val).fadeIn('fast');
			//document.all("list"+val).style.display='';
			//document.all("listBtn"+val).src='/images/sub/btn_fold_on.gif';
		} else {
			$('#contents' + val).fadeOut('fast');
			//document.all("list"+val).style.display='none';
			//document.all("listBtn"+val).src='/images/sub/btn_fold_off.gif';
		}
	}
</script>

</html>

