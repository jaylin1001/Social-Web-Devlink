<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<style>
.frdPic{
	border: 2px solid gray;
	border-radius: 50%;
	width: 50px;
	height: 50px;
	margin: 5px"
}
#static1 {
   width: 220px;
   height: 60px;
   position: static;
   border: 1px solid #D8D8D8;
   background-image: url("resources/img/home/userbar.jpg");
}

#static2 {
   width: 220px;
   height: 100px;
   position: static;
   border: 1px solid #D8D8D8;
   padding: 30px;
}

#static3 {
   width: 220px;
   height: 100px;
   position: static;
   border: 1px solid #D8D8D8;
   padding: 20px;
   background-color: white;
   padding: 20px;
}

#static4 {
   width: 220px;
   height: 100px;
   background-color: #E8E8E8;
   border: 1px solid #D8D8D8;
   padding: 20px;
   position: static;
   background-color: #dcdcdc;
}

#userbar {
   position: fixed;
   margin-left: 1%;
   margin-top: 1%;
   text-align: center;
   border-color: #888888;
   border-width: 1px;
   border-style: so
   /* box-shadow: 2px 2px 2px 2px #888888; */
}
#firstbar {
	/* text-align:center; */
	width:82%;
	background-color: white;
	margin-top:1%
}
#mainbar {
	width:82%;
	background-color: white;
	text-align:center;
}
table, th, td {
    border: 1px solid #bcbcbc;
    padding: 10px;
  }
  
table {
    width: 100%;
    height: 600px;
    text-align: center;
    table-layout:fixed;
  }
b {
   font-size: 20px;
}
Button {
   background-color: white;
   border: 1px solid #008CBA;
   color: #008CBA;   
}

/* Button:focus {
background-color: #3e8e41;
    box-shadow: 0 5px #666;
    transform: translateY(4px);
} */
button.selected{
        color:white;
        background-color:#008CBA;
}
button.isFrd{
        color:white;
        background-color:#FF9900;
}
button.isIng{
        color:white;
        background-color:#9900FF;
}

.frdDiv{
text-align:center;
width:33%;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>DEVLINK HOME</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type='text/javascript' src="resources/js/bootstrap.js"></script>
<script type='text/javascript' src="resources/js/devlink/network.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/home/home.css">
<script src="resources/js/home/home.js"></script>
<script src="resources/js/home/home.js"></script>
<script defer
   src="https://use.fontawesome.com/releases/v5.0.12/js/all.js"
   integrity="sha384-Voup2lBiiyZYkRto2XWqbzxHXwzcm4A5RfdfG6466bu5LqjwwrjXCMBQBLMWh7qR"
   crossorigin="anonymous"></script>
</head>
<body style="background-color:#F9F9F9">
<%@include file="../home/devnav.jsp"%>
<div id="contents">
	<div style="height:100%;width: 15%;float: left;display: inline-block;background-color:#F9F9F9">
		<div id=userbar>
			<c:if test="${empty sessionScope.path }">
           <img src="resources/img/home/default.png" style="border-color: #D8D8D8; border-radius: 50%; width: 70px; height: 70px; float: right; position: relative; left: -32%; margin: 10px">
           </c:if>
           <c:if test="${not empty sessionScope.path }">
            <img src="resources/img/profile/${sessionScope.path}" style="border-color: #D8D8D8; border-radius: 50%; width: 70px; height: 70px; float: right; position: relative; left: -32%; margin: 10px">
           </c:if>
           <div id="static1"></div>
           <div id="static2" style="background-color: white">
              <b style="font-size: 20px">${sessionScope.name}</b> <br /> <a href="${pageContext.request.contextPath}/friendlist.do">친구 모두보기</a>
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
		<div id=firstbar style="box-shadow: 2px 2px 2px 2px #888888;margin-left:13%;margin-right:5%;">
		
			<div style="padding: 10px; height: 100%; border-bottom: 1px solid #D8D8D8">
				<p style="font-size: 20px;text-align:center;"><b>보낸 친구신청</b></p><hr>
				<c:if test="${not empty frdfrom }">
					<c:forEach var="f" items="${frdfrom}" begin="0" end="${fn:length(frdfrom)}" step="1">
						<form class="card border-light mb-3 frdDiv" style="display:inline-block;">
						  <div class="card-body">
						  	<c:if test="${not empty f.path }">
							    <img class="frdPic" src="resources/img/profile/${f.path }"><br>
							</c:if>
							<c:if test="${empty f.path }">
							    <img class="frdPic" src="resources/img/home/default.png"><br>
							</c:if>
						    <b>${f.name }</b><br>
						    <div>
						    	<input type="hidden" value="${f.m_no}" name="no">
						    	<button type="submit" class="btn btn-secondary">취소</button>
						    </div>
						  </div>
						</form>
				    </c:forEach>
				</c:if>
				<br>
				<c:if test="${not empty frdfrom }">
					<a href="" style="font-size: 18px;text-align:center;">모두보기</a><br />
				</c:if>
			</div>
			
			<div style="padding: 10px; height: 100%; border-bottom: 1px solid #D8D8D8">
				<p style="font-size: 20px;text-align:center;"><b>받은 친구신청</b></p><hr>
				<c:if test="${not empty frdto }">
					<c:forEach var="f" items="${frdto}" begin="0" end="${fn:length(frdto)}" step="1">
						<form class="card border-light mb-3 frdDiv" style="display:inline-block;" id="frdto${f.m_no}">
						  <div class="card-body">
						    <c:if test="${not empty f.path }">
							    <img class="frdPic" src="resources/img/profile/${f.path }"><br>
							</c:if>
							<c:if test="${empty f.path }">
							    <img class="frdPic" src="resources/img/home/default.png"><br>
							</c:if>
						    <b>${f.name }</b><br>
						    <input type="hidden" value="${f.m_no}" name="no">
						    <button type="button" class="btn btn-info" onclick="frdtoOk(${f.m_no})">수락</button>
						    <button type="submit" class="btn btn-warning">거절</button>
						  </div>
						</form>
				    </c:forEach>
				</c:if>
				<br>
				<c:if test="${not empty frdto }">
					<a href="" style="font-size: 18px;text-align:center;">모두보기</a><br />
				</c:if>
			</div>
			<div style="padding: 10px; height: 100%; border-bottom: 1px solid #D8D8D8">
				<p style="font-size: 20px;text-align:center;"><b>아는사람 찾기</b></p><hr>
				<c:if test="${not empty frdp }">
					<c:forEach var="f" items="${frdp}" begin="0" end="${fn:length(frdp)}" step="1">
						<div class="card border-light mb-3 frdDiv" style="display:inline-block;">
						  <div class="card-body">
						    <c:if test="${not empty f.path }">
							    <img class="frdPic" src="resources/img/profile/${f.path }"><br>
							</c:if>
							<c:if test="${empty f.path }">
							    <img class="frdPic" src="resources/img/home/default.png"><br>
							</c:if>
						    <b>${f.name }</b><br>
						    <input type="hidden" id="addReq${f.m_no}">
							<button class ="requestFrd" id="addBtn${f.m_no}" onclick="addFrd(${f.m_no})">친구신청</button>
						  </div>
						</div>
				    </c:forEach>
				</c:if>
				<%-- <c:if test="${not empty frdAll }">
					<c:forEach var="f" items="${frdAll}" begin="0" end="${fn:length(frdAll)}" step="1">
						<div class="card border-light mb-3 frdDiv" style="display:inline-block;">
						  <div class="card-body">
						    <c:if test="${not empty f.path }">
							    <img class="frdPic" src="resources/img/profile/${f.path }"><br>
							</c:if>
							<c:if test="${empty f.path }">
							    <img class="frdPic" src="resources/img/home/default.png"><br>
							</c:if>
						    <b>${f.name }</b><br>
						    <input type="hidden" id="addReq${f.m_no}">
							<button class ="requestFrd" id="addBtn${f.m_no}" onclick="addFrd(${f.m_no})">친구신청</button>
						  </div>
						</div>
				    </c:forEach>
				</c:if> --%>
				<br>
				<c:if test="${not empty frdto }">
					<a href="" style="font-size: 18px;text-align:center;">모두보기</a><br />
				</c:if>
			</div>
		</div>
		<br>
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
</body>
</html>