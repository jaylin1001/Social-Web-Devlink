<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>DevLink - view my profile</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type='text/javascript' src="resources/js/bootstrap.js"></script>
<script type='text/javascript' src="resources/js/me/myprofile.js"></script>
<script type='text/javascript' src="resources/js/httpRequest.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/home/home.css">
<script src="resources/js/home/home.js"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.12/js/all.js"
	integrity="sha384-Voup2lBiiyZYkRto2XWqbzxHXwzcm4A5RfdfG6466bu5LqjwwrjXCMBQBLMWh7qR"
	crossorigin="anonymous"></script>
<script>
<%-- function check() {
	sendRequest("<%=request.getContextPath()%>/check.do?id=" + f.id.value, null, check_res,
					"GET");
		}
		function check_res() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					var check_div = document.getElementById("check_div");
					check_div.innerHTML = httpRequest.responseText;
				}
			}
		}
 --%>
 
function eduSel(title){
	var school='';
	if(title.match('University')=='University'){
		school='<i class="fas fa-university"></i>';
	}else{
		school='<i class="fas fa-graduation-cap"></i>';
	}
	return school;
 }
</script>
	
<style>
.accInline{
display:inline;
}

.modal-backdrop
{
    opacity:0.5 !important;
    z-index:0;
}
</style>
<script>
</script>
</head>
<body>
	<%@include file="../home/devnav.jsp"%>
	<div id="contents" style="text-align:center;">
		<div style="height:100%;width: 15%;float: left;display: inline-block;background-color:#F9F9F9"></div>
		<div style="width:70%;float:none;display: inline-block;background-color:#F9F9F9">
			<div class="card border-light" style="width:100%;">
			<div class="card-header" style="padding:0px;border: none;"><img src="resources/img/me/profileback4.png" style="border: none;width:100%;"></div>
			    <div class="card border-light">
				  <div class="card-header">Edit intro</div>
				    <table>
				    	<tr>
				    		<td><img src="resources/img/me/propic.jpg" style="float:left;max-height: 60%;"></td>
				    		<td colspan="2">
								  <div class="card-body">
							    	<h4 class="card-title" style="padding-top: 10px;">${p.name}&ensp;<a href="javascript:openEditIntroModal();"><i class="fas fa-edit"></i></a></h4>
					    			<p class="card-text">${p.headline}</p>
					    			<p class="card-text" style="color:#707070">${p.address }</p>
								  </div>
				    		</td>
				    		<td>
				    		  <ul class="list-group list-group-flush">
								<c:if test="${not empty edu }">
									<c:forEach var="e" items="${edu }">
									    <!-- <li class="list-group-item"><i class="fas fa-graduation-cap"></i>&emsp;Young-dongil HighSchool</li> -->
									    <li class="list-group-item"><i class="fas fa-university"></i>&emsp;${e.title }</li>
								    </c:forEach>
								</c:if>
							    <li class="list-group-item"><a href="#"><i class="fas fa-address-book"></i>&emsp;See contact info</a></li>
							    <li class="list-group-item"><a href="#"><i class="fas fa-users"></i>&emsp;See connections (21)</a></li>
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
					<div class="progress">
					  <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
			  </div>
			</div>
			<div class="card border-light mb-3" style="width:100%;display: inline-block;">
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
			</div>
			
			<div class="card border-light mb-3" style="width:100%;display: inline-block;">
			  <div class="card-header">Experience&ensp;&ensp;<a href="javascript:openAddExpModal();"><i class="fas fa-plus"></i></a></div>
			  <div class="card-body"style="text-align:left;">
				<c:if test="${not empty exp }">
					<div>
					<c:forEach var="e" items="${exp }">
						    <h5 class="card-title"><b>${e.title }</b>&ensp;<a href="#"><i class="fas fa-edit"></i></a></h5>
						    <p>
						    Company Name : ${e.group }<br>
						    Date Employed : ${e.start } – ${e.end }<br>
						    Employment Duration :${e.duration }<br>
						    Location : ${e.place }<br>
						    Contents : ${e.contents }<br>
						    </p>
					    <br>
					</c:forEach>
				    </div>	
			    </c:if>
			  </div>
			</div>
			<div class="card border-light mb-3" style="width:100%;display: inline-block;">
			  <div class="card-header">Education&ensp;&ensp;<a href="javascript:openAddEduModal();"><i class="fas fa-plus"></i></a></div>
			  <div class="card-body"style="text-align:left;">
				<c:if test="${not empty edu }">
					<div>
					<c:forEach var="e" items="${edu }">
						    <h5 class="card-title"><b>${e.title }</b>&ensp;<a href="#"><i class="fas fa-edit"></i></a></h5>
						    <p>
							${e.degree }'s Degree, ${e.contents }<br>
							${e.start } - ${e.end }
						    </p>
					    <br>
					</c:forEach>
					</div>
				</c:if>
			  </div>
			</div>
			
			<div class="card border-light mb-3" style="width:100%;display: inline-block;">
			  <div class="card-header">Skills&ensp;&ensp;<a href="javascript:openAddSkillModal();"><i class="fas fa-plus"></i></a></div>
			  <div class="card-body"style="text-align:left;">
				<c:if test="${not empty skill }">
					<div>
					<c:forEach var="s" items="${skill }">
					    	<h6 class="card-title"><b>${s.title } - ${s.level }</b>&ensp;<a href="#"><i class="fas fa-times"></i></a></h6>
					</c:forEach>
				    </div>
				</c:if>
			  </div>
			</div>
			
			<div class="card border-light mb-3" style="width:100%;display: inline-block;">
			  <div class="card-header">Accomplishments&ensp;&ensp;<a href="javascript:openAddAccModal();"><i class="fas fa-plus"></i></a></div>
			  <div class="card-body"style="text-align:left;">
			    <div>
				    <h3 style="color:dodgerblue;" class="accInline">3</h3>&ensp;<h5 class="card-title accInline"><b>Languages</b></h5>
				    <p>
					English&ensp;Korean&ensp;Japanese
				    </p>
				    <hr>				    
				    <h3 style="color:dodgerblue;" class="accInline">4</h3>&ensp;<h5 class="card-title accInline"><b>Honors & Awards</b></h5>
				    <p>
					LINC Capston project conference - Special Prize<br>
					CS Graduation project competition - Grand Prize<br>
					Capstone Project - Grand Prize<br>
					 Invent competitive exhibition - Grand Prize
				    </p>
				    <hr>
   				    <h3 style="color:dodgerblue;" class="accInline">1</h3>&ensp;<h5 class="card-title accInline"><b>Certification</b></h5>
				    <p>
					Certificate of Merit - Purdue Univiersity
				    </p>
				    <hr>
				    <h3 style="color:dodgerblue;" class="accInline">1</h3>&ensp;<h5 class="card-title accInline"><b>Patents</b></h5>
				    <p>
					사용자 특성 및 여행지 특성에 기반한 여행지 추천 시스템 및 방법
				    </p>
				    <hr>
				    <h3 style="color:dodgerblue;" class="accInline">2</h3>&ensp;<h5 class="card-title accInline"><b>Test Score</b></h5>
				    <p>
					TOEIC 840<br>
					TOEIC Speaking Level 6
				    </p>
			    </div>
			  </div>
			</div>
		</div>
		<div style="height: 100%;width: 15%;float: right;display: inline-block;padding:5px;background-color:#F9F9F9">
			<img src="resources/img/me/rightDev.png" style="max-width:100%;margin-bottom:6px;">
			<hr>
			<div style="text-align:center">
					<a href="#">About</a>&ensp;<a href="#">Help Center</a>&ensp;<a href="#">Privacy & Terms</a><br>
					<p style="color:#646464">KITRI Digital Convergence 25th<br><span class="badge badge-info">DevLink</span>&ensp;DevLink@2018</p>
			</div>
		</div>
	</div>
	<%@include file="../home/devfoot.jsp"%>
</body>

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
		 <table style="width:100%">
		   	<tr>
		      <td>
		       	<div class="form-group">
				  <label class="col-form-label" for="inputDefault">First Name *</label>
				  <input type="text" class="form-control" placeholder="Default input" id="inputDefault">
				</div>
			  </td>
		      <td>
		       	<div class="form-group">
				  <label class="col-form-label" for="inputDefault">First Name *</label>
				  <input type="text" class="form-control" placeholder="Default input" id="inputDefault">
				</div>
			  </td>
			</tr>
		</table>
       	<div class="form-group">
		  <label class="col-form-label" for="inputDefault">Address *</label>
		  <div style="width:100%">
		  <input type="text" class="form-control" placeholder="Default input" id="inputDefault" style="display:inline-block;width:70%;margin-right:10px"><button type="button" class="btn btn-primary">Primary</button>
		  </div>
		  <input type="text" class="form-control" placeholder="Default input" id="inputDefault" style="width:70%">
		  <label class="col-form-label" for="inputDefault">Email *</label>
		  <input type="text" class="form-control" placeholder="Default input" id="inputDefault">
     	  <label for="exampleTextarea">Headline</label>
      	  <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
	   </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
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
      <div class="modal-body">
       	<div class="form-group">
		  <label class="col-form-label" for="inputDefault">Title *</label>
		  <input type="text" class="form-control" placeholder="Default input" id="inputDefault">
		  <label class="col-form-label" for="inputDefault">Company *</label>
		  <input type="text" class="form-control" placeholder="Default input" id="inputDefault">
		  <label class="col-form-label" for="inputDefault">Location *</label>
		  <input type="text" class="form-control" placeholder="Default input" id="inputDefault">
		  <table style="width:100%;margin-bottom:5px;">
		  	<tr><td>
		    <label class="col-form-label" for="inputDefault">From *</label>
			<select class="form-control" id="exampleSelect1">
		        <option>2018</option>
		        <option>2</option>
		        <option>3</option>
		        <option>4</option>
		        <option>5</option>
		    </select>
		    <select class="form-control" id="exampleSelect1">
		        <option>2018</option>
		        <option>2</option>
		        <option>3</option>
		        <option>4</option>
		        <option>5</option>
		    </select>
		    </td><td>
		    <label class="col-form-label" for="inputDefault">To *</label>
			<select class="form-control" id="exampleSelect1">
		        <option>1</option>
		        <option>2</option>
		        <option>3</option>
		        <option>4</option>
		        <option>5</option>
		    </select>
		    <select class="form-control" id="exampleSelect1">
		        <option>2018</option>
		        <option>2</option>
		        <option>3</option>
		        <option>4</option>
		        <option>5</option>
		    </select>
		    </td></tr>
		  </table>
		   &ensp;&ensp;&ensp;&ensp;<input class="form-check-input" type="checkbox" value="" checked>I currently work here.
		   <br>
		   <label for="exampleTextarea">Contents</label>
      	  <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
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
      <div class="modal-body">
       	<div class="form-group">
		  <label class="col-form-label" for="inputDefault">School Name *</label>
		  <input type="text" class="form-control" placeholder="Default input" id="inputDefault">
		  <label class="col-form-label" for="inputDefault">Degree *</label>
		  <select class="form-control" id="exampleSelect1">
		        <option>High School</option>
		        <option>Bachelor</option>
		        <option>Master</option>
		        <option>Doctor</option>
		  </select>
		  <table style="width:100%;margin-bottom:5px;">
		  	<tr><td>
		    <label class="col-form-label" for="inputDefault">From *</label>
			<select class="form-control" id="exampleSelect1">
		        <option>2018</option>
		        <option>2</option>
		        <option>3</option>
		        <option>4</option>
		        <option>5</option>
		    </select>
		    <select class="form-control" id="exampleSelect1">
		        <option>2018</option>
		        <option>2</option>
		        <option>3</option>
		        <option>4</option>
		        <option>5</option>
		    </select>
		    </td><td>
		    <label class="col-form-label" for="inputDefault">To *</label>
			<select class="form-control" id="exampleSelect1">
		        <option>1</option>
		        <option>2</option>
		        <option>3</option>
		        <option>4</option>
		        <option>5</option>
		    </select>
		    <select class="form-control" id="exampleSelect1">
		        <option>2018</option>
		        <option>2</option>
		        <option>3</option>
		        <option>4</option>
		        <option>5</option>
		    </select>
		    </td></tr>
		  </table>
		   &ensp;&ensp;&ensp;&ensp;<input class="form-check-input" type="checkbox" value="" checked>I currently study here.
		   <br>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
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
      <div class="modal-body">
       	<div class="form-group">
		  <label class="col-form-label" for="inputDefault">Skill Name *</label>
		  <input type="text" class="form-control" placeholder="Default input" id="inputDefault">
	      <label class="col-form-label" for="inputDefault">Level *</label>
		  <select class="form-control" id="exampleSelect1">
		        <option>Beginner</option>
		        <option>Intermediate</option>
		        <option>Expert</option>
		  </select>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
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
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</html>