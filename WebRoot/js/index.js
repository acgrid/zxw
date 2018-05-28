//登录验证
function checkLogin(){
	if($("#username").val()==""){
		alert("请输入用户名");
		return false;
	}
	if($("#password").val()==""){
		alert("请输入密码");
		return false;
	}
}
function checkReg2(){
	if($("#ganqing").val()=="-1"){
		alert("请输入感情状态");
		return false;
	}
	
	return true;
	
}
//注册验证
function checkReg(){
	if($("#username1").val()==""){
		alert("请输入用户名");
		return false;
	}
	if($("#password1").val()==""){
		alert("请输入密码");
		return false;
	}
	if($("#password1").val().length<8){
		alert("密码至少8位");
		return false;
	}
	if($("#password1").val()!=$("#password2").val()){
		alert("两次密码不一致");
		return false;
	}
	if($("#shengri").val()==""){
		alert("请输入生日");
		return false;
	}
	if($("#shengao").val()==""){
		alert("请输入身高");
		return false;
	}
	if($("#tizhong").val()==""){
		alert("请输入体重");
		return false;
	}
	if($("#xueli").val()=="-1"){
		alert("请选择学历");
		return false;
	}
	if($("#yuexin").val()==""){
		alert("请输入月薪");
		return false;
	}
	if($("#shouji").val()==""){
		alert("请输入手机号");
		return false;
	}
	if($("#shouji").val().length!=11){
		alert("手机号必须是11位");
		return false;
	}
	if($("#idcard").val()==""){
		alert("请输入身份证号码");
		return false;
	}
	if($("#idcard").val().length!=18){
		alert("身份证号码必须是18位");
		return false;
	}
	if($("#dizhi").val()==""){
		alert("地址不能为空");
		return false;
	}
}

function checkMsg(){
	if($("#msg").val()==""){
		alert("请输入内容");
		return false;
	}
}

