<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
						会员列表
					</li>
				</ol>
				<div class="tpl-portlet-components">
					<div class="tpl-block">
					<form action="user_list.action" method="post" id="sform">
      				<input type="hidden" name="pageBean.pageNo" value="1" id="pageNo"/>
      				
						<div class="am-g">
								<div class="am-u-sm-12 am-u-md-3">
									<div class="am-btn-group am-btn-group-xs">
										<%--<button type="button"
											class="am-btn am-btn-default am-btn-success" onclick="add()">
											<span class="am-icon-plus"></span> 新增
										</button>
									--%></div>
								</div>
								<div class="am-u-sm-12 am-u-md-3">
									<div class="am-input-group am-input-group-sm">
										<input type="text" name="username" class="am-form-field">
										<span class="am-input-group-btn">
											<button
												class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search"
												type="submit"></button> </span>
									</div>
								</div>
						</div>
						<div class="am-g">
							<div class="am-u-sm-12">
									<table
										class="am-table am-table-striped am-table-hover table-main">
										<thead>
											<tr>
												<th class="table-id">编号</th>
												<th class="table-title">用户名</th>
												<th class="table-title">性别</th>
												<th class="table-title">电话</th>
												<th class="table-title">所在地</th>
												<th class="table-title">身份证号码</th>
												<th class="table-title">是否验证通过</th>
												<th class="table-set">操作</th>
											</tr>
										</thead>
										<tbody>
										<s:iterator value="list" status="st">
											<tr>
												<!--行start-->
												<td><s:property value="#st.count"/></td>
												<td><s:property value="username"/></td>
												<td><s:property value="sex"/></td>
												<td><s:property value="shouji"/></td>
												<td><s:property value="dizhi"/></td>
												<td><s:property value="idcard"/></td>
												<td><s:property value="isyanz==1?'已通过':'未通过'"/></td>
												
												<td>
													<div class="am-btn-toolbar">
														<div class="am-btn-group am-btn-group-xs">
																<button
																	class="am-btn am-btn-default am-btn-xs am-text-secondary" type="button" onclick="location.href='http://id.weixingmap.com/'")">
																	<span class="am-icon-edit"></span> 身份证验证
																</button>
																<s:if test="isyanz==0">
																<button
																	class="am-btn am-btn-default am-btn-xs am-text-secondary" type="button" onclick="toUpdate('<s:property value="id"/>')">
																	<span class="am-icon-edit"></span> 是否通过
																</button>
																</s:if>
														</div>
													</div>
												</td>
											</tr>
											</s:iterator>
											<!--行end-->
										</tbody>
									</table>
									<div class="am-cf">
										<div class="am-fr">
											<ul class="am-pagination tpl-pagination">
												<li>
													<a href="javascript:doPage('${pageBean.prePage }')">上一页</a>
												</li>
												<li>
													<a href="javascript:doPage('${pageBean.nextPage }')">下一页</a>
												</li>
											</ul>
										</div>
									</div>
									<hr>
							</div>
						</div>
					</form>
					</div>
					<div class="tpl-alert"></div>
				</div>
			</div>
			<!--右边内容end-->
		</div>

		<!-- 删除对话框begin -->
		<div class="am-modal am-modal-confirm" tabindex="-1" id="delete_modal">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">
					验证是否通过？
				</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" data-am-modal-cancel>否</span>
					<span class="am-modal-btn" data-am-modal-confirm>是</span>
				</div>
			</div>
		</div>		
	
		<script src="<%=Const.ROOT%>assets/js/jquery.min.js"></script>
		<script src="<%=Const.ROOT%>assets/js/amazeui.min.js"></script>
		<script src="<%=Const.ROOT%>assets/js/app.js"></script>
		<script src="<%=Const.ROOT%>js/ajaxfileupload.js"></script>
		
		<script>
		
			function toUpdate(id) {
				$("#delete_modal").modal({
					relatedTarget: this,
					onConfirm: function(options) {
						//执行删除
						location.href = "user_tongguo.action?id=" + id;
					},
					onCancel: function() {
					}
				});
			}

		
			function doPage(pageNo){
				$("#pageNo").val(pageNo);
				$("#sform").submit();
			}
			
</script>
	</body>

</html>