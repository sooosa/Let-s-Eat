<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 비밀 번호 찾기</title>
</head>
<body>

	<div id="div1">
		<h3> 아이디 : <input type="text" id="mId" placeholder="*아이디을 입력해주세요"></h3>
		<h3> 이메일 : <input type="email" id="mEmail" placeholder="*인증받을 이메일을 입력해주세요."></h3>
					<input type="button" onclick="sendmEmail()" value="확인">
	</div>
	<br><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=" findmId">아이디 찾기</a>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=" mloginForm">로그인 하기</a>

</body>

<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>


<script>
	// 회원 비밀번호 찾기
	function sendmEmail() {
		console.log("테스트");
		var mId = document.getElementById("mId").value;
		var mEmail = document.getElementById("mEmail").value;
		var div1 = document.getElementById("div1");

		console.log("mId : " + mId);
		console.log("mEmail : " + mEmail);
		
		
		$.ajax({
			type : "POST",
			url : "mfindpw",
			data : { "mId" : mId , "mEmail" : mEmail } ,
			dataType : "text",
			success : function(data){
				alert('적어주신 메일로 인증번호를 발송했습니다. 메일을 열어 인증을 해주시기 바랍니다!');

				var output1 = "";
				
				output1 += "<h1>인증번호 : " + data + "</h1>";
				output1 += "<h3>인증번호 입력 : <input type='text' id='inputmCode'>";
				output1 += "<button onclick='confirmCode()'>인증</button></h3>";
				output1 += "<input type='hidden' id='mcheckCode' value='" + data + "'>";
				output1 += "<input type='hidden' id='mId' value='" + mId + "'>";
				output1 += "<input type='hidden' id='mEmail' value='" + mEmail + "'>";
				
				// document.getElementById("div1").innerHTML = output1;
				div1.innerHTML = output1;
			} ,
			error : function(){
				alert('이메일 인증실패 다시작성해주세요!');
			}
		});// end ajax
		
		
	} // end function

	function confirmCode(){
		console.log("테스트");
		// 공간 div2
		var div1 = document.getElementById("div1");

		// 입력한 인증코드
		var inputCode = document.getElementById("inputmCode").value;

		// 이메일로 보내준 인증코드
		var mcheckCode = document.getElementById("mcheckCode").value;

		// 아이디 주소
		var mId = document.getElementById("mId").value;
		
		// 이메일 주소
		var mEmail = document.getElementById("mEmail").value;
		console.log("mId"+mId);
		if(inputCode == mcheckCode){
			alert('인증이 완료됐습니다!');
			
			var output2 = "";
			
			output2 += "<h1>mEmail : " + mEmail + "</h1>";
			output2 += "<form action='changemPw', method='POST'>";
			output2 += "<h3>변경할 패스워드 : <input type='password' name='mPw'>";
			output2 += "<input type='hidden' name='mEmail' value='" + mEmail + "'>";
			output2 += "<input type='hidden' name='mId' value='" + mId + "'>";
			output2 += "<input type='submit' value='변경'>";
			output2 += "</form>";

			div1.innerHTML = output2;
			
		} else {
			alert('인증번호가 틀렸습니다.');
		}
	} // end function

	
</script>


</html>