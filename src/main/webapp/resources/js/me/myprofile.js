function openEditIntroModal(){
	 $("#editIntro").modal();
}

function openAddExpModal(){
	 $("#addExp").modal();
}

function openAddEduModal(){
	 $("#addEdu").modal();
}

function openAddSkillModal(){
	 $("#addSkill").modal();
}

function openAddAccModal(){
	 $("#addAcc").modal();
}

function accChanged(){
	var accVal= document.getElementById("accSelect").value;
	if(accVal=='Language'){
		document.getElementById("accBody").innerHTML = "<label class='col-form-label' for='inputDefault'>Language Name *</label>"+
		"<select class='form-control'><option>Chinese</option><option>English</option><option>French</option><option>German</option>"+
		"<option>Italian</option><option>Japanese</option><option>Korean</option><option>Spanish</option></select>";
	}else if(accVal=='Honor & Award'){
		document.getElementById("accBody").innerHTML = ""+
		  "<label class='col-form-label' for='inputDefault'>Title *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' id='inputDefault'>"+
		  "<label class='col-form-label' for='inputDefault'>Contents *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' id='inputDefault'>";
	}else if(accVal=='Certification'){
		document.getElementById("accBody").innerHTML = ""+
		  "<label class='col-form-label' for='inputDefault'>Title *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' id='inputDefault'>"+
		  "<label class='col-form-label' for='inputDefault'>By *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' id='inputDefault'>";
	}else if(accVal=='Patent'){
		document.getElementById("accBody").innerHTML = ""+
		  "<label class='col-form-label' for='inputDefault'>Title *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' id='inputDefault'>"+
		  "<label class='col-form-label' for='inputDefault'>Id *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' id='inputDefault'>";
	}else if(accVal=='Test Score'){
		document.getElementById("accBody").innerHTML = ""+
		  "<label class='col-form-label' for='inputDefault'>Title *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' id='inputDefault'>"+
		  "<label class='col-form-label' for='inputDefault'>Score *</label>"+
		  "<input type='text' class='form-control' placeholder='Default input' id='inputDefault'>"
	}else{
		document.getElementById("accBody").innerHTML = "";
	}
}