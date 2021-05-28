<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 목록</title>
<style>
	table, tr, th, td {
		border : 1px solid black;
		border-collapse: collapse;
		padding : 10px;
	}
</style>

</head>
<body>

	<br><br>&nbsp;&nbsp;&nbsp;
	<button onclick="location.href='index'">메인페이지 이동</button>

	<table style=margin:auto; >
		<caption>찜 목록</caption>
		
		<tr>
			
			<c:forEach var="savelist" items="${savelist}" varStatus="status">
			
			<td width="32%" height="400px">
				<div><a href="storeView?storeCode=${savelist.ssCode}&mCode=${sessionScope.mloginId}">
						<img src="resources/fileUpload/${savelist.sFileName1}" width="200px"></a></div>
				<div>${savelist.sName}</div>
				<div>${savelist.sFileName1}</div>
			
			</td>
			
				<c:if test="${status.count%3==0}">
						<tr></tr>
				</c:if>
			</c:forEach>
			
		</tr>
		
	</table>


</body>
</html>

