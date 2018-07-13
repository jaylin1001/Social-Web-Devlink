<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>DevLink - view my profile</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type='text/javascript' src="resources/js/bootstrap.js"></script>
<script type='text/javascript' src="resources/js/devlink/myprofile.js"></script>
<script type='text/javascript' src="resources/js/httpRequest.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/home/home.css">
<script src="resources/js/home/home.js"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.12/js/all.js"
	integrity="sha384-Voup2lBiiyZYkRto2XWqbzxHXwzcm4A5RfdfG6466bu5LqjwwrjXCMBQBLMWh7qR"
	crossorigin="anonymous"></script>

<style>
.accInline{
display:inline;
}

.modal-backdrop
{
    opacity:0.5 !important;
    z-index:0;
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
#userbar table, th, td {
    border: 1px solid #bcbcbc;
    padding: 10px;
  }
  
#userbar table {
    width: 100%;
    height: 600px;
    text-align: center;
    table-layout:fixed;
  }
#userbar b {
   font-size: 20px;
}
</style>
<script>
</script>
</head>
<body style="background-color:#F9F9F9">
	<%@include file="../home/devnav.jsp"%>
	<div id="contents" style="text-align:center;">
		<div style="height:100%;width: 19%;float: left;display: inline-block;background-color:#F9F9F9">
			<div id=userbar>
				<c:if test="${empty sessionScope.path }">
	           <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/home/default.png" style="border-color: #D8D8D8; border-radius: 50%; width: 70px; height: 70px; float: right; position: relative; left: -32%; margin: 10px"></a>
	           </c:if>
	           <c:if test="${not empty sessionScope.path }">
	            <a href="${pageContext.request.contextPath}/viewmyprofile.do"><img src="resources/img/profile/${m.path}" style="border-color: #D8D8D8; border-radius: 50%; width: 70px; height: 70px; float: right; position: relative; left: -32%; margin: 10px"></a>
	           </c:if>
	           <div id="static1"></div>
	           <div id="static2" style="background-color: white">
	              <a href="${pageContext.request.contextPath}/viewmyprofile.do" style="color:inherit;text-decoration: none;"><b style="font-size: 20px">${sessionScope.name}</b></a><br /> <a href="${pageContext.request.contextPath}/network.do">친구관리</a>
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
		<div style="width:66%;float:none;display: inline-block;background-color:#F9F9F9">
			<div class="card border-light" style="width:100%;">
			<div class="card-header" style="padding:0px;border: none;"><img src="resources/img/me/profileback4.png" style="border: none;width:100%;"></div>
			    <div class="card border-light">
				  <div class="card-header">Edit intro</div>
				    <table style="width:100%">
				    	<tr>
				    		<td>
				    		<c:if test="${empty m.path}"><img src="resources/img/me/default.png" style="float:left;;max-height:190px"></c:if>
				    		<c:if test="${not empty m.path}"><img src="resources/img/profile/${m.path}" style="float:left;max-height:190px"></c:if>
				    		</td>
				    		<td colspan="2">
								  <div class="card-body">
							    	<h4 class="card-title" style="padding-top: 10px;"><span id="introname">${m.name}</span>&ensp;<a href="javascript:openEditIntroModal();"><i class="fas fa-edit"></i></a></h4>
					    			<p class="card-text"><span id="introhl">${m.headline}</span></p>
					    			<p class="card-text" style="color:#707070"><span id="introadd">${m.address }</span></p>
					    			<p class="card-text" style="color:#707070"><span id="introemail">${m.email }</span></p>
					    			<form action="${pageContext.request.contextPath }/proform.do" method="post" enctype="multipart/form-data">
										<div class="form-group">
										    <div class="input-group mb-3">
										      <div class="custom-file">
												<input type="file" class="custom-file-input" id="proPic" name="file" accept="image/*" required>
										        <label class="custom-file-label" for="inputGroupFile02" id="picLabel">Choose profile image</label>
										      </div>
										      <div class="input-group-append">												
        										<button type="submit"class="input-group-text">Upload</button>
										      </div>
										    </div>
										 </div>
									</form>
								 </div>
				    		</td>
				    		<td>
				    		  <ul class="list-group list-group-flush">
								<c:if test="${not empty edu }">
									<c:forEach var="e" items="${edu}" begin="0" end="1" step="1">
									    <!-- <li class="list-group-item"><i class="fas fa-graduation-cap"></i>&emsp;Young-dongil HighSchool</li> -->
									    <li class="list-group-item"><i class="fas fa-university"></i>&emsp;${e.title }</li>
								    </c:forEach>
								</c:if>
							    <li class="list-group-item"><a href="${pageContext.request.contextPath}/network.do"><i class="fas fa-address-book"></i>&emsp;See contact info</a></li>
							    <li class="list-group-item"><a href="${pageContext.request.contextPath}/friendlist.do"><i class="fas fa-users"></i>&emsp;See connections (${fn:length(frd)})</a></li>
							  </ul>
				    		</td>
				    	</tr>
				    </table>
				</div>
			</div>
			<br>
			<div class="card border-light mb-3" style="width:100%">
			  <div class="card-body">
			    <h5 class="card-text">Profile Strength</h5>
			    <span id="proBarP">${st}%</span>
					<div class="progress">
						<div id="proBar" class="progress-bar progress-bar-striped progress-bar-animated${color}" role="progressbar" style="width:${st }%;" aria-valuenow="${st }" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
			  </div>
			</div>
			<!-- <div class="card border-light mb-3" style="width:100%;display: inline-block;">
			  <div class="card-header">Dashboard</div>
			  <div class="card-body" style="display:inline-block;width:33%">
			    <h5 class="card-title"><a href="#">5</a></h5>
			    <p class="card-text">Who viewed your profile</p>
			  </div>
			  <div class="card-body"style="display:inline-block;width:33%">
			    <h5 class="card-title"><a href="#">11</a></h5>
			    <p class="card-text">Article views</p>
			  </div>
			  <div class="card-body"style="display:inline-block;width:33%">
			    <h5 class="card-title"><a href="#">2</a></h5>
			    <p class="card-text">Search Appearance</p>
			  </div>
			</div> -->
			<div class="card border-light mb-3" style="width:100%;display: inline-block;">
			  <div class="card-header">Experience&ensp;&ensp;<a href="javascript:openAddExpModal();"><i class="fas fa-plus"></i></a></div>
			  <div class="card-body"style="text-align:left;">
				<div id="expDiv">
					<c:if test="${not empty exp }">
						<c:forEach var="e" items="${exp }">
							    <h5 class="card-title"><b>${e.title }</b>&ensp;<a href="#"><i class="fas fa-edit"></i></a>&ensp;<a href="${pageContext.request.contextPath}/delpro.do?no=${e.no}"><i class="fas fa-times"></i></a></h5>
							    <p>
							    Company Name : ${e.group }<br>
							    Date Employed : ${e.start }<c:if test ="${not empty e.end }">&nbsp;– ${e.end }</c:if><br>
							    <c:if test ="${not empty e.duration }">Employment Duration : ${e.duration } days<br></c:if>
							    Location : ${e.place }<br>
							    Contents : ${e.contents }<br>
							    </p>
						    <br>
						</c:forEach>
				    </c:if>
				</div>
			  </div>
			</div>
			<div class="card border-light mb-3" style="width:100%;display: inline-block;">
			  <div class="card-header">Education&ensp;&ensp;<a href="javascript:openAddEduModal();"><i class="fas fa-plus"></i></a></div>
			  <div class="card-body"style="text-align:left;">
				<div id="eduDiv">
				<c:if test="${not empty edu }">
					<c:forEach var="e" items="${edu }">
						    <h5 class="card-title"><b>${e.title }</b>&ensp;<a href="#"><i class="fas fa-edit"></i></a>&ensp;<a href="${pageContext.request.contextPath}/delpro.do?no=${e.no}"><i class="fas fa-times"></i></a></h5>
						    <p>
								${e.degree }'s Degree, ${e.contents }<br>
								${e.start }<c:if test ="${not empty e.end }">&nbsp;– ${e.end }</c:if><br>
						    </p>
					    <br>
					</c:forEach>
				</c:if>
				</div>
			  </div>
			</div>
			
			<div class="card border-light mb-3" style="width:100%;display: inline-block;">
			  <div class="card-header">Skills&ensp;&ensp;<a href="javascript:openAddSkillModal();"><i class="fas fa-plus"></i></a></div>
			  <div class="card-body"style="text-align:left;">
				<div id="skillDiv">
					<c:if test="${not empty skill }">
						<c:forEach var="s" items="${skill }">
					    	<h6 class="card-title"><b>${s.title } - ${s.level }</b>&ensp;<a href="${pageContext.request.contextPath}/delpro.do?no=${s.no}"><i class="fas fa-times"></i></a></h6>
						</c:forEach>
					</c:if>
				</div>
			  </div>
			</div>
			
			<div class="card border-light mb-3" style="width:100%;display: inline-block;">
			  <div class="card-header">Accomplishments&ensp;&ensp;<a href="javascript:openAddAccModal();"><i class="fas fa-plus"></i></a></div>
			  <div class="card-body"style="text-align:left;">
			    <div>
			    <div id="langDiv">
				    <c:if test="${not empty lang }">
				    	<h3 style="color:dodgerblue;" class="accInline" id="langN">${fn:length(lang)}</h3>&ensp;<h5 class="card-title accInline"><b>Languages</b></h5>
				    	<p>
							<c:forEach var="l" items="${lang }">
								${l.title}&ensp;<a href="${pageContext.request.contextPath}/delpro.do?no=${l.no}"><i class="fas fa-times"></i></a>&ensp;&ensp;
							</c:forEach>
						</p>
					</c:if>
				</div>
			    <div id="honorDiv">
				    <c:if test="${not empty honor }">
					 <hr>
				    	<h3 style="color:dodgerblue;" class="accInline" id="honorN">${fn:length(honor)}</h3>&ensp;<h5 class="card-title accInline"><b>Honors & Awards</b></h5>
				    	<p>
							<c:forEach var="h" items="${honor }">
								${h.title } - ${h.level } - ${h.year }&ensp;<a href="${pageContext.request.contextPath}/delpro.do?no=${h.no}"><i class="fas fa-times"></i></a><br>
							</c:forEach>	
						</p>
					</c:if>
				</div>
			    <div id="certiDiv">
				    <c:if test="${not empty certi }">
					<hr>
	   				    <h3 style="color:dodgerblue;" class="accInline" id="certiN">${fn:length(certi)}</h3>&ensp;<h5 class="card-title accInline"><b>Certification</b></h5>
	   				    <p>
							<c:forEach var="c" items="${certi }">
								${c.title } - ${c.contents}&ensp;<a href="${pageContext.request.contextPath}/delpro.do?no=${c.no}"><i class="fas fa-times"></i></a><br>
							</c:forEach>
						</p>
					</c:if>
				</div>
			    <div id="patentDiv">
			    	<c:if test="${not empty patent }">
					<hr>
					    <h3 style="color:dodgerblue;" class="accInline" id="patentN">${fn:length(patent)}</h3>&ensp;<h5 class="card-title accInline"><b>Patents</b></h5>
					    <p>
							<c:forEach var="p" items="${patent }">
								${p.title } - ${p.contents}&ensp;<a href="${pageContext.request.contextPath}/delpro.do?no=${p.no}"><i class="fas fa-times"></i></a><br>
							</c:forEach>
						</p>
					</c:if>
				</div>
			    <div id="tsDiv">
			    	<c:if test="${not empty ts }">
					<hr>
					    <h3 style="color:dodgerblue;" class="accInline" id="tsN">${fn:length(ts)}</h3>&ensp;<h5 class="card-title accInline"><b>Test Score</b></h5>
					    <p>
							<c:forEach var="t" items="${ts }">
								${t.title } - ${t.score}&ensp;<a href="${pageContext.request.contextPath}/delpro.do?no=${t.no}"><i class="fas fa-times"></i></a><br>
							</c:forEach>
						</p>
					</c:if>
				</div>
			    </div>
			  </div>
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
	<%@include file="../home/devfoot.jsp"%>
</body>

<!--모달 부분-->
<div class="modal" id="editIntro">
  <div class="modal-dialog" role="document" style="max-width:700px">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Intro</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<div class="form-group">
		  <label class="col-form-label" for="introName">Name *</label>
		  <input type="text" class="form-control" placeholder="Default input" id="introName" style="width:40%">
		  <label class="col-form-label" for="introEmail">Email *</label>
		  <input type="text" class="form-control" placeholder="Default input" id="introEmail" style="width:70%">
		  <label class="col-form-label" for="introAdd">Address *</label>
		  <input type="text" class="form-control" placeholder="Default input" id="introAdd" style="width:100%">
     	  <label for="introTa">Headline</label>
      	  <textarea class="form-control" id="introHl" rows="3"></textarea>
	   </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="editIntro()">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

	
<div class="modal" id="addExp">
  <div class="modal-dialog" role="document" style="max-width:700px">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Experience</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="addExpForm">
      <div class="modal-body">
       	<div class="form-group">
		  <label class="col-form-label" for="expTitle">Title *</label>
		  <input type="text" class="form-control" placeholder="Default input" id="expTitle" name="title" required>
		  <label class="col-form-label" for="expCompany">Company *</label>
		  <input type="text" class="form-control" placeholder="Default input" id="expCompany" name="group" required>
		  <label class="col-form-label" for="expLocation">Location *</label>
		  <input type="text" class="form-control" placeholder="Default input" id="expLocation" name="place" required>
		  <table style="width:100%;margin-bottom:5px;">
		  	<tr>
			  	<td>
				    <label class="col-form-label">Start *</label>
				    <input type="date" name="start" required>
			    </td>
			    <td>
				    <label class="col-form-label">End</label>
					<input type="date" name="end" id="expEnd">
			    </td>
			</tr>
		  </table>
		   &ensp;&ensp;&ensp;&ensp;<input class="form-check-input" type="checkbox" id="expCK" name="expCk">I currently work here.
		   <br>
		   <label for="exampleTextarea">Contents *</label>
      	   <textarea class="form-control" id="exampleTextarea" rows="3" name="contents" required></textarea>
		</div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="expClose()">Close</button>
      </div>
      </form>
    </div>
  </div>
</div>

<div class="modal" id="addEdu">
  <div class="modal-dialog" role="document" style="max-width:700px">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Education</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="addEduForm">
      <div class="modal-body">
       	<div class="form-group">
		  <label class="col-form-label" for="eduTitle">School Name *</label>
		  <input type="text" class="form-control" placeholder="Default input" id="eduTitle" name="title" required>
		  <label class="col-form-label" for="eduDegree">Degree *</label>
		  <select class="form-control" id="exampleSelect1" name="degree" required>
		        <option>Bachelor</option>
		        <option>Master</option>
		        <option>Doctor</option>
		  </select>
		  <table style="width:100%;margin-bottom:5px;">
		  	<tr>
			  	<td>
				    <label class="col-form-label">Start *</label>
				    <input type="date" name="start" required>
			    </td>
			    <td>
				    <label class="col-form-label">End *</label>
					<input type="date" name="end" id="eduEnd">
			    </td>
			</tr>
		  </table>
		   &ensp;&ensp;&ensp;&ensp;<input class="form-check-input" type="checkbox" id="eduCK">I currently study here.
		   <br>
		   <label>Contents</label>
      	  <textarea class="form-control" rows="3" name="contents" required></textarea>
		</div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="eduClose()">Close</button>
      </div>
      </form>
    </div>
  </div>
</div>


<div class="modal" id="addSkill">
  <div class="modal-dialog" role="document" style="max-width:700px">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Skills</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="addSkillForm">
	      <div class="modal-body">
	       	<div class="form-group">
			  <label class="col-form-label" for="skillName">Skill Name *</label>
			  <input type="text" class="form-control" placeholder="Default input" id="skillName" name = "title" required>
		      <label class="col-form-label" for="skillLevel">Level *</label>
			  <select class="form-control" id="skillLevel" name = "level" required>
			        <option>Beginner</option>
			        <option>Intermediate</option>
			        <option>Expert</option>
			  </select>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-primary">Save changes</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="skillClose()">Close</button>
	      </div>
      </form>
    </div>
  </div>
</div>

<div class="modal" id="addAcc">
  <div class="modal-dialog" role="document" style="max-width:700px">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Accomplishment</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="addAccForm">
      <div class="modal-body">
       	<div class="form-group">
		  <label class="col-form-label" for="inputDefault">Type</label>
		  <select class="form-control" id="accSelect" onchange="accChanged()">
		        <option>---------------------------</option>
		        <option>Language</option>
		        <option>Honor & Award</option>
		        <option>Certification</option>
		        <option>Patent</option>
		        <option>Test Score</option>
		    </select>
		</div>
       	<div class="form-group" id="accBody">
       	</div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="accClose()">Close</button>
      </div>
      </form>
    </div>
  </div>
</div>
</html>