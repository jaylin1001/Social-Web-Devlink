<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<style>
#static1 {
	width: 250px;
	height: 60px;
	position: static;
	border: 1px solid #D8D8D8;
	background-image: url("resources/img/home/userbar.jpg");
}

#static2 {
	width: 250px;
	height: 150px;
	position: static;
	border: 1px solid #D8D8D8;
	padding: 30px;
}

#static3 {
	width: 250px;
	height: 100px;
	position: static;
	border: 1px solid #D8D8D8;
	padding: 20px;
	background-color: white;
	padding: 20px;
}

#static4 {
	width: 250px;
	height: 100px;
	background-color: #E8E8E8;
	border: 1px solid #D8D8D8;
	padding: 20px;
	position: static;
	background-color: #dcdcdc;
}

#userbar {
	position: fixed;
	margin-left: 100px;
	text-align: center;
	box-shadow: 2px 2px 2px 2px #888888;
	text-align: center;
}

#mainbar {
	margin-top:0px;
}

#summernote {
	position: relative;
	z-index: -999;
	overflow: hidden;
}

/* 코멘트 div css */
.comment_field {
	visibility: hidden;
	height:10px;
	background-color:#F9F9F9;
}


.dropbtn {
    background-color: white;
    color: black;
    font-size: 25px;
    border: none;
    cursor: pointer;
    margin-top: 2px;
}

.dropbtn:hover, .dropbtn:focus {
    background-color: #2980B9;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 160px;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {background-color: #ddd;}

.show {display: block;}


Button {
	background-color: #008CBA;
	border: white;
	color: white;
	size: 14px;
}
/* 에디터 css */
	.editor-preview h1,
	.editor-preview h2,
	.editor-preview h3,
	.editor-preview h4,
	.editor-preview h5{
		margin-bottom:10px;
	}
	
	.editor-preview h1{
		border-bottom:1px solid #ddd;
	}
	
	.editor-preview h1{
		border-bottom:1px solid #eee;
	}
/* 	코드에디터 css */
#editor {
       position: relative !important;
        border: 1px solid lightgray;
        margin: auto;
        height: 200px;
        width: 100%;
        font: monospace;
    }
    
.codefield {
	height: 10px;
	visibility: hidden;
}
 
#readeditor {
       position: relative !important;
        border: 1px solid lightgray;
        margin: auto;
        height: 200px;
        width: 100%;
    }
    
/* 	첨부파일 버튼 css */
.file_input_textbox {float:left; height:29px;}
	.file_input_div {position:relative; width:80px; height:36px; overflow:hidden; float:left;}
	#file_input_img_btn {padding:0 0 0 5px;}
	.file_input_hidden {font-size:29px; position:absolute; right:0px; top:0px; opacity:0; filter: alpha(opacity=0); -ms-filter: alpha(opacity=0); cursor:pointer;}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>DEVLINK HOME</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type='text/javascript' src="resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/home/home.css">
<script src="resources/js/home/home.js"></script>
<!-- 에디터 css js -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
<script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.12/js/all.js"
	integrity="sha384-Voup2lBiiyZYkRto2XWqbzxHXwzcm4A5RfdfG6466bu5LqjwwrjXCMBQBLMWh7qR"
	crossorigin="anonymous"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script>
$(function() {
	$('#schInputForm').css('float','right');
});
</script>
</head> 
<body>
	<%@include file="devnav.jsp"%>
	<div id=contents>
	  <div style="height:100%;width: 15%;float: left;display: inline-block;background-color:#F9F9F9">
				<div id=userbar>
				  <c:if test="${empty sessionScope.path }">
		           <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/home/default.png" style="border-color: #D8D8D8; border-radius: 50%; width: 70px; height: 70px; float: right; position: relative; left: -32%; margin: 10px"></a>
		          </c:if>
		          <c:if test="${not empty sessionScope.path }">
		           <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/profile/${sessionScope.path}" style="border-color: #D8D8D8; border-radius: 50%; width: 70px; height: 70px; float: right; position: relative; left: -32%; margin: 10px"></a>
		          </c:if>
		          <div id="static1"></div>
		          <div id="static2" style="background-color: white">
		           <a href="${pageContext.request.contextPath}/viewmyprofile.do" style="color:inherit;text-decoration: none;"><b style="font-size: 20px">${sessionScope.name}</b></a><br /> <a href="${pageContext.request.contextPath}/friendlist.do">친구 모두보기</a>
		          </div>
		          <div id="static3">
		            <h4 style="color: dodgerblue; font-size: 20px">친구 <span id="numberoffrd">${fn:length(frd)}</span>명</h4>
		            <h5 style="font-size: 15px">친구찾기</h5>
		          </div>
		          <div id="static4">
		            	유료회원으로 업그레이드
		          	 <p><a href="">프리미엄 업그레이드</a>
		          </div>
		        </div>
	  </div>
	  <div style="width:70%;display: inline-block;background-color:#F9F9F9">
			<div id=container>
<%-- 				<div id=userbar>
				  <c:if test="${empty sessionScope.path }">
		           <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/home/default.png" style="border-color: #D8D8D8; border-radius: 50%; width: 70px; height: 70px; float: right; position: relative; left: -32%; margin: 10px"></a>
		          </c:if>
		          <c:if test="${not empty sessionScope.path }">
		           <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/profile/${sessionScope.path}" style="border-color: #D8D8D8; border-radius: 50%; width: 70px; height: 70px; float: right; position: relative; left: -32%; margin: 10px"></a>
		          </c:if>
		          <div id="static1"></div>
		          <div id="static2" style="background-color: white">
		           <a href="${pageContext.request.contextPath}/viewmyprofile.do" style="color:inherit;text-decoration: none;"><b style="font-size: 20px">${sessionScope.name}</b></a><br /> <a href="${pageContext.request.contextPath}/friendlist.do">친구 모두보기</a>
		          </div>
		          <div id="static3">
		            <h4 style="color: dodgerblue; font-size: 20px">친구 <span id="numberoffrd">${fn:length(frd)}</span>명</h4>
		            <h5 style="font-size: 15px">친구찾기</h5>
		          </div>
		          <div id="static4">
		            	유료회원으로 업그레이드
		          	 <p><a href="">프리미엄 업그레이드</a>
		          </div>
		        </div> --%>
			<form action="${pageContext.request.contextPath}/docwrite.do" method = "post">
				<div id="mainbar" style="margin-left: 25%; margin-right: 15%; box-shadow: 2px 2px 2px 2px #888888">
					<div style="padding: 10px; border-bottom: 1px solid #D8D8D8">
					  <c:if test="${empty sessionScope.path }">
			           <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/home/default.png" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
			          <c:if test="${not empty sessionScope.path }">
			           <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/profile/${sessionScope.path}" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
					 <b style="font-size: 20px">&nbsp; &nbsp;${sessionScope.name}</b><br /><!-- 본인 이름 -->
					</div>
					<div class="mdfield" style="height: 200px; overflow: scroll; overflow-x: hidden;">
						 <textarea id="summernote" name="contents" style="position:apsolute;z-index:-999;"></textarea>
					</div>
					<div class=
					"codefield">
					<div id="editor"></div>
					<textarea name="editor" style="display: none;">
					</textarea>
				</div>	
					<div style="display: inline-block; border-top: 1px solid #D8D8D8; height: 50px; width: 100%; 
						padding-left: 15px; padding-top: 10px; vertical-align: center">
					<div>
 						<button type="submit" id = "submitbtn" style="float: right; margin-right:15px;
							border-radius: 5px; height: 30px; width: 70px;">올리기</button>
							<select name = "open_range" id ="open_range"style="float: right; margin-right:15px;
							border-radius: 5px; height: 30px; width: 100px;">
						 <option selected disabled>공개범위</option>
					 	 <option value="0">public</option>
					 	 <option value="1">private</option>
					 	 </select>
					 	 </div>
						<div id="codebtn"><i class="fas fa-code" 
							style="border: 1px solid gray; border-radius: 10px; height: 30px; width: 70px; padding: 5px"></i>
 						</div>
 					</div>
				</div>
				</form>
				<!--리스트뷰 -->
				<c:forEach var="hc" items="${hc}">
				<c:choose>
				<c:when test="${hc.doc_kind eq '0' }">
				<div><hr style="margin-left: 25%; margin-right: 15%; border: 2px solid #D8D8D8"></div>
				<div id="contentlist${hc.doc_num}"
					style="margin-left: 25%; margin-right: 15%; background-color: white; box-shadow: 2px 2px 2px 2px #888888">
					<div style="padding: 10px; border-bottom: 1px solid #D8D8D8">						
					  <c:if test="${hc.m_no eq sessionScope.no}">
					  <c:if test="${empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/home/default.png" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
			          <c:if test="${not empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/profile/${hc.path}" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
					</c:if>
					<c:if test="${hc.m_no ne sessionScope.no}">
					  <c:if test="${empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewotherprofile.do?no=${hc.m_no}"><img src="resources/img/home/default.png" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
			          <c:if test="${not empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewotherprofile.do?no=${hc.m_no}"><img src="resources/img/profile/${hc.path}" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
			       </c:if>					
					  <b style="font-size: 20px;">${hc.m_name}</b><br />
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${hc.date }						
					</div>
					
					<div id="content${hc.doc_num}" style="padding:20px;">${hc.contents}</div>
					<div style="display: inline-block; border-top: 1px solid #D8D8D8; height: 50px; 
					width: 100%; padding-left: 15px; padding-top: 10px; vertical-align: center">
						<button id="thumbup${hc.doc_num}" onclick="thumbup(${hc.doc_num})" style="background-color:white; visibility:visible;">
						<i class="far fa-thumbs-up" style="border-radius: 10px; height: 30px; width: 70px; padding: 5px"></i></button>
						<button id ="thumbup2${hc.doc_num}" style="visibility:hidden; background-color:white; width:0px">
						<i class="fas fa-thumbs-up" style="border-radius: 10px; height: 30px; width: 70px; padding: 5px"></i></button>
							<button style="color:black; background-color:white" onclick="add_comment_div(${hc.doc_num})" id="cmticon${hc.doc_num}">
						<i class="far fa-comment-dots" 
							style="border-radius: 10px; height: 30px; width: 70px; padding: 5px"></i>
							</button>
					</div>
						<form action="${pageContext.request.contextPath}/cmtwrite.do" method = "post">
					<div class="comment_field${hc.doc_num }" style="visibility: hidden; height:0px;background-color:#DCE3EC;">
					 <c:if test="${hc.m_no eq sessionScope.no}">
					  <c:if test="${empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/home/default.png" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
			          <c:if test="${not empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/profile/${hc.path}" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
					</c:if>
					<c:if test="${hc.m_no ne sessionScope.no}">
					  <c:if test="${empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewotherprofile.do?no=${hc.m_no}"><img src="resources/img/home/default.png" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
			          <c:if test="${not empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewotherprofile.do?no=${hc.m_no}"><img src="resources/img/profile/${hc.path}" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
			       </c:if>
					<input type="text" name="cmt" id="cmt" style="margin-top:5px;margin-left: 10px;width:78%; height:45px;">
					<button id="cmtbtn" type="submit" style="background-color:#DCE3EC;margin-left:7px;border-radius: 10px; height: 30px; width: 70px; padding: 5px">댓글달기</button>
					<input type="text" name="doc_num" value="${hc.doc_num}" style="visibility:hidden; height:0px">
					<div id="cmtdiv${hc.doc_num}" style="width:100%;background-color:#DCE3EC;padding:10px;">
					&nbsp; &nbsp;

					</div>
					
				</div>
				</form>
				</div>
				</c:when>
				<c:otherwise>
				<!--리스트뷰2 -->
				<div id="contentlist${hc.doc_num}"
					style="margin-left: 25%; margin-right: 15%; margin-top: 15px; background-color: white; box-shadow: 2px 2px 2px 2px #888888">
					<div style="padding: 10px; border-bottom: 1px solid #D8D8D8">
					  <c:if test="${hc.m_no eq sessionScope.no}">
					  <c:if test="${empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/home/default.png" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
			          <c:if test="${not empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/profile/${hc.path}" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
					</c:if>
					<c:if test="${hc.m_no ne sessionScope.no}">
					  <c:if test="${empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewotherprofile.do?no=${hc.m_no}"><img src="resources/img/home/default.png" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
			          <c:if test="${not empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewotherprofile.do?no=${hc.m_no}"><img src="resources/img/profile/${hc.path}" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
			       </c:if>
						<b style="font-size: 20px">${hc.m_name}</b><br />
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${hc.date}
						<!-- <i class="fas fa-align-justify" 
						style="float: right; border-radius: 10px; height: 30px; width: 70px; padding: 2px"></i><br /> -->
					</div>
					<div id="readeditor">${hc.contents}</div>
					<div style="display: inline-block; border-top: 1px solid #D8D8D8; height: 50px; 
					width: 100%; padding-left: 15px; padding-top: 10px; vertical-align: center">
						<button id="thumbup${hc.doc_num}" onclick="thumbup(${hc.doc_num})" style="background-color:white; visibility:visible;">
						<i class="far fa-thumbs-up" style="border-radius: 10px; height: 30px; width: 70px; padding: 5px"></i></button>
						<button id ="thumbup2${hc.doc_num}" style="visibility:hidden; background-color:white; width:0px">
						<i class="fas fa-thumbs-up" style="border-radius: 10px; height: 30px; width: 70px; padding: 5px"></i></button>
							<button style="color:black; background-color:white" onclick="add_comment_div(${hc.doc_num})" id="cmticon${hc.doc_num}">
						<i class="far fa-comment-dots" 
							style="border-radius: 10px; height: 30px; width: 70px; padding: 5px"></i>
							</button>
					</div>
					<form action="${pageContext.request.contextPath}/cmtwrite.do" method = "post">
					<div class="comment_field${hc.doc_num }" style="visibility: hidden; height:0px;background-color:#DCE3EC;">
					  <c:if test="${hc.m_no eq sessionScope.no}">
					  <c:if test="${empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/home/default.png" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
			          <c:if test="${not empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/profile/${hc.path}" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
					</c:if>
					<c:if test="${hc.m_no ne sessionScope.no}">
					  <c:if test="${empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewotherprofile.do?no=${hc.m_no}"><img src="resources/img/home/default.png" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
			          <c:if test="${not empty hc.path }">
			           <a href="${pageContext.request.contextPath}/viewotherprofile.do?no=${hc.m_no}"><img src="resources/img/profile/${hc.path}" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px"></a>
			          </c:if>
			       </c:if>
					<input type="text" name="cmt" id="cmt" style="margin-top:5px;margin-left: 10px;width:78%; height:45px;">
					<button id="cmtbtn" type="submit" style="background-color:#DCE3EC;margin-left:7px;border-radius: 10px; height: 30px; width: 70px; padding: 5px">댓글달기</button>
					<input type="text" name="doc_num" value="${hc.doc_num}" style="visibility:hidden; height:0px">
					<div id="cmtdiv${hc.doc_num}" style="width:100%;background-color:#DCE3EC;padding:10px;">
					&nbsp; &nbsp;

					</div>
					
				</div>
				</form>
				</div>
				</c:otherwise>
				</c:choose>
				</c:forEach>
		</div>
	</div>
	<div style="height: 100%;width: 15%;float: right;margin-top:1%display: inline-block;padding:5px;background-color:#F9F9F9">
		<a href="${pageContext.request.contextPath}/home.do" ><img src="resources/img/me/rightDev.png" style="max-width:100%;margin-bottom:6px;"></a>
		<hr>
		<div style="text-align:center">
			<a href="#">About</a>&ensp;<a href="${pageContext.request.contextPath}/helpcenter.do">Help Center</a>&ensp;<a href="${pageContext.request.contextPath}/settings.do">Privacy & Terms</a><br>
			<p style="color:#646464">KITRI Digital Convergence 25th<br><span class="badge badge-info">DevLink</span>&ensp;DevLink@2018</p>
		</div>
	</div>
	</div>
	<script>	
	
/* 	summernote */
	$(document).ready(function() {
		
		  $('#summernote').summernote({
		        placeholder: 'Hello Devlink',
		        tabsize: 2,
		        height: 200
		      });
		});
		
/* 		공개범위 alert */
	$( "#submitbtn" ).click(function() {
		if ($('#open_range option:selected').val() == '공개범위'){
			alert("공개범위를 설정해주세요");
		return false;	
		}
		});
	
	$("#cmtbtn").click(function() {
		if ($('input[name=cmt]').val() == 0){
			alert("공개범위를 설정해주세요");
		return false;	
		}
	});
	
/* 	코멘트 div 추가 */
	var cnt = 0;
	function add_comment_div(data) {
		var docnum = data;
		cnt++;
			if(cnt == 1){
				$('.comment_field'+docnum).css('visibility','visible');
				$('.comment_field'+docnum).css('height','auto');

				$.ajax({
					url : 'cmtwrite',
					method : 'POST',
					data : {
						doc_num : docnum
					},
					 success : function(data) {
						 console.log(data);
						 $('#cmtdiv'+docnum).html(data);
					} 
				});
			}else{
				$('.comment_field'+docnum).css('visibility','hidden');
				$('.comment_field'+docnum).css('height','10px');
				cnt = 0;
		}
}
	
	/* 	코드버튼 */
	$('#codebtn').click(function(){
		
		$('div').remove('.mdfield');
		$("#editor").clone().appendTo(".mdfield");
		$('.codefield').css('visibility','visible');
		$('.codefield').css('height','200px');
		$('.comment_field').css('height','100px');
		$.ajax({
			url : 'cmtwrite.do',
			method : 'POST',
			data : {
				doc_num : $('hc.doc_num'),
				cmt : $('#cmt').val()
			},
		});
	});
	
	function thumbup(data){
		console.log(data);
		$('#thumbup'+data).remove();
		$('#thumbup2'+data).css('visibility','visible');
		$('#thumbup2'+data).css('width','100px');
	}
	
</script>
<!-- 마크다운 에디터 js view -->

<!-- 코드에디터 js -->
	<script src="${pageContext.request.contextPath}/resources/js/ace.js" type="text/javascript" charset="utf-8"></script>
	<script>
	
	    var editor = ace.edit("editor");
	    var textarea = $('textarea[name="editor"]');
	    editor.setOptions({
        	fontSize: "13pt",
        });
	    editor.getSession().on("change", function () {
	        textarea.val(editor.getSession().getValue());
	    });
 	     
	    var readeditor = ace.edit("readeditor");
	    readeditor.setOptions({
        	readOnly: true,
        	fontFamily: "tahoma",
        	fontSize: "13pt"
        });
	    
	</script>
	<script src="${pageContext.request.contextPath}/resources/js/theme-twilight.js" type="text/javascript" charset="utf-8"></script>
<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>
<%@include file="./devfoot.jsp"%>
</body>
</html>