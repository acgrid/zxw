<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js fixed-layout">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>珍心网后台管理系统</title>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="icon" type="image/png" href="<%=Const.ROOT %>assets/i/favicon.png">
		<link rel="apple-touch-icon-precomposed" href="<%=Const.ROOT %>assets/i/app-icon72x72@2x.png">
		<meta name="apple-mobile-web-app-title" content="Amaze UI" />
		<link rel="stylesheet" href="<%=Const.ROOT %>assets/css/amazeui.min.css" />
		<link rel="stylesheet" href="<%=Const.ROOT %>assets/css/admin.css">
		<link rel="stylesheet" href="<%=Const.ROOT %>assets/css/app.css">
</head>
<body data-type="generalComponents">

		<%@include file="top.jsp" %>

		<div class="tpl-page-container tpl-page-header-fixed">
			<!--左边start-->
			<%@include file="sidebar.jsp" %>
			<!--左边end-->
			<div class="tpl-content-wrapper">
				<!--右边内容start-->
				<ol class="am-breadcrumb">
					<li>
						<a href="#" class="am-icon-home">首页</a>
					</li>
				</ol>
				<div class="tpl-portlet-components">
					<div class="tpl-block">
						<div class="am-g">
							<div class="am-u-sm-12">
								<h1 style="text-align:center;">欢迎使用珍心网后台管理系统</h1>
							</div>

						</div>
					</div>
					<div class="tpl-alert"></div>
				</div>
			</div>
			<!--右边内容end-->
		</div>


		<script src="<%=Const.ROOT %>assets/js/jquery.min.js"></script>
		<script src="<%=Const.ROOT %>assets/js/amazeui.min.js"></script>
		<script src="<%=Const.ROOT %>assets/js/app.js"></script>
	</body>
</html>
