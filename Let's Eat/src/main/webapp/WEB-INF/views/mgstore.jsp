<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 관리</title>

<style>
	table,tr,td{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 10px;
		text-align: center;
	}
	
</style>

</head>
<body>
	
	<br><br>&nbsp;&nbsp;&nbsp;
	<button onclick="location.href='upform'">업체등록</button>
	<button onclick="location.href='c_myQnAList?cQnAcId=${sessionScope.cloginId}'">문의현황</button>
	<button onclick="window.history.back();">뒤로가기</button>
	

	<table style=margin:auto; >
		<caption><h3>${sessionScope.cloginId} 님 업체 목록</h3></caption>
		
		<tr>
			
			
			<c:forEach var="clist" items="${mgstore}" varStatus="status">
			<td width="32%" height="400px">
				<div><a href="sView?storeCode=${clist.storeCode}"><img src="resources/fileUpload/${clist.sFileName1}" width="200px"></a></div>
				<div>${clist.sName} ${clist.storeCode}</div>
				<div>${clist.sFileName2}</div>
			
			</td>
			<c:if test="${status.count%3==0}">
							<tr></tr>
			</c:if>
			</c:forEach>
			
			
		</tr>
		
	
	</table>




</body>
</html>