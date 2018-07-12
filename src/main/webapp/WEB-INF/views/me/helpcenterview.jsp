<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>DEVLINK HOME</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type='text/javascript' src="resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/home/home.css">
<script src="resources/js/home/home.js"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.12/js/all.js"
	integrity="sha384-Voup2lBiiyZYkRto2XWqbzxHXwzcm4A5RfdfG6466bu5LqjwwrjXCMBQBLMWh7qR"
	crossorigin="anonymous"></script>
<style>
.hcheader{
	background-color: #385A9B;
	color: white;
	padding:20px;
	background: #5C258D;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #4389A2, #5C258D);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #4389A2, #5C258D); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}
.hcheader>#hcsubject2{
	text-align: center; 
	padding:20px;	
}
.hcheader>#hcsubject1{
	text-align: left; 
}
.hcheader>#hcsubject>#searchbar{
	text-align: center;

}
</style>
</head>
<body>
<%@include file="../home/devnav.jsp"%>
	<div id="contents">
		<div class="hcheader">
			<div id="hcsubject1">
				<h4><b>DevLink 고객센터</b></h4>
			</div>
			<div id="hcsubject2">
				<h2>${sessionScope.name}(<b>${sessionScope.id}</b>) 님! 무엇을 도와드릴까요?</h2>
				<br>	
			</div>
		</div>
		<section>
			<div style="padding:50px">
				<table class="table table-hover">
  					<thead>
    					<tr>
      						<td style="width:15%"><b>제목</b></td>
      						<td colspan="3">sdfsf</td>
    					</tr>
    					<tr>
    						<td><b>작성자</b></td>
    						<td>박다은</td>
    						<td style="width:15%"><b>작성일</b></td>
    						<td>2017/07/11</td>
    					</tr>
    					<tr>
    						<td><b>내용</b></td>
    						<td colspan="3">내ㅛㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ<br><br><br><br></td>
    					</tr>
    					<tr>
    						<td colspan="4">답ㄴ변</td>
    					</tr>
    					<tr>
    						<td>
    						<button type="button" class="btn btn-outline-info">확인</button>
    						<button type="button" class="btn btn-outline-secondary">취소</button>
    						</td>
    					</tr>
  					</thead>
  		
    </table>
  			</div>
  		</section>
  		<aside style="float:right; padding:30px;">
		<div>
			<a href="${pageContext.request.contextPath}/helpcenter.do" style="padding:10px"><h4><b>문의하기</b></h4></a>
			<a href="${pageContext.request.contextPath}/helpcenterlist.do" style="padding:10px"><h4><b>나의 문의함</b></h4></a>
		</div>
	</aside>
	</div>
<%@include file="../home/devfoot.jsp"%>
</body>
</html>