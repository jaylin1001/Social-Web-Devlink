var key=true;
$(function() {	
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

function addFrd(no){
	console.log("start key : " + key);
	if(key==true){
		key=false;
		console.log("middle key : " + key);
		console.log($('#addBtn'+no).hasClass("selected"));
		if($('#addBtn'+no).hasClass("selected")==true) {
			console.log("has selected");
			$.ajax({
		        type:'POST',  
		        url:'delFrdReq.do',
		        data:{m_no:no},
		        sync:true,
		        success:function(data){
		        	console.log("delFrdReq : "+data);
		        	if(data.trim()=='1'){
			        	$('#addBtn'+no).text('친구신청');
			        	$('#addReq'+no).val('');
			        	$('#addBtn'+no).removeClass('selected');
		        	}else if(data.trim()=='3'){
		        		$('#addBtn'+no).text('이미 친구');
		        		$('#addBtn'+no).addClass('isFrd');
		        		$('#addBtn'+no).prop('disabled', true);
		        		var number=$('#numberoffrd').text();
		        		number=Number(number)+1;
		        		$('#numberoffrd').text(number);
		        	}
		        	key=true;
		    		console.log("end key : " + key);
		        },
		        error:function(e){
		            alert(e.responseText);  
		        }
		    });
		}else{
		    $.ajax({
		        type:'POST',  
		        url:'addFrdReq.do',      
		        data:{m_no:no},
		        sync:true,
		        success:function(data){
		        	if(data.trim()=='1'){
		        		$('#addBtn'+no).text('친구맺기 중');
		        		$('#addReq'+no).val(no);
		        		$('#addBtn'+no).addClass('selected');
		        	}else if(data.trim()=='2'){
		        		$('#addBtn'+no).text('이미신청받음');
		        		$('#addBtn'+no).addClass('isIng');
		        		$('#addBtn'+no).prop('disabled', true);
		        	}else if(data.trim()=='3'){
		        		$('#addBtn'+no).text('이미 친구');
		        		$('#addBtn'+no).addClass('isFrd');
		        		$('#addBtn'+no).prop('disabled', true);
		        		var number=$('#numberoffrd').text();
		        		number=Number(number)+1;
		        		$('#numberoffrd').text(number);
		        	}
		        	key=true;
		    		console.log("end key : " + key);
		        },
		        error:function(e){
		            alert(e.responseText);  
		        }
		    });
		}
	}
}

function delFrd(no){
	console.log('delFrd()');
	$.ajax({
        type:'POST',  
        url:'delFrd.do',      
        data:{m_no:no},
        sync:true,
        success:function(data){
        	if(data.trim()=='1'){
        		$('#pFrd'+no).remove();
        	}
        },
        error:function(e){
            alert(e.responseText);  
        }
    });
}
