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
<script src="resources/js/home/home.js"></script>
<script defer
   src="https://use.fontawesome.com/releases/v5.0.12/js/all.js"
   integrity="sha384-Voup2lBiiyZYkRto2XWqbzxHXwzcm4A5RfdfG6466bu5LqjwwrjXCMBQBLMWh7qR"
   crossorigin="anonymous"></script>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	$("#idCheck").click(function(){
		console.log("aaaaaaa");
		//아이디 유효성검사(영문소문자, 숫자만 허용)
		for(i=0; i<$("#id").val().length; i++){
			ch = $("#id").val().charAt(i);
			if(!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch<='z') && !(ch >= 'A' && ch <= 'Z')){
				$("#idResult").html('아이디는 영어대소문자, 숫자만 입력가능합니다');
				$("#id").val().focus();
				$("#id").val().select();
				return false;
			}
		}
		if($("#id").val().length<4 || $("#id").val().length>12){
			$("#idResult").html('아이디를 4~12자까지 입력해주세요');
			//아이디 유효성검사(영문소문자, 숫자만 허용)
			for(i=0; i<$("#id").val().length; i++){
				ch = $("#id").val().charAt(i);
				if(!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch<='z') && !(ch >= 'A' && ch <= 'Z')){
					$("#idResult").html('아이디는 영어대소문자, 숫자만 입력가능합니다');
					alert("아이디는 숫자, 대소문자만 입력가능합니다.");
					$("#id").val().focus();
					$("#id").val().select();
					return false;
				}
			}
		}else{
			$.post("/devlink/idCheck.do", {id: $("#id").val()})
			.done(function(data){
				$("#idResult").text(data);
				if($("#idResult").text().trim() == "사용가능"){
					$("#idResult").css("color", "#01DFA5"); 
				}else{
					$("#idResult").css("color", "#FA5858"); 
				}
			});
		}
	
	});
	$("#join").click(function(){
		if($("#idResult").text().trim() == "사용가능" && $("#pwdResult2").text() == "비밀번호가 일치합니다." &&
				$("#emailResult").text().trim() == "올바른 이메일입니다!" ){
			$("form").submit();
			alert("회원가입이 성공되었습니다");
		
				    /*   $('#joinmodal').modal();
				      $(".modal-backdrop").remove(); */
				
				
		}
		//아이디 유효성검사(영문소문자, 숫자만 허용)
		for(i=0; i<$("#id").val().length; i++){
			ch = $("#id").val().charAt(i);
			if(!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch<='z') && !(ch >= 'A' && ch <= 'Z')){
				alert("아이디는 숫자, 대소문자만 입력가능합니다.");
				$("#id").val().focus();
				$("#id").val().select();
				return false;
			}
		}
	
		//아이디 길이 체크(4~12자)
		if($("#id").val().length<4 || $("#id").val().length>12){
			alert("아이디를 4~12자까지 입력해주세요");
			$("#id").val().focus();
			$("#id").val().select();
			return false;
		}
	
	});
	
		$("#pwd").on("focusout", function(event) {
			var num = $("#pwd").val().search(/[0-9]/g);
			var eng = $("#pwd").val().search(/[a-z]/ig);
			var spe = $("#pwd").val().search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			if($("#pwd").val() == ""){
				$("#pwdResult").css("color", "#FA5858"); 
				$("#pwdResult").html('비밀번호를 입력해주세요');
			
			}else if($("#pwd").val().length <6 || $("#pwd").val().length>16){
				$("#pwdResult").css("color", "#FA5858"); 
				$("#pwdResult").html('6~16자 영문 대소문자,숫자,특수문자를 사용하세요.');
				return false;
			}else if($("#pwd").val().search(/₩s/) != -1){
				$("#pwdResult").css("color", "#FA5858"); 
				$("#pwdResult").html('비밀번호는 공백없이 입력해주세요');
				return false;
			}else if(num<0 || eng <0 || spe <0){
				$("#pwdResult").css("color", "#FA5858"); 
				$("#pwdResult").html('6~16자 영문 대소문자,숫자,특수문자를 사용하세요.');
				return false;
			}else{
			$("#pwdResult").css("color", "#01DFA5"); 
			$("#pwdResult").html('멋진 비밀번호네요!');
			} 
	});
	$("#pwd2").on("focusout", function(event){
		if($("#pwd").val() == ""){
			$("#pwdResult2").html('비밀번호를 입력하세요');
		}else if($("#pwd").val() != $("#pwd2").val()){
			$("#pwdResult2").html('비밀번호가 일치하지 않습니다.');
		}else if($("#pwd").val() == $("#pwd2").val()){
			$("#pwdResult2").css("color", "#01DFA5"); 
			$("#pwdResult2").html('비밀번호가 일치합니다.');
		}
		
	});
	$("#name").on("focusout", function(event) {
		if($("#name").val() == ""){
			$("#nameResult").html('이름을 입력하세요.');
		}else{
			$("#nameResult").hide();
		}
	});
	$("#email").on("focusout", function(event) {
		var re =  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;   
		if($("#email").val() == ""){
			$("#emailResult").css("color", "#FA5858");
			$("#emailResult").html('이메일 주소를 입력하세요.');
		}else if(!re.test($("#email").val())){
			$("#emailResult").css("color", "#FA5858");
			$("#emailResult").html('이메일 형식이 잘못되었습니다.');
			return false;
		}else if(re.test($("#email").val())){
			$("#emailResult").css("color", "#01DFA5");
			$("#emailResult").html('올바른 이메일입니다!');
			return true;
		}
	});
	$("#phone").on("focusout", function(event) {
		if($("#phone").val() == ""){
			$("#phoneResult").html('휴대폰 번호를 입력하세요.');
		}else{
			$("#phoneResult").hide();
		}
	});
	
	
});

</script>
<style>
.join_header{
    margin:0px auto;
   width:500px; 
   height:200px; 
   
}

.join_content{
   margin:0 auto;
   width:40%; 
}

.jfheader{
	color: black;
	padding:10px;
	
}
.jfheader>#jfsubject1{
	text-align: center; 
	padding:10px;	
}
.tr{
	margin:1%; 
	padding:1%;
	text-indent:10px;
}
.td{
	width:20%; background-color:#FAFAFA;
	padding:10px;
	text-indent:10px;
}
.join_text{
	display:inline-block;
	width:500px;
	hegiht:70px;
	border: 1px solid #E6E6E6; 
	padding:10px;
}
</style>

<body>
<%@include file="../home/devnav.jsp"%>
   	<div id="contents">
   	    <form action="${pageContext.request.contextPath}/join.do" method="post">
   			<div class="jfheader">
				<div id="jfsubject1">
					<img src="resources/img/me/join.png" style="width:120px;height:100px;padding:15px; display-inline:block"><h2><b>devlink 회원가입</b></h2>
					<div style="float:center;">
						<p>하나의 아이디로 다양한 DevLink서비스를 이용해 보세요.</p>
					</div>
				</div>
			</div>
			<hr>
			<div style=" text-indent:13%">
		 		<h6><b>*필수입력사항</b></h6>
			</div>
			<br>
			<div style=" float:center">
				<table style="width:70%; float:center; margin-left:auto; margin-right:auto ">
      				<tr>
      					<td class="td">
      						<h5 style="text-indent:10px;"><b>*아이디</b></h5>
      					</td>
      					<td class="tr">
							<input type="text" class="join_text" id="id" name="id" placeholder="아이디는 숫자, 대소문자만 입력가능합니다.">
  							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        					<button type="button" class="btn btn-info disabled" style="width:110px;padding:10px" id="idCheck">중복확인</button>
        					<br>
        					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        			    	<span style="color:#FA5858;text-indent:10px;" id="idResult">중복체크를 먼저 해주세요</span>
      					</td>
      				</tr>
      				<tr>
      					<td class="td">
      						<h5 style="text-indent:10px;"><b>*비밀번호</b></h5>
      					</td>
      					<td class="tr">
      						<div class="form-group">
							<input type="password" class="join_text" id="pwd" name="pwd" placeholder="6~16자 영문 대소문자,숫자,특수문자를 사용하세요.">
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        			    	<span style="color:#FA5858;text-indent:10px;" id="pwdResult"></span>
							</div>
      					</td>
      				</tr>
      				<tr>
      					<td class="td">
      						<h5 style="text-indent:10px;"><b>*비밀번호 확인</b></h5>
      					</td>
      					<td class="tr">
      						<div class="form-group">
								<input type="password" class="join_text" id="pwd2" name="pwd2">
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        			    		<span style="color:#FA5858;text-indent:10px;" id="pwdResult2"></span>
							</div>
      					</td>
      				</tr>
      				<tr>
      					<td class="td">
      						<h5 style="text-indent:10px;"><b>*이름</b></h5>
      					</td>
      					<td class="tr">
      						<div class="form-group">
								<input type="email" class="join_text" id="name" name="name">
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        			    		<span style="color:#FA5858;text-indent:10px;" id="nameResult"></span>
							</div>
      					</td>
      				</tr>
      				<tr>
      					<td class="td">
      						<h5 style="text-indent:10px;"><b> *본인 확인 이메일</b></h5>
      					</td>
      					<td class="tr">
      						<div class="form-group">
								<input type="text" class="join_text" id="email" name="email">
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        			    		<span style="color:#FA5858;text-indent:10px;" id="emailResult"></span>
							</div>
      					</td>
      				</tr>
      				<tr>
      					<td class="td">
      						<h5 style="text-indent:10px;"><b>*휴대전화</b></h5>
      					</td>
      					<td class="tr">
      						<div class="form-group">
							<input type="text" class="join_text" id="phone" name="phone">
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        			    	<span style="color:#FA5858;text-indent:10px;" id="phoneResult"></span>
							</div>
      					</td>
      				</tr>
   				</table>

    		</div>
			<div style="clear:both;text-align:center">
    			<button type="button" class="btn btn-outline-secondary" style="height:60px;width:150px; margin:30px; padding:10px; text-align:center;">취소</button>
 				<button type="button" class="btn btn-outline-info"  style="height:60px;width:150px; margin:30px; padding:10px;text-align:center;" id="join">가입하기</button>
			</div>	
   		</form>
   	</div>  
<%@include file="../home/devfoot.jsp"%>
</body>
</html>