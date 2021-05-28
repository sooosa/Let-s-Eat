<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과 목록</title>
<style>
	table, tr, td {
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px;
	}
</style>
</head>
<body>
	<br><br>&nbsp;&nbsp;&nbsp;
	<button onclick="location.href='index'">메인페이지 이동</button>

	<table style=margin:auto; >
		<caption><h3>검색 결과 목록<br></h3></caption>
		
	
			
			<tr>
			<c:forEach var="search" items="${search}" varStatus="status">
			
			<td width="32%" height="400px">
				<a href="storeView?storeCode=${search.storeCode}&mCode=${sessionScope.mloginId}">
					<img src="resources/fileUpload/${search.sFileName1}" width="200px"></a>
				<br>
				${search.sName} 
			</td>
			
			
				<c:if test="${status.count%3==0}">
						<tr></tr>
				</c:if>
		 	
			</c:forEach>
			
			</tr>
	
	</table>


</body>
</html>


