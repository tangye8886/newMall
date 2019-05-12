<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	padding: 0;
	margin: 0;
}
.dialog{width:560px;border:1px #666 solid;margin:50px 30%;position:absolute;display:none;z-index:101;}
.dialog .title {background: #333;padding:10px;  color: #fff;  font-weight: bold;  }
.dialog .title img {float: right;}
.dialog .content {background: #fff;padding:25px;height: 130px;}
.dialog .content img {float: left;}
.dialog .content span {float: left;padding:10px;}
.dialog .bottom {text-align: right;padding:10px 10px 10px 0px;background: #eee;}
.dialog .btn {border: #666 1px solid;width:65px;}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/star.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#quxiaoTuikuan").click(function(){
		var id=$(this).attr("lang");
		if(confirm("确认要撤销申请?"))
		{
			$.get("${pageContext.request.contextPath}/order/quxiaoTuiKuan.do?id="+id,function(data){
				if(data>0)
				{
					alert("取消成功!!");	
				}else{
					alert("操作失败!!");	
				}
			});
		}
	});
	
	$(".deleteOrder").click(function(){
		var div=$(this).parent();
		var a=div.children("a").eq(0);
		var id=a.attr("id");
		var orderid=a.attr("lang");
		if(confirm("是否删除订单？"))
		{
			$.get("${pageContext.request.contextPath}/order/deleteOreder.do?id="+id+"&orderid="+orderid,function(data){
				if(data==1)
				{
					alert("删除成功");	
				}else{
					alert("删除失败");	
				}
			});
			div.remove();
		}
	});
	
	
	$("#tocomment").click(function(){
		$("#commentDialog").css("display","block");
	});
	
	$("#commentOk").click(function(){
		$("#CommentForm").submit();
		$("#commentDialog").css("display", "none");
	});
	
	$("#commentNoOk").click(function(){
		$("#commentDialog").css("display", "none");
	});
});
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	
	<div class="dialog" id="commentDialog">
		    <div class="title">
		       评价
		    </div>
		    <div class="content">
		    <form action="${pageContext.request.contextPath}/comment/addComment.do" method="post" id="CommentForm">
		    	<input type="hidden" id="orderNo" name="orderNo" value="${order.orderId}"/>
		    	<input id="rating" name="service" value="0" type="hidden">
				<input id="taste" name="code" value="0" type="hidden">
				<input id="environment" name="quelify" value="0" type="hidden">
				
				<input name="id" value="${order.id}" type="hidden">
				
		    	<c:if test="${order.status==5}">
		    		<c:forEach items="${order.orderItemList}" var="orderItem">
	                     <input type="hidden" id="itemId" name="itemId" value="${orderItem.itemId}" />
                    
                    	<textarea style="margin-bottom: 20px" rows="2" cols="70" name="content" id="content">
		    						
		    			</textarea>
                    </c:forEach>
		    	</c:if>
		    	
		    
		    </form>
		     	
		<ul class="Star">
        <li><span class="number">*</span>服务态度<span class="Select"> 
        <a onMouseOver="javascript:setProfix('star_');showStars(1,'rating');"
         onMouseOut="javascript:setProfix('star_');clearStars('rating');" 
         href="javascript:setProfix('star_');setStars(1,'rating');">
         <img id="star_1" title="差(1)" src="${pageContext.request.contextPath}/images/icon_star_1.gif"></a>
         
          <a onMouseOver="javascript:setProfix('star_');showStars(2,'rating');"
          onMouseOut="javascript:setProfix('star_');clearStars('rating');"
           href="javascript:setProfix('star_');setStars(2,'rating');">
           <img id="star_2" title="一般(2)" src="${pageContext.request.contextPath}/images/icon_star_1.gif"></a>
           
           <a onMouseOver="javascript:setProfix('star_');showStars(3,'rating');" 
           onMouseOut="javascript:setProfix('star_');clearStars('rating');"
            href="javascript:setProfix('star_');setStars(3,'rating');">
            <img id="star_3" title="好(3)" src="${pageContext.request.contextPath}/images/icon_star_1.gif"></a>
            
            <a onMouseOver="javascript:setProfix('star_');showStars(4,'rating');" 
            onMouseOut="javascript:setProfix('star_');clearStars('rating');" 
            href="javascript:setProfix('star_');setStars(4,'rating');">
            <img id="star_4" title="很好(4)" src="${pageContext.request.contextPath}/images/icon_star_1.gif"></a>
            
            <a onMouseOver="javascript:setProfix('star_');showStars(5,'rating');"
             onMouseOut="javascript:setProfix('star_');clearStars('rating');" 
             href="javascript:setProfix('star_');setStars(5,'rating');">
             <img id="star_5" title="非常好(5)" src="${pageContext.request.contextPath}/images/icon_star_1.gif"></a></span></li>
             
             
        
        <li><span class="number">*</span>物流速度<span class="Select"> 
        <a onMouseOver="javascript:setProfix('taste_');showStars(1,'taste');" 
        onMouseOut="javascript:setProfix('taste_');clearStars('taste');"
         href="javascript:setProfix('taste_');setStars(1,'taste');">
         <img id="taste_1" title="差(1)" src="${pageContext.request.contextPath}/images/icon_star_1.gif"></a>
         
        <a onMouseOver="javascript:setProfix('taste_');showStars(2,'taste');"
         onMouseOut="javascript:setProfix('taste_');clearStars('taste');" 
         href="javascript:setProfix('taste_');setStars(2,'taste');">
         <img id="taste_2" title="一般(2)" src="${pageContext.request.contextPath}/images/icon_star_1.gif"></a>
         
        <a onMouseOver="javascript:setProfix('taste_');showStars(3,'taste');" 
        onMouseOut="javascript:setProfix('taste_');clearStars('taste');" 
        href="javascript:setProfix('taste_');setStars(3,'taste');">
        <img id="taste_3" title="好(3)" src="${pageContext.request.contextPath}/images/icon_star_1.gif"></a>
        
        <a onMouseOver="javascript:setProfix('taste_');showStars(4,'taste');" 
        onMouseOut="javascript:setProfix('taste_');clearStars('taste');" 
        href="javascript:setProfix('taste_');setStars(4,'taste');">
        <img id="taste_4" title="很好(4)" src="${pageContext.request.contextPath}/images/icon_star_1.gif"></a>
        
        <a onMouseOver="javascript:setProfix('taste_');showStars(5,'taste');" 
        onMouseOut="javascript:setProfix('taste_');clearStars('taste');" 
        href="javascript:setProfix('taste_');setStars(5,'taste');">
        <img id="taste_5" title="非常好(5)" src="${pageContext.request.contextPath}/images/icon_star_1.gif"></a> </span></li>
        
        
        
        
        <li><span class="number">*</span>商品质量<span class="Select"> 
        <a onMouseOver="javascript:setProfix('environment_');showStars(1,'environment');" 
        onMouseOut="javascript:setProfix('environment_');clearStars('environment');"
         href="javascript:setProfix('environment_');setStars(1,'environment');">
        <img id="environment_1" title="差(1)" src="${pageContext.request.contextPath}/images/icon_star_1.gif"></a>
        
        <a onMouseOver="javascript:setProfix('environment_');showStars(2,'environment');" 
        onMouseOut="javascript:setProfix('environment_');clearStars('environment');"
         href="javascript:setProfix('environment_');setStars(2,'environment');">
         <img id="environment_2" title="一般(2)" src="${pageContext.request.contextPath}/images/icon_star_1.gif"></a>
         
         <a onMouseOver="javascript:setProfix('environment_');showStars(3,'environment');" 
         onMouseOut="javascript:setProfix('environment_');clearStars('environment');"
          href="javascript:setProfix('environment_');setStars(3,'environment');">
         <img id="environment_3" title="好(3)" src="${pageContext.request.contextPath}/images/icon_star_1.gif"></a>
         
         <a onMouseOver="javascript:setProfix('environment_');showStars(4,'environment');" 
         onMouseOut="javascript:setProfix('environment_');clearStars('environment');"
          href="javascript:setProfix('environment_');setStars(4,'environment');">
         <img id="environment_4" title="很好(4)" src="${pageContext.request.contextPath}/images/icon_star_1.gif"></a>
         
         <a onMouseOver="javascript:setProfix('environment_');showStars(5,'environment');" 
         onMouseOut="javascript:setProfix('environment_');clearStars('environment');" 
         href="javascript:setProfix('environment_');setStars(5,'environment');">
         <img id="environment_5" title="非常好(5)" src="${pageContext.request.contextPath}/images/icon_star_1.gif"></a> </span></li>
  
            
      </ul>
		    	
		    </div>
		    <div class="bottom">
		        <input type="button" value="立即评价" id="commentOk">
		        <input type="button" value="取消" id="commentNoOk">
		    </div>
		</div>
	
	
	<!-- self_info -->
	<div class="grzxbj">
		<div class="selfinfo center">
		<div class="lfnav fl">
			<div class="ddzx">订单中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="${pageContext.request.contextPath}/order/myOrdersByPage.do?pageIndex=1" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
					<li><a href="${pageContext.request.contextPath}/car/mycar.do?pageIndex=1">购物车</a></li>
					<li><a href="${pageContext.request.contextPath}/collect/myCollect.do?pageIndex=1">收藏夹</a></li>
					<li><a href="${pageContext.request.contextPath}/comment/myCommentByPage.do?pageIndex=1">评价管理</a></li>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="${pageContext.request.contextPath}/user/toMyInfo.do">个人中心</a></li>
					<li><a href="${pageContext.request.contextPath}/after/toService.do">申请售后</a></li>
					<li><a href="${pageContext.request.contextPath}/after/myService.do">我的售后</a></li>
					<li><a href="${pageContext.request.contextPath}/user/myAddress.do">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div class="rtcont fr">
			<div class="ddzxbt">订单详情</div>
	
            <c:forEach items="${order.orderItemList}" var="orderItem">
					<div class="ddxq">
						<div class="ddspt fl"><img src="${pageContext.request.contextPath}/${orderItem.picPath}" alt="" width="80" height="80"></div>
						<div class="ddbh fl">订单号:${order.orderId}</div>
						<div class="ztxx fr">
							<ul>
								<li> <c:if test="${order.status==1}">未支付</c:if> 
					                  <c:if test="${order.status==2}">已支付</c:if>
					                  <c:if test="${order.status==3}">未发货</c:if>
					                  <c:if test="${order.status==4}">已发货</c:if>
					                  <c:if test="${order.status==5}">待评价</c:if>
					                  <c:if test="${order.status==6}">已评价</c:if>
					                  <c:if test="${order.status==7}">待退款</c:if> 
					                  <c:if test="${order.status==8}">已退款</c:if>
					                  <c:if test="${order.status==9}">交易完成</c:if>
					             </li>
								<li>￥${orderItem.price/100}</li>
								<li>${orderItem.num}</li>
								<li><a class="deleteOrder" lang="${order.orderId}" id="${order.id}">删除订单</a></li>
								<div class="clear"></div>
							</ul>
						</div>
						<div class="clear"></div>
					</div>
				</c:forEach>
			
			<div class="ddxq">收货地址：
								${order.orderShipping.receiverName}
                                ${order.orderShipping.receiverPhone}
                                ${order.orderShipping.receiverState}
                                ${order.orderShipping.receiverCity}
                                ${order.orderShipping.receiverDistrict}
                                ${order.orderShipping.receiverAddress}
                                ${order.orderShipping.receiverZip}
					<span style="float: right;color:red">实际付款 ￥： ${order.payment}&nbsp;&nbsp;</span> 
			 <c:if test="${order.status==5}">
		             <a id="tocomment">立即评价</a>
		       </c:if> 
		        
		         <c:if test="${order.status==7}">
		             <a id="quxiaoTuikuan" lang="${order.id}">撤销申请退款</a>
		        </c:if>  
				
				<div class="clear"></div>
			</div>
			
			  <c:if test="${order.status==6}">
	 <h2 style="color:red">评价</h2>
		                        
		              <c:forEach items="${comments}" var="comment">
			               <p style="align-content: center;padding-left: 25%">
			    	   ${comment.content}&nbsp; |&nbsp;
			                    物流${comment.code}分&nbsp; |&nbsp;
			                    服务${comment.service}分&nbsp; |&nbsp;
			                    质量${comment.quelify}分&nbsp; |&nbsp;
			                </p>
		               </c:forEach>
		         </c:if>            
			
			
		</div>
		<div class="clear"></div>
		</div>
	</div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>