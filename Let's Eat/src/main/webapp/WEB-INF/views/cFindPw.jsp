<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점주 비밀번호 찾기</title>
</head>
<body>
	
	<div id="div3">
		<h3> 아이디 : <input type="text" id="cId" placeholder="아이디을 입력해주세요"></h3>
		<h3> 이메일 : <input type="email" id="cEmail" placeholder="인증받을 이메일을 입력해주세요."></h3>
					<input type="button" onclick="sendcEmail()" value="확인">
	</div>
	<br><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=" findcId">아이디 찾기</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=" cloginForm">로그인 하기</a>

</body>



<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>

<script>
	// 점주 비밀번호 찾기
	function sendcEmail() {
		console.log("테스트");
		var cId = document.getElementById("cId").value;
		
		var cEmail = document.getElementById("cEmail").value;
		
		var div3 = document.getElementById("div3");
		
		console.log("cId : " + cId);
		console.log("cEmail : " + cEmail);
		
		$.ajax({
			type : "POST",
			url : "cfindpw",
			data : { "cId" : cId ,  "cEmail" : cEmail } ,
			dataType : "text",
			success : function(data){
				alert('적어주신 메일로 인증번호를 발송했습니다. 메일을 열어 인증을 해주시기 바랍니다!');

				var output3 = "";
				
				output3 += "<h1>인증번호 : " + data + "</h1>";
				output3 += "<h3>인증번호 입력 : <input type='text' id='inputcCode'>";
				output3 += "<button onclick='confircCode()'>인증</button></h3>";
				output3 += "<input type='hidden' id='cCheckCode' value='" + data + "'>";
				output3 += "<input type='hidden' id='cId' value='" + cId + "'>";
				output3 += "<input type='hidden' id='cEmail' value='" + cEmail + "'>";
				
				// document.getElementById("div2").innerHTML = output1;
				div3.innerHTML = output3;
			} ,
			error : function(){
				alert('이메일 인증실패 다시작성해주세요!');
			}
		});// end ajax
		
		
	} // end sendcEmail





	function confircCode(){
		console.log("테스트");
		// 공간 div3
		var div3 = document.getElementById("div3");

		// 입력한 인증코드
		var inputcCode = document.getElementById("inputcCode").value;

		// 이메일로 보내준 인증코드
		var cCheckCode = document.getElementById("cCheckCode").value;

		// 아이디 주소
		var cId = document.getElementById("cId").value;
			
		// 이메일 주소
		var cEmail = document.getElementById("cEmail").value;
		console.log("cId"+cId);
		if(inputcCode == cCheckCode){
			alert('인증이 완료됐습니다!');
			
			var output4 = "";
			output4 += "<h1>cEmail : " + cEmail + "</h1>";
			output4 += "<form action='changecPw', method='POST'>";
			output4 += "<h3>변경할 패스워드 : <input type='password' name='cPw'>";
			output4 += "<input type='hidden' name='cEmail' value='" + cEmail + "'>";
			output4 += "<input type='hidden' name='cId' value='" + cId + "'>";
			output4 += "<input type='submit' value='변경'>";
			output4 += "</form>";

			div3.innerHTML = output4;
			
		} else {
			alert('인증번호가 틀렸습니다.');
		}
	} // end confircCode


</script>

</html>