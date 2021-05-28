<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	
<form action="mlogin" method="POST">
		<fieldset>
			아이디 : <input type="text" name="mId" id="mId"><br>
			비밀번호 : <input type="password" name="mPw" id="mPw">
				<input type="submit"value="로그인">
				
				<c:choose>
                 	<c:when test="${mChkey == 'NG'}">
                 		<div>아이디와 비밀번호가 일치하지 않습니다.</div>
                 	</c:when>
                 	<c:when test="${mChkey == 'NO'}">
                 		<div>탈퇴한 아이디 입니다</div>
                 	</c:when>
                 	<c:when test="${mChkey == 'none'}">
                 		<div>아이디가 없습니다 회원가입 후 이용해 주세요</div>
                 	</c:when>
                 </c:choose>
                 
		</fieldset>
</form>
		<input type="button" value="아이디찾기" onclick="location.href='findmId'">
		<input type="button" value="비밀번호찾기" onclick="location.href='findmPw'">
	
	
	<br><hr><br>
	<a href="naverlogin"><img width="223" src="resources/img/naver_login1.PNG"></a>
	
</body>


</html>

