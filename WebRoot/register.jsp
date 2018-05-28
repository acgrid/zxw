<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
      <h1>会员注册</h1>
      
      <div> <br />
       
        <form action="user_add.action" method="post" onsubmit="return checkReg()">
          <table width="80%">
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>用户名:</strong></td>
              <td width="280" align="left" valign="top"><input id="username1" name="user.username" type="text" size="40" /></td>
            </tr>
           
            <tr>
              <td align="left" valign="top" class="body"><strong>密码:</strong></td>
              <td align="left" valign="top"><input id="password1" name="user.password" type="password" size="40" /></td>
            </tr>
             <tr>
              <td align="left" valign="top" class="body"><strong>确认密码:</strong></td>
              <td align="left" valign="top"><input id="password2" type="password" size="40" /></td>
            </tr>
            <tr>
              <td align="left" valign="top" class="body"><strong>性别: </strong></td>
              <td align="left" valign="top">
              	<input name="user.sex" type="radio" value="男" checked="checked"/>男
              	<input name="user.sex" type="radio" value="女" />女
              </td>
            </tr>
            <tr>
              <td align="left" valign="top" class="body"><strong> 生日: </strong></td>
              <td align="left" valign="top"><input id="shengri" name="user.shengri" class="Wdate" type="text" size="40" onclick="WdatePicker()"/></td>
            </tr>
            <tr>
              <td align="left" valign="top" class="body"><strong> 头像: </strong></td>
              <td align="left" valign="top">
              	<input type="file" id="fujian" name="fujian" />
                <input type="hidden" id="tupian" name="user.tupian"/> 
                <button type="button" onclick="updateFile()">上传头像</button>
              </td>
            </tr>
             <tr>
              <td width="145" align="left" valign="top" class="body"><strong>身高(CM):</strong></td>
              <td width="280" align="left" valign="top"><input id="shengao" name="user.shengao" type="text" size="40" /></td>
            </tr>
             <tr>
              <td width="145" align="left" valign="top" class="body"><strong>体重(KG):</strong></td>
              <td width="280" align="left" valign="top"><input id="tizhong" name="user.tizhong" type="text" size="40" /></td>
            </tr>
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>学历:</strong></td>
              <td width="280" align="left" valign="top">
              	<select id="xueli" name="user.xueli">
	                  <option value="-1">请选择</option>
	                  <option value="初中">初中</option>
	                  <option value="高中">高中</option>
	                  <option value="大专">大专</option>
	                  <option value="本科">本科</option>
	                  <option value="硕士">硕士</option>
	                  <option value="博士">博士</option>
	                  <option value="其他">其他</option>
	                </select>
              </td>
            </tr>
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>月薪:</strong></td>
              <td width="280" align="left" valign="top"><input id="yuexin" name="user.yuexin" type="text" size="40" /></td>
            </tr>
             <tr>
              <td width="145" align="left" valign="top" class="body"><strong>手机号:</strong></td>
              <td width="280" align="left" valign="top"><input id="shouji" name="user.shouji" type="text" size="40" /></td>
            </tr>
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>身份证号码:</strong></td>
              <td width="280" align="left" valign="top"><input id="idcard" name="user.idcard" type="text" size="40" /></td>
            </tr>
             <tr>
              <td align="left" valign="top" class="body"><strong> 地址: </strong></td>
              <td align="left" valign="top"><textarea id="dizhi" name="user.dizhi" cols="32" rows="2"></textarea></td>
            </tr>
            <tr>
              <td></td>
              <td><input type="submit" name="submit" class="button" value="注 册" /></td>
            </tr>
          </table>
        </form>
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
<script type="text/javascript">
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
</script>
</body>
</html>


