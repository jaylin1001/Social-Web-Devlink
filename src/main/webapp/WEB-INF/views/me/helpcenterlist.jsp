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
<script>
var bNo=-1;
function showboard(no){
	if(bNo!=-1){
		$('#bdivno'+bNo).remove();
	}
	if(bNo!=no){
		$.ajax({      
	        type:'POST',  
	        url:'showboard.do',      
	        data: {bno:no},      
	        success:function(data){
	        	bNo=no;
	        	$("#tr"+no).after(data);
	        }
	    });
	}else{
		bNo=-1;
	}
}

</script>
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
#viewdetail{
	display:none;
}
</style>
</head>
<body>
<%@include file="../home/devnav.jsp"%>
	<div id="contents" style="background-color:#F9F9F9">
		<div class="hcheader">
			<div id="hcsubject1">
				<h4><b>DevLink 고객센터</b></h4>
			</div>
			<div id="hcsubject2">
				<h2>${sessionScope.name}(<b>${sessionScope.id}</b>) 님! 무엇을 도와드릴까요?</h2>
				<br>
			</div>
		</div>
		<div style="height:100%;width: 20%;float: left;display: inline-block;background-color:#F9F9F9;padding-left:2%">
			<a href="${pageContext.request.contextPath}/helpcenter.do" style="padding:10px"><h4><b>문의하기</b></h4></a>
			<a href="${pageContext.request.contextPath}/helpcenterlist.do" style="padding:10px"><h4><b>나의 문의함</b></h4></a>
		</div>
		<div style="width:80%;float:none;display: inline-block;background-color:#F9F9F9">
			<div style="padding:50px">
			<h3><b>문의게시판</b></h3><br>
			<table class="table table-hover">
 				<thead>
    				<tr>
      					<th style="width:3%;text-align:center">No</th>
      					<th style="width:73%;text-align:center"">제목</th>
      					<th style="width:12%;text-align:center"">회원번호</th>
      					<th style="width:12%;text-align:center"">작성날짜</th>
   					</tr>
   				</thead>
   				<tbody id="tablelist">
	   				<c:if test="${not empty bb }">
						<c:forEach var="b" items="${bb}" >
						    <tr id="tr${b.b_no}">
		      					<td id="b_no" style="text-align:center">${b.b_no}</th>
		      					<td id="b_title" style="padding-left:4%"><a href="javascript:showboard(${b.b_no});">${b.b_title}</a></td>
		      					<td id="b_name" style="text-align:center">${b.m_no }</td>
		      					<td id="b_date" style="text-align:center">${b.b_date }</td>
	    					</tr>
					    </c:forEach>
					</c:if>
   				</tbody>			
  			</table>
  			
  			</div>
		
  			
  		</div>
	</div>
<%@include file="../home/devfoot.jsp"%>
</body>
</html>