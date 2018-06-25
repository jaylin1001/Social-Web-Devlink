<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>DevLink - view my profile</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type='text/javascript' src="resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/home/home.css">
<script src="resources/js/home/home.js"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.12/js/all.js"
	integrity="sha384-Voup2lBiiyZYkRto2XWqbzxHXwzcm4A5RfdfG6466bu5LqjwwrjXCMBQBLMWh7qR"
	crossorigin="anonymous"></script>	
</head>
<body>
	<%@include file="../home/devnav.jsp"%>
	<div id="contents" style="text-align:center;">
		<div style="background-color: white-space;height:100%;width: 15%;float: left;display: inline-block;">asdfasdf</div>
		<div style="width:70%;float:none;display: inline-block">
			<div class="card border-light" style="width:100%;">
			<div class="card-header" style="padding:0px;border: none;"><img src="resources/img/me/profileback3.png" style="border: none;width:100%;"></div>
			    <div class="card border-light">
				  <div class="card-header">Edit intro</div>
				    <table>
				    	<tr>
				    		<td><img src="resources/img/me/propic.jpg" style="float:left;max-height: 60%;"></td>
				    		<td colspan="2">
								  <div class="card-body">
							    	<h4 class="card-title" style="padding-top: 10px;">Chanho Kuk&ensp;<a href="#"><i class="fas fa-edit"></i></a></h4>
					    			<p class="card-text">서울특별시 송파구 마천1동 성내천로 47길 38 파크데일아파트 2211동 15666dfdf호</p>
								  </div>
				    		</td>
				    		<td>
				    		  <ul class="list-group list-group-flush">
							    <li class="list-group-item"><i class="fas fa-graduation-cap"></i>&emsp;Young-dongil HighSchool</li>
							    <li class="list-group-item"><i class="fas fa-university"></i>&emsp;Dongguk University</li>
							    <li class="list-group-item"><i class="fas fa-address-book"></i>&emsp;See contact info</li>
							    <li class="list-group-item"><i class="fas fa-users"></i>&emsp;See connections</li>
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
			  <div class="card-header">Experience&ensp;&ensp;<a href="#"><i class="fas fa-plus"></i></a></div>
			  <div class="card-body"style="text-align:left;">
			    <div>
				    <h5 class="card-title"><b>Research Intern</b>&ensp;<a href="#"><i class="fas fa-edit"></i></a></h5>
				    <p>
				    Company Name : Purdue University<br>
				    Date Employed : Dec 2013 – Feb 2014<br>
				    Employment Duration : 3 month<br>
				    Location : Purdue University<br>
				    Contents : Researching Big Data<br>
				    </p>
			    </div>
			    <br>
			    <div>
				    <h5 class="card-title"><b>NIPA Capstone Project</b>&ensp;<a href="#"><i class="fas fa-edit"></i></a></h5>
				    <p>
				    Company Name : Purdue University<br>
				    Date Employed : Dec 2013 – Feb 2014<br>
				    Employment Duration : 3 month<br>
				    Location : Purdue University<br>
				    Contents : Let robot move by using with NLP<br>
				    </p>
			    </div>
			  </div>
			</div>
			
			
			<div class="card border-light mb-3" style="width:100%;display: inline-block;">
			  <div class="card-header">Education&ensp;&ensp;<a href="#"><i class="fas fa-plus"></i></a></div>
			  <div class="card-body"style="text-align:left;">
			    <div>
				    <h5 class="card-title"><b>Dongguk University</b>&ensp;<a href="#"><i class="fas fa-edit"></i></a></h5>
				    <p>
					Bachelor's Degree, Computer Engineering Science & Business Administration<br>
					2008-2016
				    </p>
			    </div>
			    <br>
			    <div>
				    <h5 class="card-title"><b>Purdue University</b>&ensp;<a href="#"><i class="fas fa-edit"></i></a></h5>
				    <p>
					Intern, Computer Information Technology<br>
					2008-2016
				    </p>
			    </div>
			  </div>
			</div>
			
		</div>
		<div style="background-color: white-space;height: 100%;width: 15%;float: right;display: inline-block;">bbcccccb</div>
	</div>
	<%@include file="../home/devfoot.jsp"%>
</body>
</html>