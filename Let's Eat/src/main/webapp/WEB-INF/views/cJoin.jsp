<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점주 가입</title>
</head>
<body>

	<form action="cjoin" method="POST" enctype="multipart/form-data" name="cjoinForm">
	
	<fieldset>
		<legend>점주 회원가입</legend>
		아이디 : <input type="text" name="cId" id="cId" placeholder="아이디" size="20" >
		<input type="button" onclick="cIdCheck()" value="중복체크"><br>
		<div id="confircId"></div><div id="cIdResult"></div>
		비밀번호 : <input type="password" name="cPw" id="cPw" placeholder="비밀번호" size="20" onkeyup="cPwCheck()"><br>
		<div id="cpwResult"></div>
		이름 : <input type="text" name="cName"  placeholder="이름"  id="cName" size="20"><br>
		전화번호 : <input type="text" name="cPhone" placeholder="휴대폰 번호 (- 빼고 입력)"  id="cPhone"size="20"><br>	  
		이메일 : <input type="email" name="cEmail" id="cEmail" placeholder="이메일"><br>
		
			<input type="button" onclick="submitForm()" value="회원가입">
			<input type="reset" value="다시작성">
	</fieldset>
	
	</form>
	
	
</body>

<!-- jquery를 사용하기 위해 작성 -->
 <script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
 
<script>
//점주 아이디 공백 제거
function cIdCheck(){
 	console.log("테스트");
	var cId = document.getElementById("cId");
	var cIdResult = document.getElementById("cIdResult");
	console.log("cId"+cId);
	var cIdVal = cId.value;


	if(cIdVal.length<=0){
		confircId.innerHTML="";
		return false;
	} else if(cIdVal.search(/\s/)!=-1){
		confircId.style.color ="#F781BE";
		confircId.innerHTML="점주님 아이디 공백 없이 입력해주세요!";
		return false;
	} else{
	
			// 점주 회원 아이디 중복체크
			function cidOverlap(){
		
				var cId = document.getElementById("cId").value;
				var confircId = document.getElementById("confircId"); 

				$.ajax({
					type : "POST" ,
					url : "cidoverlap" ,
					data : { "cId" : cId } ,
					dataType : "text",

					success : function(data){
						if(data=="OK"){
							confircId.style.color="#0000ff";
							confircId.innerHTML="사용가능한 아이디";
							ceo = true;
						} else {
							confircId.style.color="#ff0000";
							confircId.innerHTML="사용중인 아이디";
							ceo= false;
						} // end if
					},	// end success
			
					error : function(){
						alert('점주 가입 실패!');
						ceo= false;
					} // end error

				}); // end ajax
		
			} // end idOverlap()

			cIdResult.style.color ="#0000ff";
			return cidOverlap();
 		}

} //end cIdCheck()


	//점주 비밀번호 정규식 체크 메소드
	function cPwCheck(){
		var cPw = document.getElementById("cPw");
		var cpwResult = document.getElementById("cpwResult");
	
		var cPwVal = cPw.value;
	
		var num = cPwVal.search(/[0-9]/g);
		var eng = cPwVal.search(/[a-z]/ig);
		var spe = cPwVal.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		if(cPwVal.length<=0){
			cpwResult.innerHTML="";
			return false;
		} else if(cPwVal.length<8 || cPwVal.length>20){
			cpwResult.style.color ="#ff0000";
			cpwResult.innerHTML="8~20자리 이내로 입력해주세요!";
			return false;
		} else if(cPwVal.search(/\s/)!=-1){
			cpwResult.style.color ="#ff0000";
			cpwResult.innerHTML="비밀번호는 공백 없이 입력해주세요!";
			return false;
		} else if(num< 0 || eng< 0 || spe< 0){
			cpwResult.style.color ="#ff0000";
			cpwResult.innerHTML="영문, 숫자, 특수문자를 혼합하여 입력해주세요!";
			return false;
		} else {
			cpwResult.style.color ="#0000ff";
			cpwResult.innerHTML="적절한 비밀번호 입니다!";
			return true;
		}
	
	} //end cPwCheck()

// 점주 공란
var ceo = false;
var cName = document.getElementById("cName");
var cPhone = document.getElementById("cPhone");
var cEmail = document.getElementById("cEmail");


function submitForm(){
	
	
	console.log("ceo : " + ceo);	
	
	if(!ceo){
		alert('아이디를 확인해주세요!');
	} else if(!cPwCheck()){
		alert('비밀번호를 확인해주세요!');
	} else if(cName.value==""){
		alert('이름을 입력해주세요!');
	} else if(cPhone.value==""){
		alert('전화번호를 입력해주세요!');
	} else if(cEmail.value==""){
		alert('이메일을 입력해주세요!');
	} else {
		alert('🎊점주님 가입 완료되었습니다. 축하합니다🎊\n업체를 등록해주세요');
		//이메일 정규식
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		 
		if(!emailRule.test(cEmail.value)) {            
			alert('이메일을 확인해주세요!!');
		} else {
			cjoinForm.submit();
		}
	}
} //end submitForm()



</script>
</html>


