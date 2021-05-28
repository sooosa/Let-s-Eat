<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, th, td {
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px;
	}
</style>

</head>
<body>
	<div id="codiv">
		<table>
			<tr>
				<th>아이디</th>
				<td>${cmember.cId}</td>
				<input type="hidden" value="${cmember.cId}" name="cId" id="cId">
			</tr>	
			
			
			<tr>
				<th>이름</th>
				<td>${cmember.cName}</td>
			</tr>	
			
			
			<tr>
				<th>전화번호</th>
				<td>${cmember.cPhone}</td>
			</tr>	
			
			
			<tr>
				<th>이메일</th>
				<td>${cmember.cEmail}</td>
			</tr>
				
				
			<tr>
				<td colspan="2">
					<input type="button" onclick="cModify()" value="수정하기">
					<input type="button" onclick="cDel()" value="탈퇴하기">
				</td>
			</tr>
		
			
		</table>
	</div>
</body>
	<script>
		function cModify(){
			var output ="";
			
			output +="<form action='cModify' method='POST'>";
			output +="<fieldset>";
			output +="<legend>점주정보 수정</legend>";
			output +="아이디 : ${cmember.cId}<br>";
			output +="<input type='hidden' value='${cmember.cId}' name='cId'>";
			output +="이름 :<input type='text' name='cName' placeholder='이름'><br>";
			output +="전화번호 : <input type='text' name='cPhone' placeholder='휴대폰 번호 (- 빼고 입력)'><br>";
			output +="이메일 : <input type='text' name='cEmail' placeholder='이메일'><br>";
			output +="<input type='submit' value='점주 정보 수정'>";
			output +="</fieldset>";
			output +="</form>"
			
			document.getElementById("codiv").innerHTML = output;
		}
	

	</script>
	
	
	<!-- <!-- jquery를 사용하기 위해 작성 -->
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
	<script>
			var del = false;
	
		function cDel(){
			console.log("테스트");
			 var cId = document.getElementById("cId").value;
			console.log("cId"+cId);
		    if (confirm('점주님 탈퇴를하시겠습니까?')==true) {
		    	
		    	$.ajax({
					type : "GET",
					url :"cDel",
					data :{"cId":cId},
					dataType :"text",
					
					success : function(data){
						if(data=="OK"){
						alert('삭제되었습니다.');
						location.href="index";
						}
					},//end sucess
					
					error : function(){
						alert('함수통신 실패');
					}
					
				})//end $.ajax 
		            
		         } else {
		            alert("탈퇴를 취소하였습니다.");
		            return false;
		         }
		}
	

	</script>

</html>