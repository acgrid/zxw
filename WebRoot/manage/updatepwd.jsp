<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		<link rel="icon" type="image/png"
			href="<%=Const.ROOT%>assets/i/favicon.png">
		<link rel="apple-touch-icon-precomposed"
			href="<%=Const.ROOT%>assets/i/app-icon72x72@2x.png">
		<meta name="apple-mobile-web-app-title" content="Amaze UI" />
		<link rel="stylesheet"
			href="<%=Const.ROOT%>assets/css/amazeui.min.css" />
		<link rel="stylesheet" href="<%=Const.ROOT%>assets/css/admin.css">
		<link rel="stylesheet" href="<%=Const.ROOT%>assets/css/app.css">
	</head>

	<body data-type="generalComponents">

		<%@include file="top.jsp"%>

		<div class="tpl-page-container tpl-page-header-fixed">
			<!--左边start-->
			<%@include file="sidebar.jsp"%>
			<!--左边end-->
			<div class="tpl-content-wrapper">
				<!--右边内容start-->
				<ol class="am-breadcrumb">
					<li>
						<a href="#" class="am-icon-home">首页</a>
					</li>
					<li class="am-active">
						密码修改
					</li>
				</ol>
				<div class="tpl-portlet-components">
					<div class="tpl-block">
					<!-- 详情开始 -->
					<div class="am-g tpl-amazeui-form">
                        <div class="am-u-sm-12 am-u-md-9">
                            <form class="am-form am-form-horizontal" action="admin_updatepwd.action" method="post" onsubmit="return checkUpdate()">
                            	<input type="hidden" name="id" value="${currentAdmin.id }"/>
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">原始密码</label>
                                    <div class="am-u-sm-9">
                                        <input type="password" id="password" name="password"/>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-email" class="am-u-sm-3 am-form-label">新密码</label>
                                    <div class="am-u-sm-9">
                                        <input type="password" id="password1" name="password1"/>
                                    </div>
                                </div>     
								
								<div class="am-form-group">
                                    <label for="user-email" class="am-u-sm-3 am-form-label">确认新密码</label>
                                    <div class="am-u-sm-9">
                                        <input type="password" id="password2"/>
                                    </div>
                                </div> 
								
                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <button type="submit" class="am-btn am-btn-primary">保存修改</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
					<!-- 详情结束 -->
					</div>
					<div class="tpl-alert"></div>
				</div>
			</div>
			<!--右边内容end-->
		</div>

		
		<script src="<%=Const.ROOT%>js/jquery.js"></script>
		<script src="<%=Const.ROOT%>assets/js/amazeui.min.js"></script>
		<script src="<%=Const.ROOT%>assets/js/app.js"></script>
		<!-- 修改对话框end -->
		<script>
	 //验证
	  function checkUpdate(){
	  	if($("#password").val()==""){
	  		alert("请输入原始密码");
	  		return false;
	  	}
	  	
		if($("#password1").val()==""){
	  		alert("请输入新密码");
	  		return false;
	  	}
	  	if($("#password2").val()!=$("#password1").val()){
	  		alert("两次密码不一致");
	  		return false;
	  	}
	  	
	  	return true;
	  }
	  	
</script>
	<s:if test="#request.msg!=null">
	  	<script>
	  		alert("${msg}");
	  	</script>
	  </s:if>
	</body>

</html>