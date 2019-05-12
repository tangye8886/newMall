<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I支付页面</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#toPay").click(function(){
			$("#toPayForm").submit();
		});
	});
</script>
	
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	
	<!-- self_info -->
	<div class="grzxbj">
		<div class="selfinfo center">
		<div class="lfnav fl">
			<div class="ddzx">订单中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="${pageContext.request.contextPath}/order/myOrdersByPage.do?pageIndex=1" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
					<li><a href="${pageContext.request.contextPath}/car/mycar.do">购物车</a></li>
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
			<div class="ddzxbt">订单流水</div>
			 <form  action="${pageContext.request.contextPath}/order/aliPay.do" method="post" id="toPayForm"
			target="_blank">
			<div class="ddxq">
				商户订单号 ：<span style="color:red">${WIDout_trade_no}</span>
                <input type="hidden" id="WIDout_trade_no" name="WIDout_trade_no" value="${WIDout_trade_no}"/>
				订单名称 ：<span style="color:red">${WIDout_trade_no}</span>
                 <input type="hidden" id="WIDsubject" name="WIDsubject" value="${WIDout_trade_no}"/>
				<div class="clear"></div>
			</div>
			<div class="ddxq">
				付款金额 ：<span style="color:red">${WIDtotal_amount}</span>
                  <input type="hidden" id="WIDtotal_amount" name="WIDtotal_amount" value="${WIDtotal_amount}" />
				<div class="clear"></div>
			</div>
			<div class="ddxq">
				商品描述：<span style="color:red">${WIDbody}</span>
                  <input type="hidden" id="WIDbody" name="WIDbody" value="${WIDbody}" />
				<div class="clear"></div>
			</div>
			<div class="ddxq">
				<a id="toPay" class="primary-btn order-submit">立即支付</a>
				<div class="clear"></div>
			</div>
		 </form> 
		</div>
		<div class="clear"></div>
		</div>
	</div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>