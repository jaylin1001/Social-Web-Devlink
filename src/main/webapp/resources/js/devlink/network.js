$(function() {  
	var cnt = 0;
	$('.requestFrd').on('click', function(){
		cnt++;
		if(cnt > 1){
			$('button').removeClass('selected');
			cnt = 0;
		}else{
			$(this).addClass('selected');
		}
	});
	
	$('form').submit(function(){
		console.log("form()");
		var f=$(this);
	    $.ajax({
	        type:'POST',  
	        url:'delfrdfrom.do',      
	        data: $(this).serialize(),      
	        success:function(data){
	        	if(data.trim()=='1'){
	        		$(f).remove();
	        	}
	        },
	        error:function(e){
	            alert(e.responseText);  
	        }
	    });
		return false;
	});
});
function frdtoOk(no){
	console.log("frdtoOk()");
	var f=$('#frdto'+no);
	var number=$('#numberoffrd').text();
	number=Number(number)+1;
    $.ajax({
        type:'POST',  
        url:'frdtoOk.do',      
        data:{m_no:no},
        success:function(data){
        	if(data.trim()=='1'){
        		$(f).remove();
        		$('#numberoffrd').text(number);
        	}else{
        		$(f).remove();
        	}
        },
        error:function(e){
            alert(e.responseText);  
        }
    });
}