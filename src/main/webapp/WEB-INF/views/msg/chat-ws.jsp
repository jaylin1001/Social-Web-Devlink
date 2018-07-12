<%@ page contentType="text/html; charset=UTF-8" 
trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>채팅</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type='text/javascript' src="../resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.css">
<link rel="stylesheet" href="../resources/css/home/home.css">
<script src="../resources/js/home/home.js"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.12/js/all.js"
	integrity="sha384-Voup2lBiiyZYkRto2XWqbzxHXwzcm4A5RfdfG6466bu5LqjwwrjXCMBQBLMWh7qR"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="../resources/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
var id=${frdlist[0].frd_no};
var my_id ='${sessionScope.no }';
if(my_id < id){
	 var idarea = my_id+id+'area';
}else{
	 var idarea = id+my_id+'area';
}
var nickname= '${sessionScope.name}';

$(document).ready(function() {
	console.log("로그인 한 사람 번호 : " + my_id);
	console.log("첫화면 idarea : " + idarea);
	//$('#'+idarea).scrollTop($('#'+idarea)[0].scrollHeight);
	$('#area').attr('id', idarea);
	$('#message').keypress(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.which);
		if(keycode == '13'){
			send();	
		}
		event.stopPropagation();
	});
	$('#sendBtn').click(function() { send(); });
	connect();
	/* $(document).on('click', '.tr', function() {
		 alert('Test');
	}); */
	$('tr').click(function(){
		$('#'+idarea).empty();
		var preidarea = idarea;
		id = $(this).attr("id");
		console.log("클릭된 id : " + id);
		
		if(my_id < id){
			idarea = my_id+id+'area';
			//$('#'+preid+'area').attr('id', my_id+id+'area');
			$('#'+preidarea).attr('id', idarea);
		}else{
			idarea = id+my_id+'area';
			//$('#'+preid+'area').attr('id', id+my_id+'area');
			$('#'+preidarea).attr('id', idarea);
		}
		console.log("변경된 idarea : " + idarea);
		console.log($(this).find('b').text());
		//idarea = '#'+id+'area';
		$('#frd_name').text($(this).find('b').text());
		$(this).css({background :'rgba(0, 0, 0, 0.075)',
				color: 'green'});
		$(this).siblings('tr').css({background :'rgba(0, 0, 0, 0)',
			color: 'black'});
		$.post('/devlink/msg/msgList.do', {
			from_id : my_id,
			to_id : id
		}).done(function(data){
			console.log("data : " +data);
			$('#'+idarea).html(data);
		});
	});
});
	
	var wsocket;
	function connect() {
		wsocket = new WebSocket("ws://192.168.12.11:8080/devlink/chat-ws");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function disconnect() {
		wsocket.close();
	}
	function onOpen(evt) {
		notify("연결되었습니다.");
	}
	function onMessage(evt) {
		var data = evt.data;
		console.log("idarea : " + data.substring(7, 7+idarea.length));
		if(data.substring(7, 7+idarea.length)==idarea  ){
			console.log(data.substring(7+idarea.length));
			data = data.substring(7+idarea.length);
			console.log("onMessage 2차 data : "+data);
			console.log("my_id.length : "+my_id.length);
			console.log("data.substring(5, my_id.length) : "+ data.substring(5, my_id.length));
			if(data.substring(5, 5+my_id.length)==my_id){
				data=data.substring(5+my_id.length);
				if (data.substring(0, 4) == "msg:") {
					appendMessageME(data.substring(4));
					//내가 보냈을 때 실시간으로 확인하기
				}	
			}else{
				data=data.substring(5+my_id.length);
				if (data.substring(0, 4) == "msg:") {
					appendMessage(data.substring(4));
					//상대방이 보냈을 때 실시간으로 확인하기
				}
			}
		}
	}
	function onClose(evt) {
		notify("연결을 끊었습니다.");
	}
	
	function send() {
		//var nickname = $("#nickname").val();
		
		var msg = $("#message").val();
		console.log("from_id : " + my_id);
		wsocket.send("idarea:" +idarea+ "from:"+my_id+"msg:" + msg);
		console.log("from_id : " + my_id);
		$.post('/devlink/msg/send.do', {
			from_id : my_id,
			to_id : id,
			msg : msg
		}).done();
		$("#message").val("");
	}

	function notify(msg){
		$('#'+idarea).append('<div style="width:60%;float:left"><p class="card-text" style="padding:4%">----- '+msg+' -----</p></div><br>');
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $('#'+idarea).height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);
	}
	
	function appendMessage(msg) {

		$('#'+idarea).append('<div class="card border-info mb-3" style="width:60%;float:left"><p class="card-text" style="padding:4%">'+msg+'</p></div><br>');
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $('#'+idarea).height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);
	}
	
	function appendMessageME(msg) {

		$('#'+idarea).append('<div class="card text-white bg-info mb-3" style="width:60%;  float:right"><p class="card-text" style="padding:4%">'+msg+'</p></div>');
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $('#'+idarea).height() - chatAreaHeight;
		console.log("chatArea 높이 : " + chatAreaHeight); //468
		console.log("#idarea 높이 : "+$('#'+idarea).height()); //374
		console.log("maxScorll : "+ maxScroll); //-94
		$("#chatArea").scrollTop(10000);
	}
	


</script>
<style>
#chatArea {
	width: 300px; height: 500px; overflow-y: auto; border:1px solid #D8D8D8; 
}
a{
	text-decoration: none;
	color: black;
}
tr:hover {
	text-decoration: none;
	color: green;
}
tr:first-child {
    background :rgba(0, 0, 0, 0.075);
	color: green;
}

</style>
</head>
<body>
<%@include file="../home/devnav.jsp"%>
	<div id="contents">
	<section style="margin:10px; padding:50px ">
		<div style="height:700px; width: 350px; border:1px solid #D8D8D8; float:left">
			<div style="margin:10px; padding:10px">
				<h4>메일</h4>
				   <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="메일 검색">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      <br><br><br>	
      <table class="table table-hover">
      <c:choose>
      <c:when test="${not empty frdlist}">
 	    <c:forEach var="item" items="${frdlist}" >
         <tr id="${item.frd_no }" style="cursor: pointer;">
      		<td scope="row" >
      		<!-- <a href="#"> -->
	      		<h5><b>${item.frd_name }</b></h5><br>
	      		<!-- <span>07월 12일</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  -->
      		<!-- </a> -->
      		</span></td>
    	</tr> 
	    </c:forEach>
      </c:when>
      </c:choose>
      </table>
    </form>
	</div>
		</div>
		<div style="height:700px; width: 500px;  border-top: 1px solid #D8D8D8; border-right:1px solid #D8D8D8; border-bottom: 1px solid #D8D8D8; display:inline; float:left">
			<div style="margin:10px; padding:10px">
				
 				<h5 id="frd_name">${frdlist[0].frd_name}</h5> 
				<hr>
			</div>
			<div style="width:440px; height:470px; margin:auto" id="chatArea">
			<div id="area">	
			<br>
				<c:forEach var="item" items="${msgList }">
					<c:choose>
						<c:when test="${item.msg_from eq sessionScope.no }">
							<div class="card text-white bg-info mb-3" style="width:60%;  float:right">
    								<p class="card-text" style="padding:4%">${item.msg }</p>
							</div>
						</c:when>
						<c:otherwise>
							<div class="card border-info mb-3" style="width:60%;float:left">
    								<p class="card-text" style="padding:4%">${item.msg }</p>	
							</div>
						</c:otherwise>							
					</c:choose>
				</c:forEach>
			</div>
			</div>
			<div style="float:center">
				<div class="form-group" style="width:440px;  margin:auto; float:center">
      			<textarea class="form-control" rows="2" id="message"></textarea>
      			<button type="button" id="sendBtn" style="width:100px; height:42px; margin:15px; " class="btn btn-primary btn-sm">전송</button>
    			</div>
		</div>
    <br/>
    <!-- <input type="text" id="message"> -->
    <!-- <input type="button" id="sendBtn" value="전송"> -->
	</div>
	</section>
	</div>
	<%@include file="../home/devfoot.jsp"%>
</body>
</html>