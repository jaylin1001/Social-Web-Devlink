$(function() {  
	$('#proPic').change(function() {
		var str = $(this).val();
		$('#picLabel').text(str.substring(12));
	});
	
	$('#expCK').click(function() {
        if ($('#expEnd').attr('disabled')) {
        	$('#expEnd').removeAttr('disabled');
        }else{
        	$('#expEnd').attr('disabled','disabled');
        }
    });
	
	$('#eduCK').click(function() {
        if ($('#eduEnd').attr('disabled')) {
        	$('#eduEnd').removeAttr('disabled');
        }else{
        	$('#eduEnd').attr('disabled','disabled');
        }
    });
	
	$('#addExpForm').submit(function(){
		addExp();
		expClose();
		return false;
	})

	$('#addEduForm').submit(function(){
		addEdu();
		eduClose();
		return false;
	})

	$('#addSkillForm').submit(function(){
		addSkill();
		skillClose();
	    return false;
	});
	
	$('#addAccForm').submit(function(){
		addAcc();
		accClose();
	    return false;
	});		
	
});
function openEditIntroModal(){
	 var name = document.getElementById("introname").innerHTML;
	 var add = document.getElementById("introadd").innerHTML;
	 var email = document.getElementById("introemail").innerHTML;
	 var hl = document.getElementById("introhl").innerHTML;
	 document.getElementById("introName").value = name;
	 document.getElementById("introAdd").value = add;
	 document.getElementById("introEmail").value = email;
	 document.getElementById("introHl").value = hl;
	 $("#editIntro").modal();
}

function editIntro(){
    $.ajax({      
        type:'POST',  
        url:'editintro.do',      
        data:{
        	name:$('#introName').val(),
        	email:$('#introEmail').val(),
        	address:$('#introAdd').val(),
        	headline:$('#introHl').val()
        },      
        success:function(data){
        	$('#introname').text($('#introName').val());
        	$('#introemail').text($('#introEmail').val());
        	$('#introadd').text($('#introAdd').val());
        	$('#introhl').text($('#introHl').val());
            $("#editIntro").modal('toggle');
        },
        error:function(e){
            $("#editIntro").modal('toggle');
            alert(e.responseText);  
        }
    });	 
}

function openAddExpModal(){
	 $("#addExp").modal();
}

function addExp(){
	console.log("addExp()");
    $.ajax({      
        type:'POST',  
        url:'addexp.do',      
        data: $('#addExpForm').serialize(),      
        success:function(data){
        	$("#expDiv").append(data);
            $("#addExp").modal('toggle');
        },
        error:function(e){
            $("#addExp").modal('toggle');
            alert(e.responseText);  
        }
    });	 
}

function openAddEduModal(){
	 $("#addEdu").modal();
}

function addEdu(){
	console.log("addEdu()");
    $.ajax({      
        type:'POST',  
        url:'addedu.do',      
        data: $('#addEduForm').serialize(),      
        success:function(data){
        	$("#eduDiv").append(data);
            $("#addEdu").modal('toggle');
        },
        error:function(e){
            $("#addEdu").modal('toggle');
            alert(e.responseText);  
        }
    });	 
}

function openAddSkillModal(){
	 $("#addSkill").modal();
}

function addSkill(){
	console.log("addSkill()");
    $.ajax({      
        type:'POST',  
        url:'addskill.do',      
        data: $('#addSkillForm').serialize(),      
        success:function(data){
        	$("#skillDiv").append(data);
            $("#addSkill").modal('toggle');
        },
        error:function(e){
            $("#addSkill").modal('toggle');
            alert(e.responseText);  
        }
    });	 
}

function openAddAccModal(){
	 $("#addAcc").modal();
}

function addAcc(){
	console.log("addAcc()");
	var accVal= document.getElementById("accSelect").value;
	var statement;
	var place;
	var head='';
	var foot='';
	
	if(accVal=='Language'){
		console.log('Lang');
		statement='addlang.do';
		place='langDiv';
		if($('#langN').val()==undefined){
			head='<hr><h3 style="color:dodgerblue;" class="accInline" id="langN">1</h3>&ensp;<h5 class="card-title accInline"><b>Languages</b></h5><p>';
			foot='</p>';
		}else{
			var num=Number($('#langN').text())+1;
			$('#langN').text(num);
		}
	}else if(accVal=='Honor & Award'){
		console.log('Honor');
		statement='addhonor.do';
		place='honorDiv';
		if($('#honorN').val()==undefined){
			head='<hr><h3 style="color:dodgerblue;" class="accInline" id="honorN">1</h3>&ensp;<h5 class="card-title accInline"><b>Honors & Awards</b></h5><p>';
			foot='</p>';
		}else{
			var num=Number($('#honorN').text())+1;
			$('#honorN').text(num);
		}
	}else if(accVal=='Certification'){
		console.log('Certi');
		statement='addcerti.do';
		place='certiDiv';
		if($('#certiN').val()==undefined){
			head='<hr><h3 style="color:dodgerblue;" class="accInline" id="certiN">1</h3>&ensp;<h5 class="card-title accInline"><b>Certification</b></h5><p>';
			foot='</p>';
		}else{
			var num=Number($('#certiN').text())+1;
			$('#certiN').text(num);
		}
	}else if(accVal=='Patent'){
		console.log('Patent');
		statement='addpatent.do';
		place='patentDiv';
		if($('#patentN').val()==undefined){
			head='<hr><h3 style="color:dodgerblue;" class="accInline" id="patentN">1</h3>&ensp;<h5 class="card-title accInline"><b>Patents</b></h5><p>';
			foot='</p>';
		}else{
			var num=Number($('#patentN').text())+1;
			$('#patentN').text(num);
		}
	}else if(accVal=='Test Score'){
		console.log('TS');
		statement='addts.do';
		place='tsDiv';
		if($('#tsN').val()==undefined){
			head='<hr><h3 style="color:dodgerblue;" class="accInline" id="tsN">1</h3>&ensp;<h5 class="card-title accInline"><b>Test Score</b></h5><p>';
			foot='</p>';
		}else{
			var num=Number($('#tsN').text())+1;
			$('#tsN').text(num);
		}
	}else{
		return;
	}
	
    $.ajax({
        type:'POST',  
        url:statement,
        data: $('#addAccForm').serialize(),      
        success:function(data){
        	$('#'+place).append(head+data+foot);
            $("#addAcc").modal('toggle');
            probarUpdate2($('#proBar').attr('aria-valuenow'));
            /*var val=probarUpdate($('#proBar').attr('aria-valuenow'));
            console.log(val);
			$(".progress").html(val);*/
        },
        error:function(e){
            $("#addAcc").modal('toggle');
            alert(e.responseText);  
        }
    });
}

function accChanged(){
	var accVal= document.getElementById("accSelect").value;
	if(accVal=='Language'){
		document.getElementById("accBody").innerHTML = "<label class='col-form-label'>Language Name *</label>"+
		"<select class='form-control' name='title' required><option>Chinese</option><option>English</option><option>French</option><option>German</option>"+
		"<option>Italian</option><option>Japanese</option><option>Korean</option><option>Spanish</option></select>";
	}else if(accVal=='Honor & Award'){
		document.getElementById("accBody").innerHTML = ""+
		  "<label class='col-form-label'>Title *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' name='title' required>"+
		  "<label class='col-form-label'>Year *</label><br>"+
		  "<input type='date' name='year' required><br>"+
		  "<label class='col-form-label'>Level *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' name='level' required>";
	}else if(accVal=='Certification'){
		document.getElementById("accBody").innerHTML = ""+
		  "<label class='col-form-label'>Title *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' name='title' required>"+
		  "<label class='col-form-label'>By *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' name='contents' required>";
	}else if(accVal=='Patent'){
		document.getElementById("accBody").innerHTML = ""+
		  "<label class='col-form-label'>Title *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' name ='title' required>"+
		  "<label class='col-form-label'>Patent ID *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' name='contents' required>";
	}else if(accVal=='Test Score'){
		document.getElementById("accBody").innerHTML = ""+
		  "<label class='col-form-label'>Title *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' name='title' required>"+
		  "<label class='col-form-label'>Score *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' name='score' required>"
	}else{
		document.getElementById("accBody").innerHTML = "";
	}
}

function expClose(){
	$('#addExpForm')[0].reset();
}
function eduClose(){
	$('#addEduForm')[0].reset();
}
function skillClose(){
	$('#addSkillForm')[0].reset();
}
function accClose(){
	$('#addAccForm')[0].reset();
	$('#accBody').html('');
}
function probarUpdate(p){
	var html;
	var update=Number(p)+12;
	if(p>86) {
		html="<div id='proBar' class='progress-bar progress-bar-striped progress-bar-animated bg-success' role='progressbar' style='width:100;' aria-valuenow='100' aria-valuemin='0' aria-valuemax='100'></div>";
	}else if(p>61) {
		html="<div id='proBar' class='progress-bar progress-bar-striped progress-bar-animated bg-info' role='progressbar' style='width:"+update+" aria-valuenow="+update+" aria-valuemin='0' aria-valuemax='100'></div>";
	}else if(p>36) {
		html="<div id='proBar' class='progress-bar progress-bar-striped progress-bar-animated' role='progressbar' style='width:"+update+" aria-valuenow="+update+" aria-valuemin='0' aria-valuemax='100'></div>";
	}else if(p>11) {
		html="<div id='proBar' class='progress-bar progress-bar-striped progress-bar-animated bg-warning' role='progressbar' style='width:"+update+" aria-valuenow="+update+" aria-valuemin='0' aria-valuemax='100'></div>";
	}else {
		html="<div id='proBar' class='progress-bar progress-bar-striped progress-bar-animated bg-danger' role='progressbar' style='width:"+update+" aria-valuenow="+update+" aria-valuemin='0' aria-valuemax='100'></div>";
	}
	return html;
}
function probarUpdate2(p){
	var html;
	var update=Number(p)+12;
	if(p>85) {
		$('#proBar').removeClass('bg-info');
		$('#proBar').addClass('bg-success');
		$('#proBar').attr('ara-valuenow',100);
		$('#proBar').attr('style','width:100%;');
		$('#proBarP').text('100%');
	}else if(p>61) {
		$('#proBar').addClass('bg-info');
		$('#proBar').attr('ara-valuenow',update);
		$('#proBar').attr('style','width:'+update+'%;');
		$('#proBarP').text(update+'%');
	}else if(p>36) {
		$('#proBar').removeClass('bg-warning');
		$('#proBar').attr('ara-valuenow',update);
		$('#proBar').attr('style','width:'+update+'%;');
		$('#proBarP').text(update+'%');
	}else if(p>11) {
		$('#proBar').removeClass('bg-danger');
		$('#proBar').addClass('bg-warning');
		$('#proBar').attr('ara-valuenow',update);
		$('#proBar').attr('style','width:'+update+'%;');
		$('#proBarP').text(update+'%');
	}
}
