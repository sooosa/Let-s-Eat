<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 회원가입</title>
</head>
<body>

	<form action="mjoin" method="POST" enctype="multipart/form-data" name="mjoinForm">
	
	<fieldset>
		<legend>일반 회원가입</legend>
		아이디 : <input type="text" name="mId" id="mId" placeholder="아이디" size="20">
		<input type="button" onclick="mIdCheck()" value="중복체크"><br>
		<div id="confirmId"></div><div id="mIdResult"></div>
		비밀번호 : <input type="password" name="mPw"  id="mPw" placeholder="비밀번호" size="20" onkeyup="mPwCheck()"><br>
				<div id="mpwResult"></div>
		이름 : <input type="text" name="mName" id="mName" size="20" placeholder="이름"><br>
		생년월일 : <input type="date" name="mBirth" id="mBirth" size="20"><br>
		성별 : <input type="radio" name="mGender"  value="M">남
			   <input type="radio" name="mGender"  value="F">여<br>
		전화번호 : <input type="text" name="mPhone" id="mPhone" placeholder="휴대폰 번호 (- 빼고 입력)" size="20"><br>
		이메일 : <input type="email" name="mEmail" id="mEmail" placeholder="이메일"><br>	   
		주소 : <input type="text" id="sample6_postcode" name="postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소" name="addr1"><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr2">
		<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="addr3"><br>
	
	
		<br>			
	
		<input type="button" onclick="submitForm()" value="회원가입">
		<input type="reset" value="다시작성">
	
	</fieldset>
	</form>
	<br><hr><br>
	
	<a href="naverjoin"><img width="223" src="resources/img/naver_join.png"></a>
	
</body>



<!-- <!-- jquery를 사용하기 위해 작성 -->
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>


<!-- 다음 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>



<script>
 //회원 아이디 공백 제거
 var just = false;
 
	function mIdCheck(){
	 	console.log("테스트");
	 	
		var mId = document.getElementById("mId");
		var mIdResult = document.getElementById("mIdResult");
		var mIdVal = mId.value;
		
		console.log("mId"+mId);

		if(mIdVal.length<=0){
			confirmId.innerHTML="";
			return false;
			
		} else if(mIdVal.search(/\s/)!=-1){
			confirmId.style.color ="#F781BE";
			confirmId.innerHTML="회원님 아이디 공백 없이 입력해주세요!";
			return false;
			
		} else {
				//일반 회원 중복체크
				function midOverlap(){
			
					var mId = document.getElementById("mId").value;
					var confirmId = document.getElementById("confirmId"); 
					console.log("test");
					$.ajax({
						type : "POST" ,
						url : "midoverlap" ,
						data : { "mId" : mId } ,
						dataType : "text",

						success : function(data){	
							if(data=="OK"){
								confirmId.style.color="#0000ff";
								confirmId.innerHTML="사용가능한 아이디";
								just = true;
							} else {
								confirmId.style.color="#ff0000";
								confirmId.innerHTML="사용중인 아이디";
								just = false;
							} // end if
						},	// end success
						
						error : function(){
							alert('회원가입 실패!');
							just = false;
						} // end error
						
					}); // end ajax
			
				} // end idOverlap()

				mIdResult.style.color ="#0000ff";
				return midOverlap();
				
			} // end else 
	
	} //end mIdCheck()


	//회원 비밀번호 정규식 체크 메소드
	function mPwCheck(){
		var mPw = document.getElementById("mPw");
		var mpwResult = document.getElementById("mpwResult");
	
		var mPwVal = mPw.value;
	
		var num = mPwVal.search(/[0-9]/g);
		var eng = mPwVal.search(/[a-z]/ig);
		var spe = mPwVal.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		if(mPwVal.length<=0){
			mpwResult.innerHTML="";
			return false;
		} else if(mPwVal.length<8 || mPwVal.length>20){
			mpwResult.style.color ="#ff0000";
			mpwResult.innerHTML="8~20자리 이내로 입력해주세요!";
			return false;
		} else if(mPwVal.search(/\s/)!=-1){
			mpwResult.style.color ="#ff0000";
			mpwResult.innerHTML="비밀번호는 공백 없이 입력해주세요!";
			return false;
		} else if(num< 0 || eng< 0 || spe< 0){
			mpwResult.style.color ="#ff0000";
			mpwResult.innerHTML="영문, 숫자, 특수문자를 혼합하여 입력해주세요!";
			return false;
		} else {
			mpwResult.style.color ="#0000ff";
			mpwResult.innerHTML="적절한 비밀번호 입니다!";
			return true;
		}
	
	} //end mPwCheck()

var mGenderArray = document.getElementsByName("mGender");
// mGenderArray[0] = 남자
// mGenderArray[1] = 여자

var mName = document.getElementById("mName");
var mBirth = document.getElementById("mBirth");
var mPhone = document.getElementById("mPhone");
var mEmail = document.getElementById("mEmail");
var mAddr = document.getElementById("mAddr");


function submitForm(){
	
	var mGender = "";

	for(var i=0; i<mGenderArray.length; i++){
		if(mGenderArray[i].checked==true){
			mGender = mGenderArray[i].value;
		}
	}
	
	console.log("just : " + just);	
	
	if(!just){
		alert('아이디를 확인해주세요!');
	} else if(!mPwCheck()){
		alert('비밀번호를 확인해주세요!');
	} else if(mName.value==""){
		alert('이름을 입력해주세요!');
	} else if(mBirth.value==""){
		alert('생년월일을 입력해주세요!');
	} else if(mGender==""){				
		alert('성별을 입력해주세요!');
	} else if(mPhone.value==""){				
		alert('전화번호를 입력해주세요!');	
	} else if(mEmail.value==""){
		alert('이메일을 입력해주세요!');
	} else {
		alert('🎊회원가입이 완료되었습니다.🎊 \n가입시 1000Point 드립니다.');
		//이메일 정규식
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		 
		if(!emailRule.test(mEmail.value)) {            
			alert('이메일을 확인해주세요!!');
		} else {
			mjoinForm.submit();
		}
	}
} //end submitForm()



</script>


</html>


