<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 목록</title>
</head>
<body>
	<table>
		<tr>
			<td>1</td>
			<td>2</td>
			<td>3</td>
		</tr>
	</table>

	<table style=margin:auto; >
		<caption>업체 목록</caption>
		
	
			
			<tr>
			<c:forEach var="slist" items="${slist}" varStatus="status">
			
			<td width="32%" height="400px">
				<a href="storeView?storeCode=${slist.storeCode}&mCode=${sessionScope.mloginId}">
					<img src="resources/fileUpload/${slist.sFileName1}" width="200px"></a>
				<br>
				${slist.sName} 
			</td>
			
			
				<c:if test="${status.count%3==0}">
						<tr></tr>
				</c:if>
		 	
			</c:forEach>
			
			</tr>
	
	</table>


</body>
</html>


