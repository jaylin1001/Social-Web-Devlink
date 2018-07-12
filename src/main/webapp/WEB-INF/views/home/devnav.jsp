
<script>
$(function(){
	$("#nav-drop").hover(function() {
	   $("#nav-drop-detail").addClass("show");
	}, function(){
	    $("#nav-drop-detail").removeClass("show");
	});

	$('#rcmdBar').css('width',$('#schInput').css('width'));
	$('#rcmdBar').css('height','0px');	
	$('#rcmdBar').css('float','right');	
	$('#rcmdBar').css('margin-right','95px');	
	$('#rcmdBar').css('z-index','99');
	
	$('#schInput').focus(function(){
		
	});
	$('#schInput').focusout(function(){/* 
		$('#rcmdBar').css('display','none'); */
	});
	$('#schInput').keyup(function () {
		$('#rcmdBar').css('display','initial');
		 $.ajax({
	        type:'POST',  
	        url:'searchrecommand.do',      
	        data: {name : $('#schInput').val()},
	        success:function(data){
	        	console.log(data);
	        	$('#rcmdBar').html(data);
	        }
	    });
	});
	$('#schInputForm').submit(function(){
		if($('#schInput').val()==''){
			console.log('black search');
		}else{
			location.href='searchfrdbystr.do?str='+$('#schInput').val();
		}
		return false;
	});
});
</script>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<a class="navbar-brand" href="${pageContext.request.contextPath }/home.do">DevLink</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarColor01" aria-controls="navbarColor01"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarColor01">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item" id="home"><a class="nav-link" href="${pageContext.request.contextPath }/home.do">Home<span class="sr-only">(current)</span></a></li>
			<li class="nav-item" id="network"><a class="nav-link" href="${pageContext.request.contextPath }/network.do">Network</a></li>
			<!-- <li class="nav-item" id="jobs"><a class="nav-link" href="#">Jobs</a></li> -->
			<li class="nav-item" id="msg"><a class="nav-link" href="#">Messaging</a></li>
        	<!-- <li class="nav-item" id="me"><a class="nav-link" href="#">Me</a></li> -->
        	<li id="nav-drop" class="nav-item dropdown">
				<a class="nav-link dropdown-toggle"  href="${pageContext.request.contextPath }/viewmyprofile.do" role="button" aria-haspopup="true" aria-expanded="true">Me</a>
		    	<div id="nav-drop-detail"class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 38px, 0px); top: 0px; left: 0px; will-change: transform;">
		      		<a class="dropdown-item" href="${pageContext.request.contextPath }/viewmyprofile.do">View My Profile</a>
		      		<a class="dropdown-item" href="${pageContext.request.contextPath }/settings.do">Setting</a>
		      		<a class="dropdown-item" href="${pageContext.request.contextPath }/helpcenter.do">Help Center</a>
		      		<div class="dropdown-divider"></div>
		      		<a class="dropdown-item" id ="logout" href="${pageContext.request.contextPath }/logout.do">Log Out</a>
		    	</div>
			</li>
        	<!-- <li class="nav-item" id="logout"><a class="nav-link" href="#">Logout</a></li> -->
		</ul>
		<form class="form-inline my-2 my-lg-0" id="schInputForm">
	      <input class="form-control mr-sm-2" type="text" placeholder="Search" id="schInput">
	      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
	    </form>
	</div>
</nav>
<div class="list-group" id="rcmdBar" style="position:relative;display:none;">
</div>