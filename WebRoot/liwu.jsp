<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.util.Const"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>珍心网</title>
<style type="text/css" media="screen">
@import url("css/layout.css");
</style>
<style>
#friends dl{
	float:left;
	padding:2px;
	margin:2px;
	border:1px dashed #333;
	width:130px;
}
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
      <h1>礼物赠送</h1>
      
      <div> <br />
      
     
  
          <table width="90%"  id="friends">
            <tr>
              <td valign="top" align="center" class="body" style="line-height:30px;"><strong>花店列表</strong></td>
            </tr>
            <tr>
             <td valign="top" align="center" class="body">
             	<s:iterator value="list">
	             	<dl>
	             		<dt><img src="<%=Const.ROOT %><s:property value="tupian"/>" style="max-width:100px;" alt=""/></dt>
	             		<dd>
	             			<p><a href="<s:property value="isduihuan"/>">网站：<s:property value="name"/></a></p>
	             		</dd>
	             	</dl>
             	</s:iterator>
             </td>
            </tr>
            
           
          </table>
          
         
      </div>
      <div> <br />
        
      </div>
    </div>
	  <div class="clear"></div>
      
     
   		<div class="find_more_profile">
          <p>&nbsp;</p>
        </div>
  </div>
  <%@include file="footer.jsp" %>
</div>

</body>
</html>
<script>
function zs(id,price,isduihuan,uid){
	if($("#pass"+id).val()==""){
		alert("请输入密码!");
		return false;
	}
	if(isduihuan=="是"){
		if(parseInt('${currentUser.vipjifen}')<price){
			if(confirm("您的积分不足，是否购买?")){
				if(parseInt('${currentUser.vipyue}')<price){
					alert("您的余额不足");
					return false;
				}else{
					location.href="liwu_zs.action?type=1&liwuid="+id+"&num="+price+"&friendid="+uid;
				}
			}
			return false;
		}else{
			location.href="liwu_zs.action?type=0&liwuid="+id+"&num="+price+"&friendid="+uid;
		}
	}else{
		if(parseInt('${currentUser.vipyue}')<price){
			alert("您的余额不足");
			return false;
		}else{
			location.href="liwu_zs.action?type=1&liwuid="+id+"&num="+price+"&friendid="+uid;
		}
	}
}
function toLiwu(id){
	location.href="liwu_liwulist.action?id="+id;
}
</script>
<s:if test="#request.msg!=null">
  	<script>
  		alert("${msg}");
  	</script>
  </s:if>

