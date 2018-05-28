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
						鲜花网站列表
					</li>
				</ol>
				<div class="tpl-portlet-components">
					<div class="tpl-block">
					<form action="liwu_list.action" method="post" id="sform">
      				<input type="hidden" name="pageBean.pageNo" value="1" id="pageNo"/>
      				
						<div class="am-g">
								<div class="am-u-sm-12 am-u-md-3">
									<div class="am-btn-group am-btn-group-xs">
										<button type="button"
											class="am-btn am-btn-default am-btn-success" onclick="add()">
											<span class="am-icon-plus"></span> 新增
										</button>
									</div>
								</div>
								<div class="am-u-sm-12 am-u-md-3">
									<div class="am-input-group am-input-group-sm">
										<input type="text" name="name" class="am-form-field">
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
												<th class="table-title">网站名称</th>
												<th class="table-title">图片</th>
												<th class="table-title">网址</th>
												<th class="table-set">操作</th>
											</tr>
										</thead>
										<tbody>
										<s:iterator value="list" status="st">
											<tr>
												<!--行start-->
												<td><s:property value="#st.count"/></td>
												<td><s:property value="name"/></td>
												<td><img src="<%=Const.ROOT %><s:property value="tupian"/>" style="max-width:60px;"/></td>
												<td><s:property value="isduihuan"/></td>
												
												<td>
													<div class="am-btn-toolbar">
														<div class="am-btn-group am-btn-group-xs">
																<button
																	class="am-btn am-btn-default am-btn-xs am-text-secondary" type="button" onclick="toUpdate('<s:property value="id"/>')">
																	<span class="am-icon-trash-o"></span> 编辑
																</button>
																<button
																	class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" type="button" onclick="toDelete('<s:property value="id"/>')">
																	<span class="am-icon-trash-o"></span> 删除
																</button>
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
<!-- 新增对话框begin -->
		<div class="am-modal am-modal-no-btn" tabindex="-1" id="add-modal">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">
					新增网站
					<a href="javascript: void(0)" class="am-close am-close-spin"
						data-am-modal-close>&times;</a>
				</div>
				<div class="am-modal-bd">
					<!-- 新增表单开始 -->
					<form class="am-form" name="addForm" action="liwu_add.action" method="post"
						onsubmit="return checkAdd()">
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3 am-text-right">
								名称
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<input type="text" id="name" name="liwu.name" class="am-input-sm">
							</div>
						</div>
						
								<input type="hidden" id="price" name="liwu.price" value="0" class="am-input-sm">
						
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3 am-text-right">
								网址
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" id="isduihuan" name="liwu.isduihuan" class="am-input-sm">
								
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3 am-text-right">
								图片
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<input type="file" id="fujian" name="fujian" />
                                <input type="hidden" id="tupian" name="liwu.tupian" value="${liwu.tupian}"/> 
								<button type="button" onclick="updateFile()">上传网站LOGO图片</button> 
							</div>
						</div>
						
						<div style="margin-top: 10px;">
							<button type="submit" class="am-btn am-btn-primary am-btn-xs">
								提交保存
							</button>
							<button type="reset" class="am-btn am-btn-primary am-btn-xs">
								放弃保存
							</button>
						</div>
					</form>
					<!-- 新增表单结束 -->
				</div>
			</div>
		</div>
		<!-- 新增对话框 end-->
		<!-- 删除对话框begin -->
		<div class="am-modal am-modal-confirm" tabindex="-1" id="delete_modal">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">
					你，确定要删除这条记录吗？
				</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" data-am-modal-cancel>取消</span>
					<span class="am-modal-btn" data-am-modal-confirm>确定</span>
				</div>
			</div>
		</div>		
		<!-- 删除对话框end -->
		<!-- 修改对话框begin -->
		<div class="am-modal am-modal-no-btn" tabindex="-1" id="update-modal">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">
					修改网站
					<a href="javascript: void(0)" class="am-close am-close-spin"
						data-am-modal-close>&times;</a>
				</div>
				<div class="am-modal-bd">
					<!-- 修改表单begin -->
					<form class="am-form" name="updateForm" action="liwu_update.action"
						method="post" onsubmit="return checkUpdate()">
							<input type="hidden" name="liwu.id" id="id1"/>
							<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3 am-text-right">
								名称
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<input type="text" id="name1" name="liwu.name" class="am-input-sm">
							</div>
						</div>
						
								<input type="hidden" id="price1" value="0" name="liwu.price" class="am-input-sm">
						
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3 am-text-right">
								网址
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
							<input type="text" id="dui1" name="liwu.isduihuan" class="am-input-sm">
							
							</div>
						</div>
						<div class="am-g" style="margin-top: 4px;">
							<div class="am-u-sm-3 am-u-md-3 am-text-right">
								图片
							</div>
							<div class="am-u-sm-9 am-u-md-9 am-u-end col-end">
								<input type="file" id="fujian2" name="fujian" />
                                <input type="hidden" id="tupian1" name="liwu.tupian"/> 
								<button type="button" onclick="updateFile2()">上传网站LOGO图片</button> 
							</div>
						</div>
						<div style="margin-top: 10px;">
							<button type="submit" class="am-btn am-btn-primary am-btn-xs">
								提交保存
							</button>
							<button type="reset" class="am-btn am-btn-primary am-btn-xs">
								放弃保存
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 修改对话框end -->
		<script src="<%=Const.ROOT%>assets/js/jquery.min.js"></script>
		<script src="<%=Const.ROOT%>assets/js/amazeui.min.js"></script>
		<script src="<%=Const.ROOT%>assets/js/app.js"></script>
		<script src="<%=Const.ROOT%>js/ajaxfileupload.js"></script>
		
		<script>

		function add() {
			$("#add-modal").modal({
				width: 700,
				height: 350
			});
		}
		function checkAdd(){
		  	if($("#name").val()==""){
		  		alert("请输入名称");
		  		return false;
		  	}
		  	
		  	return true;
		  }
		
			function toDelete(id) {
				$("#delete_modal").modal({
					relatedTarget: this,
					onConfirm: function(options) {
						//执行删除
						location.href = "liwu_delete.action?id=" + id;
					},
					onCancel: function() {
					}
				});
			}

			

			//上传文件
			  function updateFile(){
				  if($("#fujian").val()==""){
					  alert("请先选择文件!");
				  }else{
				  $.ajaxFileUpload
		          (
		              {
		                  url: '<%=Const.ROOT%>upload.action', //用于文件上传的服务器端请求地址
		                  secureuri: false, //是否需要安全协议，一般设置为false
		                  fileElementId: 'fujian', //文件上传域的ID
		                  success: function (data, status)  //服务器成功响应处理函数
		                  {        	
		                	  $("#tupian").val($(data).find("body").text());
		                	  alert("上传成功，请点击保存！");
		                  },
		                  error: function (data, status, e)//服务器响应失败处理函数
		                  {
		                      alert("上传失败!");
		                  }
		              }
		          );
				  }
		          return false;
		      }

			  function updateFile2(){
				  if($("#fujian2").val()==""){
					  alert("请先选择文件!");
				  }else{
				  $.ajaxFileUpload
		          (
		              {
		                  url: '<%=Const.ROOT%>upload.action', //用于文件上传的服务器端请求地址
		                  secureuri: false, //是否需要安全协议，一般设置为false
		                  fileElementId: 'fujian2', //文件上传域的ID
		                  success: function (data, status)  //服务器成功响应处理函数
		                  {        	
		                	  $("#tupian1").val($(data).find("body").text());
		                	  alert("上传成功，请点击保存！");
		                  },
		                  error: function (data, status, e)//服务器响应失败处理函数
		                  {
		                      alert("上传失败!");
		                  }
		              }
		          );
				  }
		          return false;
		      }
			
			function toUpdate(id){
				$.getJSON("liwu_detail.action",{"id":id},function(data){
					$("#id1").val(id);
					$("#name1").val(data.name);
					$("#price1").val(0);
					$("#tupian1").val(data.tupian);
					
						$("#dui1").val(data.isduihuan);
					
					$("#update-modal").modal({width:500,height:350});
				})
			}
			function doPage(pageNo){
				$("#pageNo").val(pageNo);
				$("#sform").submit();
			}
			
</script>
	</body>

</html>