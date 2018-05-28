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
      <h1>悄悄话</h1>
      
      <div> <br />
      
      	<form action="message_add.action" method="post" onsubmit="return checkMsg()">
      	   <input type="hidden" name="message.myuser.id" value="${currentUser.id}"/>
      	   <input type="hidden" name="message.frienduser.id" value="${requestScope.uid}"/>
           <table width="40%" style="float:left;">
             <tr>
              <td align="left" valign="top" class="body"><strong> 悄悄话内容: </strong></td>
              <td align="left" valign="top"><textarea id="msg" name="message.msg" cols="32" rows="5"></textarea></td>
            </tr>
            <tr>
              <td></td>
              <td><input type="submit" name="submit" class="button" value="发送" /></td>
            </tr>
          </table>
        </form>
      
      
          <table width="50%" style="float:right;" id="friends">
            <tr>
              <td colspan="2" valign="top" align="center" class="body" style="line-height:30px;"><strong>悄悄话记录</strong></td>
            </tr>
            <s:iterator value="list">
            <tr>
	            <td valign="top" align="center" class="body">
	            	<s:property value="myuser.username"/> 发给 <s:property value="frienduser.username"/>
	            	&nbsp;
	            	<s:property value="msgtime"/>
	            </td>
	           
             <td valign="top" align="center" class="body">
             	<s:property value="msg"/>
             </td>
            </tr>
            </s:iterator>
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
function guanzhu(id){
	if(confirm("是否关注该用户?")){
		location.href="user_guanzhu.action?id="+id;
	}
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
                //alert($(data).find("body").text());      	
          	  $("#tupian").val($(data).find("body").text());
          	  alert("上传成功，请填写完其他信息后保存！");
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
function toLiwu(){
	location.href="liwu_liwulist.action";
}
function toLiaotian(){
	location.href="message_list.action";
}
</script>
<s:if test="#request.msg!=null">
  	<script>
  		alert("${msg}");
  	</script>
  </s:if>

