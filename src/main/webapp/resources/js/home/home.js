$(function(){
   	$('nav li').click(function(){
   		var idValue= $(this).attr('id');
		$('#contents').empty();	
		switch(idValue){
			case 'home':
				location.href="home.jsp";
				break;
			case 'personal':
				$.ajax({
					method:'POST',
					url: 'viewpersonal.do',
					success: function(data){
						$('#contents').html(data);
					}
				});
				break;
			case 'authorization':
				$.ajax({
					method:'POST',
					url: 'viewauth.do',
					success: function(data){
						$('#contents').html(data);
					}
				});
				break;
			case 'business':
				$.ajax({
					method:'POST',
					url: 'viewbusiness.do',
					success: function(data){
						$('#contents').html(data);
						$('#noticeboard').trigger('click');
					}
				});
				break;		
			case 'logout':
				$('#logoutModal').modal();
				$('.modal-backdrop').css('opacity','0').css('z-index','0');
				$('.modal-dialog').css('z-index','1');
				$('.modal').css('top','280px');
				break;		
		}
   	});

	$('#logoutBtn').on('click',function(){
		location.href="logout.do";
	});
	$('#logoutNoBtn').on('click',function(){
		location.href="home.jsp";
	});
	
});