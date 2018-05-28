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
      
      	<form action="user_update2.action" method="post" onsubmit="return checkReg2()">
      		<input type="hidden" name="id" value="${currentUser.id}"/>
           <table width="50%" style="float:left;">
            <tr>
              <td width="135" align="left" valign="top" class="body"><strong>要求对方性别:</strong></td>
              <td width="280" align="left" valign="top">
              	<input type="radio" name="user.ysex" <c:if test="${currentUser.ysex==null or currentUser.ysex=='男'}">checked</c:if> value="男"/> 男
              	<input type="radio" name="user.ysex" <c:if test="${currentUser.ysex=='女'}">checked</c:if> value="女"/> 女
              </td>
            </tr>
           
            <tr>
              <td align="left" valign="top" class="body"><strong>感情状况:</strong></td>
              <td align="left" valign="top">
              <select id="ganqing" name="user.ganqing">
              	<option value="-1">无</option>
              	<option value="单身">单身</option>
              	<option value="已婚">已婚</option>
              	<option value="离异">离异</option>
              	<option value="丧偶">丧偶</option>
              </select>
              <%--<input id="ganqing" name="user.ganqing" type="text" size="40"  value="${currentUser.ganqing}"/>
              --%>
              </td>
            </tr>
              <tr>
              <td align="left" valign="top" class="body"><strong>兴趣爱好:</strong></td>
              <td align="left" valign="top">
              <input type="checkbox" name="xingqu1" value="游戏"/>游戏 
              <input type="checkbox" name="xingqu1" value="音乐"/>音乐 
              <input type="checkbox" name="xingqu1" value="阅读"/>阅读 
              <input type="checkbox" name="xingqu1" value="明星"/>明星 
              <input type="checkbox" name="xingqu1" value="旅行"/>旅行 
              <br/>     
                                       其他<input id="xingqu" name="xingqu11" type="text" size="20"/>
              </td>
            </tr>
           
           
             <tr>
              <td width="145" align="left" valign="top" class="body"><strong>要求对方身高(CM):</strong></td>
              <td width="280" align="left" valign="top">
               <select class="gender" name="user.yshengao">
                  <option value="-1">无要求</option>
                  <option value="&lt;170">170以下</option>
                  <option value="between 170 and 180">170-180</option>
                  <option value="between 180 and 190">180-190</option>
                  <option value="&gt;190">190以上</option>
                </select>
                </td>
            </tr>
             <tr>
              <td width="145" align="left" valign="top" class="body"><strong>要求对方体重(KG):</strong></td>
              <td width="280" align="left" valign="top">
              <select class="gender" name="user.ytizhong">
                  <option value="-1">无要求</option>
                  <option value="&lt;50">50以下</option>
                  <option value="between 50 and 60">50-60</option>
                  <option value="between 60 and 70">60-70</option>
                  <option value="between 70 and 80">70-80</option>
                  <option value="&gt;80">80以上</option>
                </select>
              </td>
            </tr>
           
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>要求对方月薪:</strong></td>
              <td width="280" align="left" valign="top">
              <select class="gender" name="user.yyuexin">
                  <option value="-1">无要求</option>
                  <option value="&lt;3000">3000以下</option>
                  <option value="between 3000 and 5000">3000-5000</option>
                  <option value="between 5000 and 8000">5000-8000</option>
                  <option value="between 8000 and 12000">8000-12000</option>
                  <option value="&gt;12000">12000以上</option>
                </select>
              </td>
            </tr>
             <tr>
              <td width="145" align="left" valign="top" class="body"><strong>要求对方兴趣爱好:</strong></td>
              <td width="280" align="left" valign="top">
               <input type="checkbox" name="xingqu2" value="游戏"/>游戏 
              <input type="checkbox" name="xingqu2" value="音乐"/>音乐 
              <input type="checkbox" name="xingqu2" value="阅读"/>阅读 
              <input type="checkbox" name="xingqu2" value="明星"/>明星 
              <input type="checkbox" name="xingqu2" value="旅行"/>旅行 
              <br/>     
                                       其他<input id="xingqu" name="xingqu22" type="text" size="20"/>
             </td>
            </tr>
            
            <tr>
              <td><input type="submit" name="submit" class="button" value="完善信息" /></td>
            </tr>
          </table>
        </form>
      
      
          <table width="50%" style="float:right;" id="friends">
            
            
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

