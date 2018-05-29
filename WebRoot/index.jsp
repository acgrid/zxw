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
     
      <div class="partner_search">
        <div class="search_form">
          <h2>搜索会员</h2>
          <form action="user_search.action" method="post">
            <fieldset>
            <div class="search_row">
              <div class="search_column_1">
                <label>性别</label>
              </div>
              <div class="search_column_2">
                <select class="gender" name="sex">
                  <option value="-1">所有</option>
                  <option value="男">男</option>
                  <option value="女">女</option>
                </select>
               </div>
               <div class="search_column_1">
                <label>身高(CM)</label>
                </div>
               <div class="search_column_2">
                <select class="gender" name="shengao">
                  <option value="-1">所有</option>
                  <option value="&lt;170">170以下</option>
                  <option value="between 170 and 180">170-180</option>
                  <option value="between 180 and 190">180-190</option>
                  <option value="&gt;190">190以上</option>
                </select>
                 </div>
               	<div class="search_column_1">
                	<label>体重(KG)</label>
                 </div>
               	<div class="search_column_2">
                <select class="gender" name="tizhong">
                  <option value="-1">所有</option>
                  <option value="&lt;50">50以下</option>
                  <option value="between 50 and 60">50-60</option>
                  <option value="between 60 and 70">60-70</option>
                  <option value="between 70 and 80">70-80</option>
                  <option value="&gt;80">80以上</option>
                </select>
                 </div>
               	<div class="search_column_1">
                	<label>学历</label>
                 </div>
              	 <div class="search_column_2">
                	<select class="gender" name="xueli">
	                  <option value="-1">所有</option>
	                  <option value="初中">初中</option>
	                  <option value="高中">高中</option>
	                  <option value="大专">大专</option>
	                  <option value="本科">本科</option>
	                  <option value="硕士">硕士</option>
	                  <option value="博士">博士</option>
	                  <option value="其他">其他</option>
	                </select>
                 </div>
            </div>
            <div class="search_row">
              <div class="search_column_1">
                <label>月收入</label>
              </div>
              <div class="search_column_2">
                 <select class="gender" name="yuexin">
                  <option value="-1">所有</option>
                  <option value="&lt;3000">3000以下</option>
                  <option value="between 3000 and 5000">3000-5000</option>
                  <option value="between 5000 and 8000">5000-8000</option>
                  <option value="between 8000 and 12000">8000-12000</option>
                  <option value="&gt;12000">12000以上</option>
                </select>
              </div>
              <div class="search_column_1">
                <label>地址</label>
              </div>
              <div class="search_column_2">
              <input type="text" name="address" size="50" style="width:180px;"/>
              </div>
              <div class="search_column_1">&nbsp;</div>
              <div class="search_column_2">
                <input type="image" src="images/search_btn.gif" class="search_btn"/>
              </div>
            </div>  
            </fieldset>
          </form>
        </div>
      </div>
      <div class="last_added">
        <h3>会员列表</h3>
        <s:if test="list.size()==0">
        	
        		<div class="profile_detail">
        			无搜索结果!
        		</div>
        	
        </s:if>
        <s:else>
       <s:iterator value="list" var="user">
        <div class="profile_box"> <span class="photo"><a href="<%=Const.ROOT %>user_detail.action?id=<s:property value="id"/>"><img src="<%=Const.ROOT %><s:property value="tupian"/>" style="max-width:72px;" alt=""></a></span>
          <div class="profile_detail">
            <p>昵称: <span><s:property value="username"/></span>      
    	<s:if test="isyanz==1">
    		<img src="images/huangguan.png" style="max-width:25px;vertical-align:middle" title="认证会员"/> 
    	</s:if>
             <br/>
            	性别: <span><s:property value="sex"/></span><br>
              	生日: <span><s:property value="shengri"/></span><br>
              	所在地: <span><s:property value="dizhi"/></span><br>   
            	<p class="know_more"><a href="<%=Const.ROOT %>user_detail.action?id=<s:property value="id"/>">详细</a></p>
          </div>
        </div>
        </s:iterator>
        </s:else>
      </div>
      
      
      <div class="last_added">
        <h3>活动列表</h3>
        
        	<s:if test="#session.huodongs.size()==0">
        		<div class="profile_detail">
        			没有任何活动!
        		</div>
        	</s:if>
        	<s:else>
        	<div style="background:#5ABDCF;">
        	<marquee direction="left"  onmouseover="this.stop()" onmouseout="this.start()">
        	<div style="width:2100px;height:180px;overflow: hidden;">
	        	<s:iterator value="#session.huodongs" var="huodong">
		        <div style="float:left;margin:5px;"> <span class="photo"><a href="<%=Const.ROOT %>huodong_view.action?id=<s:property value="id"/>"><img title="<s:property value="title"/>" src="<%=Const.ROOT %><s:property value="pic"/>" style="max-width:300px;" alt=""></a></span>
		        </div>
	        	</s:iterator>
	        </div>
	        </marquee>
	        </div>
	        </s:else>
      </div>
    
      
      
      
      <s:if test="#session.currentUser!=null">
      <div class="last_added">
        <h3>推荐会员列表</h3>
         <s:if test="#session.tuijians==null">
        	
        		<div class="profile_detail">
        			无推荐会员，请到<a href="user_my.action">个人中心</a>先完善资料!
        		</div>
        	
        </s:if>
        <s:else>
        	<s:if test="#session.tuijians.size()==0">
        		<div class="profile_detail">
        			按照您的要求未找到推荐会员!
        		</div>
        	</s:if>
        	<s:else>
	        	<s:iterator value="#session.tuijians" var="user">
		        <div class="profile_box"> <span class="photo"><a href="<%=Const.ROOT %>user_detail.action?id=<s:property value="id"/>"><img src="<%=Const.ROOT %><s:property value="tupian"/>" style="max-width:72px;" alt=""></a></span>
		          <div class="profile_detail">
		            <p>昵称: <span><s:property value="username"/></span>      
		    	<s:if test="isyanz==1">
		    		<img src="images/huangguan.png" style="max-width:25px;vertical-align:middle" title="认证会员"/> 
		    	</s:if>
		    	<s:if test="#session.currentUser.vip">
		    		<img src="images/vip.png" style="max-width:25px;vertical-align:middle" title="VIP会员"/> 
		    	</s:if>
		             <br/>
		            	性别: <span><s:property value="sex"/></span><br>
		              	生日: <span><s:property value="shengri"/></span><br>
		              	所在地: <span><s:property value="dizhi"/></span><br>   
		            	<p class="know_more"><a href="<%=Const.ROOT %>user_detail.action?id=<s:property value="id"/>">详细</a></p>
		          </div>
		        </div>
	        	</s:iterator>
	        </s:else>
        </s:else>
       
      </div>
      </s:if>
      
   		<div class="find_more_profile">
          <p>&nbsp;</p>
        </div>
  </div>
  <%@include file="footer.jsp" %>
</div>
</body>
</html>
<s:if test="#request.msg!=null">
  	<script>
  		alert("${msg}");
  	</script>
  </s:if>
