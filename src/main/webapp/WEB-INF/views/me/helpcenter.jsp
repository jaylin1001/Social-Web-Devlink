<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>DEVLINK</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type='text/javascript' src="resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/home/home.css">

<!-- include summernote css/js -->
<link href="resources/dist/summernote.css" rel="stylesheet" type="text/css">
<script src="resources/dist/summernote.min.js" type="text/javascript"></script>


<script src="resources/js/home/home.js"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.12/js/all.js"
	integrity="sha384-Voup2lBiiyZYkRto2XWqbzxHXwzcm4A5RfdfG6466bu5LqjwwrjXCMBQBLMWh7qR"
	crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	$('#summernote').summernote({
        height: 500
	});
	$('#write').click(function(){
		$("form").submit(); 
		alert('문의가 등록되었습니다');
	});
	$('div.note-children-container').remove();
});
</script>

</head>
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
#personal_menu a:hover{
  background:#6CDAB2;
  color:white;
}
div#schedule_detail{
display:none;
}

#menubar{
	float:left;
}
.list-group{
	border:0;
	outline:0;
	border:none;
}
.under{
	text-indent:5%;
	padding:30px;
}
</style>

<body>
<%@include file="../home/devnav.jsp"%>
<div id="contents" style="background-color:#F9F9F9">
	<div class="hcheader">
		<div id="hcsubject1">
			<h4><b>DevLink 고객센터</b></h4>
		</div>
		<div id="hcsubject2">
			<h2>${sessionScope.name}(<b id="id" name="id">${sessionScope.id}</b>) 님! 무엇을 도와드릴까요?</h2>
			<br>			
		
		</div>
	</div>
	<div>
	<div style="height:100%;width: 20%;float: left;display: inline-block;background-color:#F9F9F9;padding-left:2%">
			<a href="${pageContext.request.contextPath}/helpcenter.do" style="padding:10px"><h4><b>문의하기</b></h4></a>
			<a href="${pageContext.request.contextPath}/helpcenterlist.do" style="padding:10px"><h4><b>나의 문의함</b></h4></a>
	</div>
	<div style="width:65%;float:none;display: inline-block;background-color:#F9F9F9">
	<div style="padding:50px">
		<h3><b>문의하기</b></h3><hr>
		<form action="${pageContext.request.contextPath}/write.do" method="post">
		<div class="form-group">
  			<label class="col-form-label" for="inputDefault">제목</label>
  				<input type="text" class="form-control"style="width:700px" id="b_title" name="b_title">
		</div>
		    <div class="form-group">
      <label for="exampleTextarea">내용</label>
      <div style="width:100%;">
         <textarea id="summernote" name="b_contents"></textarea>
      </div>
      <br>
    </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

   		<button type="button" class="btn btn-outline-success" style="width:150px; height:60px;float:center" id="write">글쓰기</button>
	</form>
	</div>
	</div>
	</div>
	<%-- <aside style="float:right; padding:30px;">
		<div>
			<a href="${pageContext.request.contextPath}/helpcenter.do" style="padding:10px"><h4><b>문의하기</b></h4></a>
			<a href="${pageContext.request.contextPath}/helpcenterlist.do" style="padding:10px"><h4><b>나의 문의함</b></h4></a>
		</div>
	</aside> --%>
</div>

<%@include file="../home/devfoot.jsp"%>
</body>
</html>