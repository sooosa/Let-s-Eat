<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점주 아이디 찾기</title>
</head>
<body>

	<div id="div3">
	    <h3>이름 : <input type="text" name="cName" id="cName" placeholder="이름"></h3>
	    <h3>전화번호 : <input type="text" name="cPhone" id="cPhone" placeholder="휴대폰 번호 (- 빼고 입력)"></h3>
	    <input type="button" value="확인" onclick="searchcId()"><br>
	</div>
	
	<br><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="findcPw">비밀번호 찾기</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=" cloginForm">로그인 하기</a>
	
</body>

<!-- jquery를 사용하기 위해 작성 -->
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>

<script>
	// 점주 아이디 찾기
	function searchcId(){
		console.log("테스트");
		var cName = document.getElementById("cName").value;
		var cPhone = document.getElementById("cPhone").value;
		var div3 =document.getElementById("div3");
		
		console.log("cName:"+cName);
		console.log("cPhone:"+cPhone);
		
		$.ajax({
			type : "GET",
			url :"cfindid",
			data :{"cName":cName,"cPhone":cPhone},
			dataType :"text",
			
			success : function(data){
				
				var output5 = "<h3>data:"+data+" </h3>";
					output5 += "아이디 : " + data;
				
					div3.innerHTML = output5;
					
			},//end sucess
			
			error : function(){
				alert('sendcEmail()함수통신 실패');
			}
			
		})//end $.ajax
		
	}//end searchcId()


	

</script>
</html>