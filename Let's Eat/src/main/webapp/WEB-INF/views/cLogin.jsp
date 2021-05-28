<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점주 로그인</title>
</head>
<body>
	<form action="clogin" method="POST">
		<fieldset>
			아이디 : <input type="text" name="cId" id="cId"><br>
			비밀번호 : <input type="password" name="cPw" id="cPw">
				<input type="submit" value="로그인">
				<c:choose>
                 	<c:when test="${cChkey == 'NG'}">
                 		<div>아이디와 비밀번호가 일치하지 않습니다.</div>
                 	</c:when>
                 	<c:when test="${cChkey == 'NO'}">
                 		<div>탈퇴한 아이디 입니다</div>
                 	</c:when>
                 	<c:when test="${cChkey == 'none'}">
                 		<div>아이디가 없습니다 회원가입 후 이용해 주세요</div>
                 	</c:when>
                 </c:choose>
		</fieldset>
	</form>
	
		<input type="button" value="아이디찾기" onclick="location.href='findcId'">
		<input type="button" value="비밀번호찾기" onclick="location.href='findcPw'">
	
	<br><hr><br>
	
</body>


</html>

