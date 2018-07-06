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
<div id="contents">
	<div class="hcheader">
		<div id="hcsubject1">
			<h4><b>DevLink 고객센터</b></h4>
		</div>
		<div id="hcsubject2">
			<h2>daeun 님! 무엇을 도와드릴까요?</h2>
			<br>
			<div style="float:right;">
			<form class="form-inline my-2 my-lg-0" id="searchbar" style="">	
      			<input class="form-control mr-sm-2" type="text" style="width:300px; padding:5px" placeholder="도움말 검색" >
      			<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    		</form>
			</div>
			<br><br>
		</div>
	</div>
	<section>
	<div style="padding:60px">
		<h3><b>문의하기</b></h3><hr>
		
		<div class="form-group">
  			<label class="col-form-label" for="inputDefault">제목</label>
  			<input type="text" class="form-control"style="width:700px">
		</div>
		 <div class="form-group">
      <label for="exampleInputFile">파일첨부</label>
      <input type="file" class="form-control-file" id="exampleInputFile" style="width:700px" aria-describedby="fileHelp">
    </div>
		    <div class="form-group">
      <label for="exampleTextarea">내용</label>
      <div style="width:700px; hieght:700px">
         <div id="summernote"></div>
      </div>

      <br>
    </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

   		<button type="button" class="btn btn-outline-success" style="width:150px">보내기</button>
	</div>
	</section>
	<aside style="float:right; padding:30px;">
		<div>
			<a href="#" style="padding:10px"><h4><b>문의하기</b></h4></a>
			<a href="#" style="padding:10px"><h4><b>나의 문의함</b></h4></a>
		</div>
	</aside>

</div>

<%@include file="../home/devfoot.jsp"%>
</body>
</html>