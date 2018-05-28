<%@page import="cn.util.Const"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div class="tpl-left-nav tpl-left-nav-hover">
	<div class="tpl-left-nav-title">
		功能菜单
	</div>
	<div class="tpl-left-nav-list">
		<ul class="tpl-left-nav-menu">
			<li class="tpl-left-nav-item">
				<a href="<%=Const.ROOT %>manage/index.jsp" class="nav-link active"> <i
					class="am-icon-home"></i> <span>首页</span> </a>
			</li>
			<li class="tpl-left-nav-item">
				<a href="javascript:;"
					class="nav-link tpl-left-nav-link-list active"> <i
					class="am-icon-folder"></i> <span>管理员</span> </a>
					<ul class="tpl-left-nav-sub-menu" style="display: block">
						<li>
							<a href="huodong_list.action"> <i
								class="am-icon-angle-right"></i> <span>活动列表</span> </a>	
							<a href="user_list.action"> <i
								class="am-icon-angle-right"></i> <span>会员列表</span> </a>						
							<a href="liwu_list.action"> <i
								class="am-icon-angle-right"></i> <span>鲜花网站列表</span> </a>						
							<a href="<%=Const.ROOT %>manage/updatepwd.jsp"> <i class="am-icon-angle-right"></i>
								<span>密码修改</span> </a>
						</li>
					</ul>
			</li>
			
		</ul>
	</div>
</div>