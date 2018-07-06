<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>DEVLINK</title>
<script type='text/javascript' src="resources/js/bootstrap.js"></script>
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/home/home.css">
<script src="resources/js/home/home.js"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.12/js/all.js"
	integrity="sha384-Voup2lBiiyZYkRto2XWqbzxHXwzcm4A5RfdfG6466bu5LqjwwrjXCMBQBLMWh7qR"
	crossorigin="anonymous"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
function a(){
	if($("#text1").css("display")=="none"){
		$("[id=text1]").show();
		$("[id=text6]").hide();
		$("[id=enroll_email]").show();
	}else{
		$("[id=text1]").hide();
		$("[id=text6]").hide();
		$("[id=enroll_email]").show();
	}
}
function b(){
	if($("#text2").css("display")=="none"){
		$("[id=text2]").show();
		$("[id=text7]").hide();
		$("[id=enroll_tell]").show();
	}else{
		$("[id=text2]").hide();
		$("[id=text7]").hide();
		$("[id=enroll_tell]").show();
	}
}
function c(){
	if($("#text3").css("display")=="none"){
		$("[id=text3]").show();
		console.log("sdf");
	}else{
		$("[id=text3]").hide();
	}
}
function d(){
	if($("#text4").css("display")=="none"){
		$("[id=text4]").show();
	}else{
		$("[id=text4]").hide();
	}
}
function e(){
	if($("#text5").css("display")=="none"){
		$("[id=text5]").show();
	}else{
		$("[id=text5]").hide();
	} 
}
function f(){
	if($("#text6").css("display")=="none"){
		$("[id=text6]").show();
		$("[id=enroll_email]").hide();
	}else{
		$("[id=text6]").hide();
		$("[id=enroll_email]").show();
	} 
}
function g(){
	if($("#text7").css("display")=="none"){
		$("[id=text7]").show();
		$("[id=enroll_tell]").hide();
	}else{
		$("[id=text7]").hide();
		$("[id=enroll_tell]").show();
	} 
}
function h(){
	if($("#text8").css("display")=="none"){
		$("[id=text8]").show();
		$("[id=enroll_email]").hide();
	}else{
		$("[id=text8]").hide();
		$("[id=enroll_email]").show();
	} 
}
$(function(){
	$('#cancel1').click(function(){
	    $("[id=text6]").hide();
	    $("[id=enroll_email]").show();
	});
	$('#cancel2').click(function(){
		$("[id=text7]").hide();
		$("[id=enroll_tell]").show();
	});
	$('#cancel3').click(function(){
		$("[id=text8]").hide();
	});
	$('#emailenroll').click(function(){
		var re =  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;   
		if(!re.test($("#email").val())){
			$("#emailCheck").html('이메일 형식이 잘못되었습니다.');
		}else{
			$("#emailCheck").html('올바른 이메일입니다!');
			$.post("editemail.do", {id: $('#id').text(), email: $("#email").val()})
			.done(function(data){
				alert('등록되었습니다!');
				$('#email').val('');
			});
		}
	});
	$('#phoneenroll').click(function(){
		$.post("editphone.do", {id: $('#id').text(), phone: $('#phone').val()})
		.done(function(data){
			alert('등록되었습니다!');
			$('#phone').val('');
		});
	});
	$('#addressenroll').click(function(){
		$.post("editaddress.do", {id: $('#id').text(), address: $('#address').val()})
		.done(function(data){
			alert('등록되었습니다!');
			$('#address').val('');
		});
	});
	$('#pwdCheckBtn').click(function(){
		$.post("pwdCheck.do", {pwd: $('#pwd1').val()})
		.done(function(data){
			$("#pwdResult2").text(data);
			
		});
	});
	$('#pwdenroll').click(function(){
		var num = $("#pwd2").val().search(/[0-9]/g);
		var eng = $("#pwd2").val().search(/[a-z]/ig);
		var spe = $("#pwd2").val().search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		if($("#pwd2").val().length <6 || $("#pwd2").val().length>16){
			$("#pwdCheck").css("color", "#FA5858"); 
			$("#pwdCheck").html('6~16자 영문 대소문자,숫자,특수문자를 사용하세요.');
			return false;
		}else if($("#pwd2").val().search(/₩s/) != -1){
			$("#pwdCheck").css("color", "#FA5858"); 
			$("#pwdCheck").html('비밀번호는 공백없이 입력해주세요');
			return false;
		}else if(num<0 || eng <0 || spe <0){
			$("#pwdCheck").css("color", "#FA5858"); 
			$("#pwdCheck").html('6~16자 영문 대소문자,숫자,특수문자를 사용하세요.');
			return false;
		}else if($("#pwd2").val() != $("#pwd").val() || $("#pwdCheck2").text() == "다시입력해주세요!"){
			$("#pwdCheck").css("color", "#FA5858"); 
			$("#pwdCheck").html('비밀번호를 다시 확인해주세요');
		}else if($("#pwd2").val() == $("#pwd").val() ){
			$.post("editpwd.do", {id: $('#id').text(), pwd: $('#pwd').val()})
			.done(function(data){
				alert('등록되었습니다!');
				$("[id=text3]").hide();
				$('#pwd').val('');
				$('#pwd1').val('');
				$('#pwd2').val('');
			});
		
		};
	});
});


</script>
</head>
<style>
.stheader>#subject{
	 text-align: center; 
}
.stheader>#subject2{
	 text-align: left; 
}
.stheader>#connection{
	 text-align: right; 
	 padding:20px;
	 text-decoration: underline;
}
.stheader{
	color: white;
	padding:20px;
	background: #24C6DC;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #514A9D, #24C6DC);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #514A9D, #24C6DC); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

}
.under{
  	padding:5px;
	text-indent: 10%;
	
} 
#text1, #text2, #text3, #text4, #text5, #text6, #text8{
	display:none;
	padding:25px;
}
</style>
<body>
<%@include file="../home/devnav.jsp"%>
<div id="contents">
	<div class="stheader">
		<div id="subject">
			<br>
			<h2><b>daeun lee님의 개인정보설정</b></h2>
		</div>
		<div id="connection">
			<h3>1촌 1명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
		</div>
		<div id="subject2">
			<table>
				<tr>
					<td rowspan="2"><img src="resources/img/me/profile.png" style="width:120px;height:120px;padding:15px"></td><td><h4>daeun lee님</h4></td>
				</tr>
				<tr>
					<td><h5><b id="id">id1</b></h5><br><h5>가입일 : 2018년 06월 20일</h5></td>
				</tr>
			</table>
		</div>
	</div>
	<div style="padding:40px">
		<table class="table table-hover">
  			<thead>
    			<tr>
	      			<th scope="col" style="padding:20px"><img src="resources/img/me/security.png" style="width:50px;height:50px;padding:5px">
	      			<b style="font-size:2em">로그인과 보안</b></th>
    			</tr>
  			</thead>
  			<tbody>
    			<tr>
      				<td scope="row" style="padding:20px">
      					<a href="javascript:a();" id="button1"><h4>이메일 주소</h4></a>	
      					<h6>계정에 이메일 주소를 등록하거나 삭제하세요.</h6>
      				</td>
      			</tr>
      			<thead>
      				<tr>
      					<th scope="col"id="text1">
      						<div class="under"><h5><b>등록된 이메일 주소:</b></h5></div>
      						<div class="under"><h5>lde3831112@gmail.com</h5></div>
      						<div class="under"><a href="javascript:f();" id="enroll_email" style="width:300px">이메일 주소 등록</a></div>
      						<div id="text6">
      						<div class="under" >이메일 주소</div>
 							<div class="under"><input type="text" style="width:300px;" id="email"> &nbsp;&nbsp;&nbsp;&nbsp;
 							<span style="color:#FA5858; text-indent:10px;"id="emailCheck"></span></div>
						    <div class="under"><button type="button" class="btn btn-outline-info" id="cancel1">취소</button> 
						    <button type="button" class="btn btn-info" id="emailenroll">확인</button>
						    </div>
							</div>

      					</th>
      				</tr>
      			</thead>
      			<tr>
      				<td scope="row" style="padding:20px">
      					<a href="javascript:b();" id="button2"><h4>전화번호</h4></a>
      					<h6>로그인 문제가 생길 때에 대비해서 전화번호를 등록하세요</h6>
      				</td>
      			</tr>
      			<thead>
      			<tr>
      				<th scope="col" id="text2">
      					<div class="under"><h5>등록하신 전화번호가 없습니다.</h5></div>
      					<div class="under"><h6>전화번호를 등록하시면 계정을 더욱 안전하게 보호하실 수 있습니다. 회원님의 전화번호를 아는 사람은 회원님을 쉽게 찾아 1촌을 맺을 수도 있습니다.</h6></div>
      					<div class="under"><a href="javascript:g();" id="enroll_tell">전화번호 등록</a></div>
      					<div id="text7">
      					<div class="under" >국가</div>
 							<div class="under"><input type="text" style="width:300px;" value="대한민국" readonly ></div><br>
 							<div class="under">전화번호</div>
 							<div class="under"><input type="text" style="width:300px;" id="phone"></div><br>
						    <div class="under"><button type="button" class="btn btn-outline-info" id="cancel2">취소</button> 
						    <button type="button" class="btn btn-info" id="phoneenroll">확인</button>
      						
						    </div>
							</div>
      				</th>
      			</tr>
      			</thead>
      			<tr>
      				<td style="padding:20px">
      					<a href="javascript:h();" id="button4"><h4>주소 수정</h4></a>
      				<h6>주소를 등록하여 더 편리한 devLink서비스를 즐겨보세요</h6>
      				</td>
      			</tr>
      			<thead>
      			<tr>
      				<th scope="col" id="text8">
      					<div class="under"><h5>등록하신 주소가 없습니다.</h5></div>
      					<div class="under"><h6>주소를 등록하시면 계정을 더욱 유용하게 서비스를 즐길 수 있습니다.</h6></div>
      					<div class="under" >국가</div>
 							<div class="under"><input type="text" style="width:300px;" value="대한민국" readonly ></div><br>
 							<div class="under" >주소</div>
 							<div class="under"><input type="text" style="width:300px;" id="address"></div><br>
						    <div class="under"><button type="button" class="btn btn-outline-info" id="cancel3">취소</button> 
						    <button type="button" class="btn btn-info" id="addressenroll">확인</button>
						    </div>
      				</th>
      			</tr>
      			</thead>
      			<tr>
      				<td style="padding:20px">
      					<a href="javascript:c();" id="button3"><h4>비밀변호 변경</h4></a>
      				<h6>보안수준이 높은 비밀번호를 만드세요.</h6>
      				</td>
      			</tr>
      			<thead>
      			<tr>
      				<th scope="col" id="text3">
      					<div class="under"><h5>다른 사람이 예상하기 어려운 비밀번호를 선택하세요.</h5></div>
      					<div class="under"><h6>현재 비밀번호를 입력하세요.</h6></div>
      					<div class="under">
  							<input type="password"style="width:300px; margin:10px; padding:3px" id="pwd1"><button type="button" class="btn btn-info disabled" id="pwdCheckBtn">확인</button>
  							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  							<span style="color:#FA5858;text-indent:20px;" id="pwdResult2">비밀번호를 확인해주세요</span></div>
  							
  						<div class="under"><h6>새 비밀번호를 입력하세요.</h6></div>
						<div class="under">
							<input type="password"style="width:300px; margin:10px; padding:3px" id="pwd2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#FA5858; text-indent:10px;"id="pwdCheck"></span></div>
						<div class="under"><h6>다시 입력</h6></div>
						<div class="under"><input type="password"style="width:300px; margin:10px; padding:3px" id="pwd"></div></div>
						<div  style="text-indent: 10%;">
    						<div>
      						  <input type="checkbox" style="text-indent: 10%;" checked="">모든 기기에서 새 비밀번호로 로그인
    						</div>
						</div>
						<br>
						<div class="under"style="text-indent:20%" ><button type="button" class="btn btn-outline-info" id="pwdenroll">저장</button>
						</div>
      				</th>
      			</tr>
      			</thead>
      			<tr>
      				<thead>
      	 				<th scope="col" style="padding:20px"><img src="resources/img/me/setting.png" style="width:50px;height:50px;padding:5px">
	      			<b style="font-size:2em">공개 범위</b></th>
      				</thead>
      			</tr>
    			<tr>
      				<td scope="row" style="padding:20px">
      					<a href="javascript:d();" id="button4"><h4>전화번호 공개범위</h4></a>
      				<h6>회원님의 전화번호를 볼 수 있는 사람을 선택하세요</h6>
      				</td>
      			</tr>
      			<thead>
      				<tr>
      					<th scope="col" id="text4">
      						<div class="under"><h5>프로필상에서 <b>010-2026-3831</b>의 공개 범위</h5></div>
							<div class="under">
      							<div class="form-group">
							    	<select class="custom-select" style="width:300px; padding:5px; margin:10px">
							      		<option selected="">비공개</option>
							      		<option value="1">1촌</option>
							      		<option value="1">회원누구나</option>
							    	</select>
							  	</div>
      						</div>
      						<div class="under" style="text-indent:20%"><button type="button" class="btn btn-outline-info">확인</button></div>
      					</th>
      				</tr>
      			</thead>
      			<tr>
      				<td style="padding:20px">
      					<a href="javascript:e();" id="button5"><h4>1촌 공개범위</h4></a>
      				<h6>1촌 목록을 누구에게 공개할지 선택하세요.</h6>
      				</td>
      			</tr>
      			<thead>
      				<tr>
      					<th scope="col" id="text5">
      						<div class="under"><h6>회원님의 보유 기술을 추천한 사람과 그 사람과의 공통 인맥은 전체 공개입니다.</h6></div>
      						<div class="under"><h6>(원하시면 회원님의 보유 기술을 추천한 사람들을 비공개로 두실 수 있습니다.) </h6></div> 
      						<div class="under"><input type="radio"style="margin:10px;">비공개</div>
							<div class="under"><input type="radio" style="margin:10px;">1촌</div>
							<div class="under" style="text-indent:20%"><button type="button" class="btn btn-outline-info">확인</button></div>
      					</th>
      				</tr>
      			</thead>
		</table>
	</div>

</div>
	<%@include file="../home/devfoot.jsp"%>
</body>
</html>