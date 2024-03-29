<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="cn.util.Const"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>珍心网</title>
<style type="text/css" media="screen">
@import url("css/layout.css");
</style>
<script type="text/javascript" src="<%=Const.ROOT %>js/jquery.js"></script>
<script type="text/javascript" src="<%=Const.ROOT %>js/index.js"></script>
<script type="text/javascript" src="<%=Const.ROOT %>My97DatePicker/WdatePicker.js"></script>
<script src="<%=Const.ROOT%>js/ajaxfileupload.js"></script>
</head>
<body>
<div id="layout">
<%@include file="top.jsp" %>
  <div id="body_container">
    <%@include file="left.jsp" %>
    <div id="right_container">
      <div class="option_detail"> 
	      <span class="register"><a href="register.jsp"><img src="images/pic_1.gif" alt="" border="0" /></a></span> 
	      <span class="profile"><a href="javascript:toURL('user_my.action')"><img src="images/pic_2.gif" alt="" border="0" /></a></span> 
	      <span class="dating"><a href="javascript:toURL('vip.jsp')"><img src="images/pic_3.gif" alt="" border="0" /></a></span> 
      </div>
     </div> 
     
      
      <div id="body_container_inner" style="padding:20px 35px 30px 15px;">
      <h1>VIP模块</h1>
      <s:if test="#session.currentUser!=null">
      <div> <br />
       	<h2>在线充值</h2>
        <form action="user_vip.action" method="post" onsubmit="return checkChong()">
       	 <input name="id" type="hidden" value="${currentUser.id}" />
          <table width="80%">
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>用户名:</strong></td>
              <td width="280" align="left" valign="top">${currentUser.username}</td>
            </tr>
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>当前余额:</strong></td>
              <td width="280" align="left" valign="top">${currentUser.vipyue}元</td>
            </tr>
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>充值金额:</strong></td>
              <td width="280" align="left" valign="top"><input id="vipyue" name="user.vipyue" type="text" size="40" /></td>
            </tr>
            <tr>
              <td align="left" valign="top" class="body"><strong>付款方式: </strong></td>
              <td align="left" valign="top">
              	<input name="a" type="radio" value="中国农业银行" checked="checked"/><img src="images/bank1.png" style="width:130px;height:30px;vertical-align: middle;"/>&nbsp;
              	<input name="a" type="radio" value="中" checked=""/><img src="images/bank2.png" style="width:130px;height:30px;vertical-align: middle;"/>&nbsp;
              	<input name="a" type="radio" value="中国" checked=""/><img src="images/bank3.png" style="width:130px;height:30px;vertical-align: middle;"/>&nbsp;
              	<br/>
              	<input name="a" type="radio" value="中国农" checked=""/><img src="images/bank4.png" style="width:130px;height:30px;vertical-align: middle;"/>&nbsp;
              	<input name="a" type="radio" value="中国农业" checked=""/><img src="images/bank5.png" style="width:130px;height:30px;vertical-align: middle;"/>&nbsp;
              	<input name="a" type="radio" value="中国农业银" checked=""/><img src="images/bank6.png" style="width:130px;height:30px;vertical-align: middle;"/>&nbsp;
              </td>
            </tr>
            <tr>
              <td align="left" valign="top" class="body"><strong>密码:</strong></td>
              <td align="left" valign="top"><input id="password1" name="user.password" type="password" size="40" /></td>
            </tr>
             
            <tr>
              <td></td>
              <td><input type="submit" name="submit" class="button" value="充 值" /></td>
            </tr>
          </table>
        </form>
        
      </div>
      <div> <br />
        <h2>开通会员</h2>
        <form action="user_renew.action" method="post" onsubmit="return checkKai()">
       	 <input name="id" type="hidden" value="${currentUser.id}" />
          <table width="80%">
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>用户名:</strong></td>
              <td width="280" align="left" valign="top">${currentUser.username}</td>
            </tr>
            <tr> 
              <td width="145" align="left" valign="top" class="body"><strong>当前会员有效期:</strong></td>
              <td width="280" align="left" valign="top" id="vipExpireValue"><c:out value="${currentUser.vipexpire}" /></td>
            </tr>
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>VIP会员价格:</strong></td>
              <td width="280" align="left" valign="top"><%=Const.VIP_FEE_PER_MONTH / 100 %>元/月</td>
            </tr>
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>开通/续期月数:</strong></td>
              <td width="280" align="left" valign="top"><input id="vipmonth" name="month" type="number" min="1" value="1" /></td>
            </tr>
            <tr>
              <td align="left" valign="top" class="body"><strong>密码:</strong></td>
              <td align="left" valign="top"><input id="password2" name="user.password" type="password" size="40" /></td>
            </tr>
            <tr>
              <td></td>
              <td><input type="submit" name="submit" class="button" value="开 通" /></td>
            </tr>
          </table>
        </form>
      </div>
      </s:if>
    </div>
      
	  
	  
	  <div class="clear"></div>
      
     
   		<div class="find_more_profile">
          <p>&nbsp;</p>
        </div>
  </div>
  <%@include file="footer.jsp" %>
</div>
<script type="text/javascript">
var expire_display = $("#vipExpireValue"), expire_timestamp = expire_display.text();
if(expire_timestamp){
	expire_date = new Date(parseInt(expire_timestamp) * 1000);
	expire_display.text(expire_date.toLocaleDateString());
}else{
	expire_display.text("当前不是会员");
}
function checkChong(){
	if($("#vipyue").val()==""){
		alert("请输入充值金额!");
		return false;
	}
	if($("#password1").val()==""){
		alert("请输入密码!");
		return false;
	}
}
function checkKai(){
if($("#vipmonth").val()==""){
		alert("请输入开通月数!");
		return false;
	}
	if($("#password2").val()==""){
		alert("请输入密码!");
		return false;
	}
}
</script>
<s:if test="#request.msg!=null">
  	<script>
  		alert("${msg}");
  	</script>
  </s:if>
</body>
</html>


