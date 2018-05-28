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
      <h1>会员详情</h1>
      
      <div> <br />
          <table width="40%" style="float:left;">
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>用户名:</strong></td>
              <td width="280" align="left" valign="top">${user.username}</td>
            </tr>
            <tr>
              <td align="left" valign="top" class="body"><strong>性别: </strong></td>
              <td align="left" valign="top">
              	${user.sex}
              </td>
            </tr>
            <tr>
              <td align="left" valign="top" class="body"><strong> 生日: </strong></td>
              <td align="left" valign="top">${user.shengri}</td>
            </tr>
            <tr>
              <td align="left" valign="top" class="body"><strong> 头像: </strong></td>
              <td align="left" valign="top">
              	<img src="<%=Const.ROOT %>${user.tupian}" style="max-width:300px;" alt="">
              </td>
            </tr>
             <tr>
              <td width="145" align="left" valign="top" class="body"><strong>身高(CM):</strong></td>
              <td width="280" align="left" valign="top">${user.shengao}</td>
            </tr>
             <tr>
              <td width="145" align="left" valign="top" class="body"><strong>体重(KG):</strong></td>
              <td width="280" align="left" valign="top">${user.tizhong}</td>
            </tr>
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>学历:</strong></td>
              <td width="280" align="left" valign="top">
              	${user.xueli}
              </td>
            </tr>
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>月薪:</strong></td>
              <td width="280" align="left" valign="top">${user.yuexin}</td>
            </tr>
             <tr>
              <td width="145" align="left" valign="top" class="body"><strong>手机号:</strong></td>
              <td width="280" align="left" valign="top">${user.shouji}</td>
            </tr>
             <tr>
              <td align="left" valign="top" class="body"><strong> 地址: </strong></td>
              <td align="left" valign="top">${user.dizhi}</td>
            </tr>
            <tr>
              <td></td>
              <td>
              	<s:if test="#session.currentUser==null">
					请先登录再进行关注!
				</s:if>
				<s:else>
					<input type="button" class="button" value="关注" onclick="guanzhu('${user.id}')"/>
				</s:else> 	
              </td>
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

</body>
</html>
<script>
function guanzhu(id){
	if(confirm("是否关注该用户?")){
		location.href="user_guanzhu.action?id="+id;
	}
}
</script>
<s:if test="#request.msg!=null">
  	<script>
  		alert("${msg}");
  	</script>
  </s:if>

