<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
<link rel="stylesheet" type="text/css" href="resources/css/SA_css.css">
<!-- jQuery -->
<script src="resources/js/jquery-3.6.0.js"></script>
</head>
<body>
	<table>
		<tr>
			<th class="SA_FAQViewTh">리뷰코드</th>
			<th class="SA_FAQViewTh">아이디</th>
			<th class="SA_FAQViewTh">업체명</th>
			<th class="SA_FAQViewTh">작성날짜</th>

		</tr>
		<tr>
			<td class="SA_FAQViewTdLong">${viewReview.rCode}</td>
			<td class="SA_FAQViewTdLong">${viewReview.rmId}</td>
			<td class="SA_FAQViewTdLong">${viewReview.sName}</td>
			<td class="SA_FAQViewTdLong">${fn:substring({viewReview.rDate},1,11)}</td>
		</tr>
		<tr>
			<th class="SA_FAQViewTh" colspan="4">내용</th>
		</tr>
		<tr>
			<td class="SA_FAQViewTdLong" colspan="4" style="height:400px; text-align:center;">${viewReview.rContents}</td>
		</tr>
		<tr>
			<td><button onclick="location.href = 'sa_reviewDel2?rCode=${viewReview.rCode}'">삭제</button>
				<button onclick="window.close()">닫기</button></td>
		</tr>
	</table>
</body>
</html>