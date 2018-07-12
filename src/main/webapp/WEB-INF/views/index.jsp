<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Welcome to Mint-Office</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="resources/js/devlink/sha256.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(function(){
   var $idObj = $('#loginidinput'); //type속성이 text인 input객체를 dom트리에서 찾기
   var itemValue = localStorage.getItem('id');
/*    var $chkObj = $('input[type=checkbox]'); */
   $idObj.val(itemValue);
   
   <%-- 
   $('form').submit(function(){
      /* var idValue = $idObj.val();
      //chkObj가 체크된 경우에는
      if($chkObj.prop('checked')){
        localStorage.setItem('id', idValue);      
      }else{//chkObj가 체크안된 경우에는
        localStorage.removeItem('id');
      } */
      $.ajax({
         data:$('form').serialize(),
         method:'POST',
         url: 'login.do',
         success: function(data){
            //$('section').html(data);            
            data = data.trim();
            if(data == '1'){
               //$('section').html('로그인 성공');
               //location.href="index.jsp";
               location.href="<%=request.getContextPath()%>";
               $('#loginWarining').css('display','none');
               location.href="home.jsp";
            }else{
               $('#loginWarining').css('display','initial');
            }
         }
      });
      return false; //기본이벤트처리 막기
   }); --%>
   
   $('.warningx').on('click',function(){
      $('#loginWarining').css('display','none');
   });
   
});

function login(){
   console.log('login()');
   var remember=document.getElementById('remember');
   if(remember.checked==true){
        localStorage.setItem('id', $('input[type=text]').val());      
   }else{
        localStorage.removeItem('id');      
   }
   $('#shapwd').val(SHA256($('#originpwd').val()));
   document.getElementById("loginForm").submit();
   $('#shapwd').val('');
}
</script>   
   
   
<style>

.modal-backdrop
{
    opacity:0.5 !important;
    z-index:0;
}
/** TIPS: 
1. The carousel shouldn't be in any other div, like for example div with class container. 
2. You can align image position in classes bg1, bg2, bg3 using css background-position.
*/

/* Carousel 100% Fullscreen */
html, body {
   height: 100%;
   margin: 0;
   padding: 0;
}

.carousel, .item, .active {
   height: 100%;
}

.carousel-inner {
   height: 100%;
}

.carousel-caption {
   z-index: 0;
   top: 40%;
}

.carousel .item {
   background-color: #777;
}

.carousel .carousel-inner .bg {
   background-repeat: no-repeat;
   background-size: cover;
}

.carousel .carousel-inner .bg1 {
   background-image: url('resources/img/index/login0.png');
   background-position: center top;
}

.carousel .carousel-inner .bg2 {
   background-image: url('resources/img/index/login1.png');
   background-position: center center;
}

.carousel .carousel-inner .bg3 {
   background-image: url('resources/img/index/login2.jpeg');
   background-position: center bottom;
}

.carousel .carousel-inner .bg4 {
   background-image: url('resources/img/index/login3.jpg');
   background-position: center bottom;
}

.carousel .carousel-inner .bg5 {
   background-image: url('resources/img/index/login4.jpg');
   background-position: center bottom;
}



/* modal start */
/* Full-width input fields */
input[type=text], input[type=password] {
   width: 100%;
   padding: 12px 20px;
   margin: 8px 0;
   display: inline-block;
   border: 1px solid #ccc;
   box-sizing: border-box;
}

/* Set a style for all buttons */
button {
   background-color: #4CAF50;
   color: white;
   padding: 14px 20px;
   margin: 8px 0;
   border: none;
   cursor: pointer;
   width: 100%;
}

button:hover {
   opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
   width: auto;
   padding: 10px 18px;
   background-color: #f44336;
}
/* Center the image and position the close button */
.imgcontainer {
   text-align: center;
   margin: 24px 0 12px 0;
   position: relative;
}

img.avatar {
   width: 60%;
}

#id01>.modal-content>div.container {
   padding: 16px;
   width: 100%;
}

span.psw {
   float: right;
   padding-top: 16px;
}

/* The Modal (background) */
.modal {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0, 0, 0); /* Fallback color */
   background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
   padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
   background-color: #fefefe;
   margin: 5% auto 15% auto;
   /* 5% from the top, 15% from the bottom and centered */
   border: 1px solid #888;
   width: 40%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
   position: absolute;
   right: 25px;
   top: 0;
   color: #000;
   font-size: 35px;
   font-weight: bold;
}

.close:hover, .close:focus {
   color: red;
   cursor: pointer;
}

/* Add Zoom Animation */
.animate {
   -webkit-animation: animatezoom 0.6s;
   animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
   from {-webkit-transform: scale(0)
}

to {
   -webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
   from {transform: scale(0)
}

to {
   transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
   span.psw {
      display: block;
      float: none;
   }
   .cancelbtn {
      width: 100%;
   }
}

/* 다은 */

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
   width:300px;
   hegiht:70px;
   border: 1px solid #E6E6E6; 
   padding:10px;
}
</style>
</head>
<body>
   <c:if test="${!empty sessionScope.loginInfo}">
      <script>
         location.href="home.jsp";
      </script>
   </c:if>
   <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="1"></li>
         <li data-target="#myCarousel" data-slide-to="2"></li>
         <li data-target="#myCarousel" data-slide-to="3"></li>
         <li data-target="#myCarousel" data-slide-to="4"></li>
      </ol>
      <div class="carousel-inner">
         <div class="item bg bg1 active"></div>
         <div class="item bg bg2"></div>
         <div class="item bg bg3"></div>
         <div class="item bg bg4"></div>
         <div class="item bg bg5"></div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span
         class="glyphicon glyphicon-chevron-left"></span></a> <a
         class="right carousel-control" href="#myCarousel" data-slide="next"><span
         class="glyphicon glyphicon-chevron-right"></span></a>
   </div>
   <div class="container" id="back-text">
      <div class="carousel-caption">
         <h1>DevLink for all developers!</h1>
         <p>
            DevLink is a social network Service which gives you Simple, Fast, Effective
            way of improving your career.<br> Reducing wasted time for finding job and let's make connections with great mates.
         </p>
         <p>
            <a class="btn btn-lg btn-primary" href="#" role="button"
               onclick="document.getElementById('id01').style.display='block'">Login</a>
         </p>
         <p>
            <a class="btn btn-lg btn-warning" href="#" role="button"
               onclick="javascript:openjoin();">Join&nbsp;</a>
         </p>
      </div>
   </div>
</body>

<div id="id01" class="modal">
   <form class="modal-content animate" action="${pageContext.request.contextPath }/login.do" id="loginForm" method="post">
      <div class="imgcontainer">
         <span onclick="document.getElementById('id01').style.display='none'"
            class="close warningx" title="Close Modal">&times;</span> <img
            src="resources/img/index/logo.png" alt="Avatar" class="avatar">
      </div>
      <div class="container">
         <div style="text-align:center;display:none;" id="loginWarining">
            <label><b style="color:red;">LOGIN FAILED</b></label><br>
         </div>
         <label for="uname"><b>Username</b></label>
         <input type="text" placeholder="Enter Username" name="id" id="loginidinput"required>
         <label for="psw"><b>Password</b></label>
         <input type="password" placeholder="Enter Password" id="originpwd"required><!-- name="pwd" -->
         <input type="hidden" name="pwd" id="shapwd">
         <button class="btn btn-primary" type="button" onclick="login()">Login</button>
         <label> <input type="checkbox" checked="checked" id="remember"> Remember me</label>
      </div>
      
      <div class="container" style="background-color: #f1f1f1">
         <button type="button"
            onclick="document.getElementById('id01').style.display='none'"
            class="cancelbtn warningx">Cancel</button>
         <span class="psw">Forgot <a href="#">password?</a></span>
      </div>
   </form>
</div>


<div class="modal" id="joinmodal">
  <div class="modal-dialog" role="document"style="width:800px">
    <div class="modal-content"style="width:800px">
      <div class="modal-body" style="width:800px">
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
         <div>
            <table style="width:100%; float:center; margin-left:auto; margin-right:auto ">
                  <tr>
                     <td class="td">
                        <h5 style="text-indent:10px;"><b>*아이디</b></h5>
                     </td>
                     <td class="tr">
                     <input type="text" class="join_text" id="id" name="id" placeholder="아이디는 숫자, 대소문자만 입력가능합니다." style="width:400px">
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                       <button type="button" class="btn btn-outline-info" style="width:110px;padding:10px" id="idCheck">중복확인</button>

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
                     <input type="password" class="join_text" id="pwd" placeholder="6~16자 영문 대소문자,숫자,특수문자를 사용하세요." style="width:400px">
                     <input type="hidden" class="join_text" id="joinshapwd" name="pwd">
                     <br>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <span style="color:#FA5858;text-indent:10px;" id="pwdResult" style="width:400px"></span>
                     </div>
                     </td>
                  </tr>
                  <tr>
                     <td class="td">
                        <h5 style="text-indent:10px;"><b>*비밀번호 확인</b></h5>
                     </td>
                     <td class="tr">
                        <div class="form-group">
                        <input type="password" class="join_text" id="pwd2" style="width:400px">
                        <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                           <span style="color:#FA5858;text-indent:10px;" id="pwdResult2" style="width:400px"></span>
                     </div>
                     </td>
                  </tr>
                  <tr>
                     <td class="td">
                        <h5 style="text-indent:10px;"><b>*이름</b></h5>
                     </td>
                     <td class="tr">
                        <div class="form-group">
                        <input type="text" class="join_text" id="name" name="name" style="width:400px">
                        <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                           <span style="color:#FA5858;text-indent:10px;" id="nameResult" style="width:400px"></span>
                     </div>
                     </td>
                  </tr>
                  <tr>
                     <td class="td">
                        <h5 style="text-indent:10px;"><b> *본인 확인 이메일</b></h5>
                     </td>
                     <td class="tr">
                        <div class="form-group">
                        <input type="text" id="email" name="email" style="width:400px">
                        <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                           <span style="color:#FA5858;text-indent:10px;" id="emailResult" style="width:400px"></span>
                     </div>
                     </td>
                  </tr>
                  <tr>
                     <td class="td">
                        <h5 style="text-indent:10px;"><b>*휴대전화</b></h5>
                     </td>
                     <td class="tr">
                        <div class="form-group">
                     <input type="text" class="join_text" id="phone" name="phone" style="width:400px">
                     <br>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <span style="color:#FA5858;text-indent:10px;" id="phoneResult"></span>
                     </div>
                     </td>
                  </tr>
               </table>

          </div>
         <div style="clear:both;text-align:center">
             <button type="button" class="btn btn-outline-info"  style="height:60px;width:150px; margin:30px; padding:10px;text-align:center;" id="join">가입하기</button>
             <button type="button" class="btn btn-outline-secondary" style="height:60px;width:150px; margin:30px; padding:10px; text-align:center;">취소</button>
         </div>   
         </form>
      </div>
    </div>
  </div>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
   if (event.target == modal) {
      modal.style.display = "none";
   }
}
function openjoin(){
   $('#joinmodal').modal();
}
/* 다은 */
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
         if($("#idResult").text().trim() == "사용가능" && $("#pwdResult2").text() == "비밀번호가 일치합니다." && $("#emailResult").text().trim() == "올바른 이메일입니다!" ){
            $('#joinshapwd').val(SHA256($('#pwd').val()));
        	$("form").submit();
            $("form").reset();
        	$('#joinshapwd').val('');
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
</html>