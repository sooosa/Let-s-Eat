<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성하기</title>
<style>
	table, tr, th, td {
		border : 1px solid black;
		border-collapse: collapse;
		padding : 10px;
	}
	
	.center {
		text-align : center;
	}
	
	.bookdiv {
		border : 2px solid black;
		border-radius : 10px;
		width : 45%;
		height: 300px;
		padding : 10px;
		padding-left : 20px;
		margin : auto;
	}
	
	.imgdiv{
		float:left; 
		margin-right:20px;
		width: 230px;
		height: 310px;
	}

.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('resources/img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>

</head>
<body>
		
	<br><br>&nbsp;&nbsp;&nbsp;
	<button onclick="location.href='index'">메인페이지 이동</button>
	<button onclick="window.history.back();">뒤로가기</button>

		<h2 class='center'><br>리뷰를 작성해 주세요!<br><br></h2>
	
		<div class='bookdiv'>
		
			<div>
				<div class='imgdiv'>
					<img src='resources/fileUpload/${reiviewWrite.bsFileName1}'>
				</div><br>
				
				<span style='color:#8F8F8F'><b>예약번호 : </b>${reiviewWrite.bCode}</span>
				<h2>${reiviewWrite.bsName}</h2>
				<div><b>예약 날짜 : </b>${reiviewWrite.bDate}</div><br>
				<div><b>예약 시간 : </b>${reiviewWrite.bTime}</div><br>
				<div><b>예약 인원 : </b>${reiviewWrite.bmCount} 명</div><br>
				<div><b>주소 : </b>${reiviewWrite.bsAddr}</div>
	
			</div>

		</div><br><br>
		




<form action="rwrite" method="POST" name="reviewform">
<table class='bookdiv'>
	
	<input type="hidden" value="${sessionScope.mloginId}" name="rmId">
	<input type="hidden" value="${reiviewWrite.bsCode}" name="rsCode">
	<input type="hidden" value="${reiviewWrite.bDate}" name="rBook">
	<input type="hidden" value="${reiviewWrite.bCode}" name="rbCode">
	
	
	<tr>
		<th>별점</th>
		<td><span class="star-input">
			<span class="input">
    			<input type="radio" name="rStar" value="1" id="p1">
    			<label for="p1">1</label>
    			<input type="radio" name="rStar" value="2" id="p2">
    			<label for="p2">2</label>
    			<input type="radio" name="rStar" value="3" id="p3">
    			<label for="p3">3</label>
    			<input type="radio" name="rStar" value="4" id="p4">
    			<label for="p4">4</label>
    			<input type="radio" name="rStar" value="5" id="p5">
    			<label for="p5">5</label>
  		</span>
  			<output for="rStar" name="rStar"><b>0</b>점</output>						
		</span></td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td  class='center'><textarea rows="7" cols="95" name="rContents"></textarea></td>
	</tr>
	
	<tr>
		<td colspan="2" class='center'>
			<input type="button" onclick="rWrite()" value="등록">
		</td>
	</tr>
	
</table>
</form>



</body>

<script src="resources/js/jquery-1.11.3.min.js"></script>
<script src="resources/js/star.js"></script>

<script>
	function rWrite(){
		alert("리뷰가 작성되었습니다.");
		reviewform.submit();
	}

</script>

</html>


