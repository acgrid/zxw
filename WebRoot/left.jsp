<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.util.Const"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<div id="left_container">
      <div class="user_login">
     	<s:if test="#session.currentUser==null">
			<div class="login_box_left">
	          <h2><img src="images/user_login.gif" alt=""/></h2>
	        </div>
	        <div class="login_box_right">
	        <form action="user_login.action" method="post" onsubmit="return checkLogin()">
	          <label>用户名:</label>
	          <input type="text" name="username" value="" id="username"/>
	          <label>密码:</label>
	          <input type="password" name="password" value="" id="password"/>
	          <input type="image" src="images/login_btn.gif" class="login"/>
	          <p>没有账号！<a href="register.jsp">注册一个</a></p>
	        </form>
	        </div>
		</s:if>
		<s:else>
			<div class="login_box_left">
	          <h2><img src="<%=Const.ROOT %>${currentUser.tupian}" alt=""  style="max-width:80px;"/></h2>
	        </div>
	        <div class="login_box_right">
	          <p>欢迎你:${currentUser.username}
	          <s:if test="#session.currentUser.isyanz==1">
    		<img src="images/huangguan.png" style="max-width:25px;vertical-align:middle" title="认证会员"/> 
    	</s:if></p>
	          <br/><br/><br/>
	          <p><a href="user_logout.action">退出</a></p>
	        </div>
		</s:else>
        
      </div>
    </div>