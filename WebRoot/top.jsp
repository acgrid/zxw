<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.util.Const"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<script>
function toURL(url){
	<s:if test="#session.currentUser==null">
		alert("请先登录!");
	</s:if>
	<s:else>
		location.href=url;
	</s:else>
}
</script>
  <div id="header"><span class="left_bg"><img src="images/header_bg.gif" alt="" /></span>
    <div id="menu">
      <ul>
        <li class="first"><a class="current" href="<%=Const.ROOT %>user_search.action">首页</a></li>
        <li><a href="register.jsp">注册</a></li>
        <li><a href="javascript:toURL('user_my.action')">个人中心</a></li>
        <li><a href="javascript:toURL('vip.jsp')">VIP模块</a></li>
      
      </ul>
    </div>
    <div id="banner"><img src="images/banner.gif" alt="" /></div>
  </div>