<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.util.Const"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>珍心网后台管理系统</title>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="<%=Const.ROOT%>assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="<%=Const.ROOT%>assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="<%=Const.ROOT%>assets/css/amazeui.min.css" />
  <link rel="stylesheet" href="<%=Const.ROOT%>assets/css/admin.css">
  <link rel="stylesheet" href="<%=Const.ROOT%>assets/css/app.css">
</head>

<body data-type="login">

  <div class="am-g myapp-login">
	<div class="myapp-login-logo-block  tpl-login-max">
		<div class="myapp-login-logo-text">
			<div class="myapp-login-logo-text">
				珍心网后台管理系统<span> 登录</span> <i class="am-icon-skyatlas"></i>
				
			</div>
		</div>

		<div class="login-font">
			<i> <a href="javascript:add()" style="color:#FFF;"></a> </i>
		</div>
		<div class="am-u-sm-10 login-am-center">
			<form class="am-form" action="admin_login.action" method="post" id="userForm">
				<fieldset>
					<div class="am-form-group" style="margin-bottom:5px;">
						<input type="text" id="username" name="username" style="border-radius:5px;" placeholder="输入用户名" required/>
					</div>
					<div class="am-form-group" style="margin-bottom:5px;">
						<input type="password" id="password" name="password" style="border-radius:5px;" placeholder="请输入密码" required/>
					</div>
					
					<p><button type="button" id="loginBtn" class="am-btn am-btn-default">登录</button></p>
				</fieldset>
			</form>
		</div>
	</div>
</div>

	

  <script src="<%=Const.ROOT%>assets/js/jquery.min.js"></script>
  <script src="<%=Const.ROOT%>assets/js/amazeui.min.js"></script>
  <script src="<%=Const.ROOT%>assets/js/app.js"></script>
  <script>
  $(function(){
	  $("#loginBtn").click(function(){
		  var username=$("#username").val();
		  var password=$("#password").val();
		  var role=$("#role").val();
		  if(username==""){
			  alert("请输入用户名");
			  return false;
		  }
		  if(password==""){
			  alert("请输入密码");
			  return false;
		  }
		  if(role=="-1"){
			  alert("请选择身份");
			  return false;
		  }
		  $("#userForm").submit();
	  });
	 
  });
	
  </script>
  <s:if test="#request.msg!=null">
  	<script>
  		alert("${msg}");
  	</script>
  </s:if>
</body>

</html>