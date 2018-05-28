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
      <h1>个人中心</h1>
      
      <div> <br />
      
      	<form action="user_update.action" method="post" onsubmit="return checkReg()">
      		<input type="hidden" name="id" value="${currentUser.id}"/>
           <table width="40%" style="float:left;">
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>用户名:</strong></td>
              <td width="280" align="left" valign="top"><input id="username1" name="user.username" type="text" size="40" value="${currentUser.username}"/></td>
            </tr>
           
            <tr>
              <td align="left" valign="top" class="body"><strong>密码:</strong></td>
              <td align="left" valign="top"><input id="password1" name="user.password" type="password" size="40"  value="${currentUser.password}"/></td>
            </tr>
             <tr>
              <td align="left" valign="top" class="body"><strong>确认密码:</strong></td>
              <td align="left" valign="top"><input id="password2" type="password" size="40" /></td>
            </tr>
            <tr>
              <td align="left" valign="top" class="body"><strong>性别: </strong></td>
              <td align="left" valign="top">
              	<input name="user.sex" type="radio" value="男" <c:if test="${currentUser.sex=='男'}">checked="checked"</c:if>/>男
              	<input name="user.sex" type="radio" value="女" <c:if test="${currentUser.sex=='女'}">checked="checked"</c:if>/>女
              </td>
            </tr>
            <tr>
              <td align="left" valign="top" class="body"><strong> 生日: </strong></td>
              <td align="left" valign="top"><input id="shengri" name="user.shengri" class="Wdate" type="text"  value="${currentUser.shengri}" size="40" onclick="WdatePicker()"/></td>
            </tr>
            <tr>
              <td align="left" valign="top" class="body"><strong> 头像: </strong></td>
              <td align="left" valign="top">
              	<img src="<%=Const.ROOT %>${currentUser.tupian}" style="max-width:300px;" alt="">
              	<input type="file" id="fujian" name="fujian" />
                <input type="hidden" id="tupian" name="user.tupian" value="${currentUser.tupian}"/> 
                <button type="button" onclick="updateFile()">上传头像</button>
              </td>
            </tr>
             <tr>
              <td width="145" align="left" valign="top" class="body"><strong>身高(CM):</strong></td>
              <td width="280" align="left" valign="top"><input id="shengao" name="user.shengao" value="${currentUser.shengao}" type="text" size="40" /></td>
            </tr>
             <tr>
              <td width="145" align="left" valign="top" class="body"><strong>体重(KG):</strong></td>
              <td width="280" align="left" valign="top"><input id="tizhong" name="user.tizhong" value="${currentUser.tizhong}" type="text" size="40" /></td>
            </tr>
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>学历:</strong></td>
              <td width="280" align="left" valign="top">
              	<select id="xueli" name="user.xueli">
	                  <option value="-1">请选择</option>
	                  <option value="初中" <s:if test="#session.currentUser.xueli=='初中'">selected</s:if>>初中</option>
	                  <option value="高中" <s:if test="#session.currentUser.xueli=='高中'">selected</s:if>>高中</option>
	                  <option value="大专" <s:if test="#session.currentUser.xueli=='大专'">selected</s:if>>大专</option>
	                  <option value="本科" <s:if test="#session.currentUser.xueli=='本科'">selected</s:if>>本科</option>
	                  <option value="硕士" <s:if test="#session.currentUser.xueli=='硕士'">selected</s:if>>硕士</option>
	                  <option value="博士" <s:if test="#session.currentUser.xueli=='博士'">selected</s:if>>博士</option>
	                  <option value="其他" <s:if test="#session.currentUser.xueli=='其他'">selected</s:if>>其他</option>
	                </select>
              </td>
            </tr>
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>月薪:</strong></td>
              <td width="280" align="left" valign="top"><input id="yuexin" name="user.yuexin" value="${currentUser.yuexin}" type="text" size="40" /></td>
            </tr>
             <tr>
              <td width="145" align="left" valign="top" class="body"><strong>手机号:</strong></td>
              <td width="280" align="left" valign="top"><input id="shouji" name="user.shouji" value="${currentUser.shouji}" type="text" size="40" /></td>
            </tr>
             <tr>
              <td align="left" valign="top" class="body"><strong> 地址: </strong></td>
              <td align="left" valign="top"><textarea id="dizhi" name="user.dizhi" cols="32" rows="2">${currentUser.dizhi}</textarea></td>
            </tr>
            <tr>
              <td><input type="submit" name="submit" class="button" value="修 改" /></td>
              <td><input type="buttin" name="button" onclick="location.href='my2.jsp'" class="button" value="完善个人资料" /></td>
            </tr>
          </table>
        </form>
      
      
          <table width="50%" style="float:right;" id="friends">
            <tr>
              <td valign="top" align="center" class="body" style="line-height:30px;"><strong>我的关注</strong></td>
            </tr>
            <tr>
             <td valign="top" align="center" class="body">
             	<s:iterator value="user.guanzhus">
	             	<dl>
	             		<dt><img src="<%=Const.ROOT %><s:property value="frienduser.tupian"/>" style="width:100px;max-height:100px" alt=""/></dt>
	             		<dd>
	             			<p><s:property value="frienduser.username"/></p>
	             			<p>
	             				<input type="button" name="submit" class="button" value="送礼" onclick="toLiwu('<s:property value="frienduser.id"/>')"/>
	             				<input type="button" name="submit" class="button" value="悄悄话" onclick="toLiaotian('<s:property value="frienduser.id"/>')" />
	             			</p>
	             		</dd>
	             	</dl>
             	</s:iterator>
             </td>
            </tr>
            
            <tr>
              <td valign="top" align="center" class="body" style="line-height:30px;"><strong>我的粉丝</strong></td>
            </tr>
            <tr>
             <td valign="top" align="center" class="body">
             	<s:iterator value="user.fans">
	             	<dl>
	             		<dt><img src="<%=Const.ROOT %><s:property value="myuser.tupian"/>" style="width:100px;max-height:100px" alt=""/></dt>
	             		<dd>
	             			<p><s:property value="myuser.username"/></p>
	             			<p>
	             				<input type="button" name="submit" class="button" value="送礼" onclick="toLiwu('<s:property value="myuser.id"/>')"/>
	             				<input type="button" name="submit" class="button" value="悄悄话" onclick="toLiaotian('<s:property value="myuser.id"/>')" />
	             			</p>
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
function toLiwu(id){
	location.href="liwu_liwulist.action?id="+id;
}
function toLiaotian(id){
	location.href="message_list.action?id="+id;
}
</script>
<s:if test="#request.msg!=null">
  	<script>
  		alert("${msg}");
  	</script>
  </s:if>

