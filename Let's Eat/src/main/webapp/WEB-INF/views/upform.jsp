<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 등록</title>
</head>
<body>


<form action="cupdate" method="POST" enctype="multipart/form-data">
<table>
	<caption><h3>업체 등록</h3></caption>
	<tr>
		<td>업체 이름</td>
		
		<td><input type="text" name="sName" placeholder="업체 이름">
		<input type="hidden" value="${sessionScope.cloginCode}" name="scCode">
		</td>
	</tr>
	<tr>
		<td>영업시간</td>
		<td><input type="text" name="sTime" placeholder="ex) 12:00~20:00"></td>
	</tr>
	<tr>
		<td>업체홈페이지</td>
		<td><input type="text" name="sUrl" placeholder="홈페이지 url"></td>
	</tr>
	<tr>
		<td>업체주소</td>
		<!-- <td><input type="text" name="sAddr" placeholder="업체 주소"></td> -->
		
        <td>
        	<input type="text" id="sample6_postcode" placeholder="우편번호" name="postcode" class="form-control form-control-user">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="form-control form-control-user">
			<br>
			<input type="text" id="sample6_address" placeholder="주소" name="addr1" class="form-control form-control-user">
			<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="addr3" class="form-control form-control-user">
			<br>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr2" class="form-control form-control-user">  
        </td>
                           
	</tr>
	
	<tr>
		<td>업체 전화번호</td>
		<td><input type="text" name="sPhone" placeholder="ex) 02-1111-2222"></td>
	</tr>
	
	<tr>
		<td>단체석 여부</td>
		<td><input type="radio" name="sSeat" id="sSeat" value="단체석 있음">단체석 있음<br>
			<input type="radio" name="sSeat" id="sSeat" value="단체석 없음">단체석 없음</td>
	</tr>
	
	<tr>
				<td>업체 소개</td>
				<td><textarea rows="8" cols="50" name="sContents" placeholder="우리 가게를 소개 합니다."></textarea></td>
	</tr>
	
	<tr>
		<td>사업자 번호</td>
		<td><input type="text" name="sbNum" placeholder="사업자 번호를 입력"></td>
	</tr>
	<tr>
		<td>주차 여부</td>
		<td><input type="radio" name="sPark" id="sPark" value="주차 가능">주차 가능<br>
			<input type="radio" name="sPark" id="sPark" value="주차 불가능">주차 불가능</td>
	</tr>
	
	<tr>
		<td>카테고리</td>
		<td><select name="sFood">
			<option value="">음식분류</option>
			<option value="양식">양식</option>
			<option value="한식">한식</option>
			<option value="일식">일식</option>
			<option value="중식">중식</option>
			<option value="분식">분식</option>
			<option value="카페">카페</option>
			<option value="패스트푸드">패스트푸드</option>
			<option value="기타">기타</option>
		</select></td>
	</tr>
	
	<tr>
		<td>키워드</td>
		<td><input type="text" name="keyword1" placeholder="1번 키워드를 입력"><br>
		<input type="text" name="keyword2" placeholder="2번 키워드를 입력"><br>
		<input type="text" name="keyword3" placeholder="3번 키워드를 입력"><br>
		<input type="text" name="keyword4" placeholder="4번 키워드를 입력"><br>
		<input type="text" name="keyword5" placeholder="5번 키워드를 입력"></td>
	</tr>
	
	<tr>
			<td>로고</td>
				<td><input type="file" name="sFile1"></td>
	</tr>
	
	
	<tr>
			<td>사진 1</td>
				<td><input type="file" name="sFile2"></td>
	</tr>
	
	
	<tr>
			<td>사진 2</td>
				<td><input type="file" name="sFile3"></td>
	</tr>
		
	<tr>
		<td colspan="2"><br><input type="submit" value="등록">
							<input type="button" onclick="window.history.back();" value="뒤로가기"></td>
	</tr>
	
	
</table>

</form>


</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	//주소 Api
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


</html>


