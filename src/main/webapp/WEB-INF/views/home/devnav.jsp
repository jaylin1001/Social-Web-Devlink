<script>
$(function(){
	$("#nav-drop").hover(function() {
	   $("#nav-drop-detail").addClass("show");
	   console.log("asdfa");
	}, function(){
	    $("#nav-drop-detail").removeClass("show");
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
			<li class="nav-item" id="jobs"><a class="nav-link" href="#">Jobs</a></li>
			<li class="nav-item" id="msg"><a class="nav-link" href="#">Messaging</a></li>
        	<!-- <li class="nav-item" id="me"><a class="nav-link" href="#">Me</a></li> -->
        	<li id="nav-drop" class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="true">Me</a>
		    	<div id="nav-drop-detail"class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 38px, 0px); top: 0px; left: 0px; will-change: transform;">
					<a class="dropdown-item" href="#">About</a>
		      		<a class="dropdown-item" href="${pageContext.request.contextPath }/viewmyprofile.do">View My Profile</a>
		      		<a class="dropdown-item" href="#">Setting</a>
		      		<a class="dropdown-item" href="#">Help Center</a>
		      		<div class="dropdown-divider"></div>
		      		<a class="dropdown-item" id ="logout" href="#">Log Out</a>
		    	</div>
			</li>
        	<!-- <li class="nav-item" id="logout"><a class="nav-link" href="#">Logout</a></li> -->
		</ul>
	</div>
</nav>