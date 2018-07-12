$(function() {
	
});

function frdtoOk(no){
	console.log("frdtoOk()");
	var f=$('#frdto'+no);
    $.ajax({
        type:'POST',  
        url:'frdtoOk.do',      
        data:{m_no:no},
        success:function(data){
    		$('#srstrdiv'+no).html('');
        	if(data.trim()=='1'){
        		var number=$('#numberoffrd').text();
        		number=Number(number)+1;
        		$('#numberoffrd').text(number);
        		$('#srstrdiv'+no).html('<button class ="requestFrd isFrd" id="btn'+no+'" onclick="frdchange('+no+')">친구상태</button>');     	
        	}else{
        		$('#srstrdiv'+no).html('<button class ="requestFrd" id="btn'+no+'" onclick="frdchange('+no+')">친구신청</button>');     	
        	}
        },
        error:function(e){
            alert(e.responseText);  
        }
    });
}

function frdingdel(no){
    $.ajax({
        type:'POST',  
        url:'delfrdtome.do',      
        data:{fno:no},      
        success:function(data){
    		$('#srstrdiv'+no).html('');
        	if(data.trim()=='1'){
        		$('#srstrdiv'+no).html('<button class ="requestFrd" id="btn'+no+'" onclick="frdchange('+no+')">친구신청</button>');        		
        	}else{
        		$('#srstrdiv'+no).html('<button class ="requestFrd isFrd" id="btn'+no+'" onclick="frdchange('+no+')">친구상태</button>');     	
        	}
        },
        error:function(e){
            alert(e.responseText);  
        }
    });
}

function frdchange(no){
	var $button = $('$btn'+no);
	if($button.hasClass('ifFrd')==true){
		 $.ajax({      
		        type:'POST',  
		        url:'delfrdchg.do',      
		        data: {fno:no},      
		        success:function(data){
		        	$button.removeClass('isFrd');
		        	$button.text('친구신청');
		        },
		        error:function(e){
		            alert(e.responseText);  
		        }
		 });
	}else if($button.hasClass('isIng')==true){//받은거 지우면 됨
		$.ajax({      
	        type:'POST',
	        url:'ingfrdchg.do',      
	        data: {fno:no},      
	        success:function(data){
	        	if(data==1){
	        		$button.removeClass('isIng');
		        	$button.text('친구신청');
	        	}else if(data==2){
	        		$button.removeClass('isIng');
		        	$button.addClass('isFrd');
		        	$button.text('친구상태');	        		
	        	}
	        },
	        error:function(e){
	            alert(e.responseText);  
	        }
		});
	}else{
		$.ajax({      
	        type:'POST',  
	        url:'nofrdchg.do',      
	        data: {fno:no},      
	        success:function(data){
	        	if(data==1){
	        		$button.addClass('isIng');
		        	$button.text('친구맺기중');
	        	}else{
	        		$('#srstrdiv'+no).html('');
	        		$('#srstrdiv'+no).html(data);
	        	}
	        },
	        error:function(e){
	            alert(e.responseText);  
	        }
		});
	}
}