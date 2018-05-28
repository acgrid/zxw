<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.util.Const"%>
<
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
      <h1>活动详情</h1>
      
      <div> <br />
          <table width="100%" style="float:left;">
          <tr>
              <td align="left" valign="top" class="body"><strong>  </strong></td>
              <td align="left" valign="top">
              	<img src="<%=Const.ROOT %>${huodong.pic}" style="max-width:500px;" alt="">
              </td>
            </tr>
            <tr>
              <td width="145" align="left" valign="top" class="body"><strong>活动内容:</strong></td>
              <td width="280" align="left" valign="top">${huodong.title}</td>
            </tr>
            <tr>
              <td align="left" valign="top" class="body"><strong>活动时间: </strong></td>
              <td align="left" valign="top">
              	${huodong.htime}
              </td>
            </tr>
            
            
             
            <tr>
              <td></td>
              <td>
              	<s:if test="#session.currentUser==null">
					请先登录再参与活动!
				</s:if>
				<s:else>
					<s:if test="huodong.baomings.size()<10">
						<input type="button" class="button" value="参与" onclick="guanzhu('${huodong.id}')"/>
					</s:if>
					<s:else>
						对不起，该活动报名人数已到10人限制!
					</s:else>
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
	if(confirm("是否参与该活动?")){
		$.getJSON("huodong_baoming.action",{"id":id},function(data){alert(data);});
	}
}
</script>
<s:if test="#request.msg!=null">
  	<script>
  		alert("${msg}");
  	</script>
  </s:if>

