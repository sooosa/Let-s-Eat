<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 아이디 찾기</title>
</head>
<body>
	
	<div id="div4">
	    <h3>이름 : <input type="text" name="mName" id="mName" placeholder="이름"></h3>
	    <h3>전화번호 : <input type="text" name="mPhone" id="mPhone" placeholder="휴대폰 번호 (- 빼고 입력)"></h3>
	    <input type="button" value="확인" onclick="searchmId()"><br>
	</div>
	
	<br><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="findmPw">비밀번호 찾기</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=" mloginForm">로그인 하기</a>
	
</body>

	<!-- jquery를 사용하기 위해 작성 -->
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>

<script>
	// 회원 아이디 찾기
	function searchmId(){
		console.log("테스트");
		var mName = document.getElementById("mName").value;
		var mPhone = document.getElementById("mPhone").value;
		var div4 =document.getElementById("div4");
		
		console.log("mName:"+mName);
		console.log("mPhone:"+mPhone);
		
		$.ajax({
			type : "GET",
			url :"mfindid",
			data :{"mName":mName,"mPhone":mPhone},
			dataType :"text",
			
			success : function(data){
				
				var output5 = "<h3>data:"+data+" </h3>";
					output5 += "아이디 : " + data;
				
					div4.innerHTML = output5;
					
			},//end sucess
			
			error : function(){
				alert('sendmEmail()함수통신 실패');
			}
			
		})//end $.ajax
		
	}//end searchcId()


	

</script>
</html>