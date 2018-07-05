<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#static1 {
   width: 250px;
   height: 60px;
   position: static;
   border: 1px solid #D8D8D8;
   background-image: url("resources/img/home/profileback4.jpg");
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
#mainbar {
   background-color: white;
   margin-top: 100px;
}

Button {
   background-color: white;
   border: 1px solid #008CBA;
   color: #008CBA;   
}
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
<script defer
   src="https://use.fontawesome.com/releases/v5.0.12/js/all.js"
   integrity="sha384-Voup2lBiiyZYkRto2XWqbzxHXwzcm4A5RfdfG6466bu5LqjwwrjXCMBQBLMWh7qR"
   crossorigin="anonymous"></script>

</head>
<body>
<%@include file="../home/devnav.jsp"%>
<div id=contents>      
	<div id=mainbar style="margin-left: 20%; margin-right: 25%; box-shadow: 2px 2px 2px 2px #888888; background-color: white">
		<div style="padding-left: 30px; padding: 15px; border-bottom: 1px solid #D8D8D8">
			<h4>친구 N명</h4>
			<hr>
			<img src="resources/img/home/default.png" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px; margin: 5px">
			<b style="font-size: 20px">&nbsp; &nbsp;<a href="" style="margin-right: 20px">YunJey</a></b>follow
			<div style="float: right; margin-top:15px">
				<a href=""><i class="far fa-envelope" style="font-size: 30px; margin-right: 10px; color: #008CBA;"></i></a>
				<a href=""><i class="fas fa-trash-alt" style="font-size: 30px; margin-right: 20px; color: red"></i></a>
			</div><br />
			<img src="resources/img/home/default.png" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px; margin: 5px">
			<b style="font-size: 20px">&nbsp; &nbsp;<a href="" style="margin-right: 20px">Fred</a></b>follow
			<div style="float: right; margin-top:15px">
				<i class="far fa-envelope" style="font-size: 30px; margin-right: 10px; color: #008CBA;"></i>
				<i class="fas fa-trash-alt" style="font-size: 30px; margin-right: 20px; color: red"></i>
			</div><br />
			<img src="resources/img/home/default.png" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px; margin: 5px">
			<b style="font-size: 20px">&nbsp; &nbsp;<a href="" style="margin-right: 20px">ChIm</a></b>follow
			<div style="float: right; margin-top:15px">
				<i class="far fa-envelope" style="font-size: 30px; margin-right: 10px; color: #008CBA;"></i>
				<i class="fas fa-trash-alt" style="font-size: 30px; margin-right: 20px; color: red"></i>
			</div><br />
			<img src="resources/img/home/default.png" style="border: 2px solid gray; border-radius: 50%; width: 50px; height: 50px; margin: 5px">
			<b style="font-size: 20px">&nbsp; &nbsp;<a href="" style="margin-right: 20px">Daun</a></b>follow
			<div style="float: right; margin-top:15px">
				<i class="far fa-envelope" style="font-size: 30px; margin-right: 10px; color: #008CBA;"></i>
				<i class="fas fa-trash-alt" style="font-size: 30px; margin-right: 20px; color: red"></i>
			</div><br />
		</div>
	</div>
</div>
</body>
</html>