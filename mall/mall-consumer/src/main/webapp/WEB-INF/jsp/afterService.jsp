<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>售后服务</title>

</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>

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
					<li><a href="${pageContext.request.contextPath}/order/myOrdersByPage.do?pageIndex=1">我的订单</a></li>
					<li><a href="${pageContext.request.contextPath}/car/mycar.do?pageIndex=1">购物车</a></li>
					<li><a href="${pageContext.request.contextPath}/collect/myCollect.do?pageIndex=1">收藏夹</a></li>
					<li><a href="${pageContext.request.contextPath}/comment/myCommentByPage.do?pageIndex=1">评价管理</a></li>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="${pageContext.request.contextPath}/user/toMyInfo.do">个人中心</a></li>
					<li><a href="${pageContext.request.contextPath}/after/toService.do" style="color:#ff6700;font-weight:bold;">申请售后</a></li>
					<li><a href="${pageContext.request.contextPath}/after/myService.do">我的售后</a></li>
					<li><a href="${pageContext.request.contextPath}/user/myAddress.do">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div class="rtcont fr">
			<div class="ddzxbt">售后服务</div>
				<form action="${pageContext.request.contextPath}/after/addService.do" method="post" enctype="multipart/form-data"/>
		
					<div class="ddxq">
						<input  name="username" id="username"  class="txt requiredField" placeholder="姓名" />
						<input name="tel" id="tel" class="txtarea requiredField" placeholder="联系电话"></input>
						<input name="orderId" id="orderId" class="txtarea requiredField" placeholder="订单号"></input>
						<div class="clear"></div>
					</div>
					
					<div class="ddxq">
						 <textarea name="reason" id="reason" class="txtarea requiredField" placeholder="原因" cols="60" rows="3"></textarea>
						 <input name="file" type="file"/>
						<div class="clear"></div>
					</div>
					
					<div class="ddxq">
						<button name="submit" id="appSubmit" type="submit">申请售后</button>
					</div>
					
				</form>
		</div>
		<div class="clear"></div>
		</div>
	</div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>