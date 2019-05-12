<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单提交</title>
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
					<ul>
					<li><a href="${pageContext.request.contextPath}/order/myOrdersByPage.do?pageIndex=1" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
					<li><a href="${pageContext.request.contextPath}/car/mycar.do?pageIndex=1">购物车</a></li>
					<li><a href="${pageContext.request.contextPath}/collect/myCollect.do?pageIndex=1">收藏夹</a></li>
					<li><a href="${pageContext.request.contextPath}/comment/myCommentByPage.do?pageIndex=1">评价管理</a></li>
				</ul>
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
			<div class="ddzxbt">提交订单</div>
			<form action="${pageContext.request.contextPath}/order/addOrder.do" method="post" id="toPayForm" >
			
			<c:forEach items="${items}" var="item">
					<input type="hidden" name="itemId" value="${item.id}"/>
                    <input type="hidden" name="num" value="${item.num}"/>
				<div class="ddxq">
					<div class="ddspt fl"><img src="${pageContext.request.contextPath}/${item.image}" alt="" width="80px" height="80px"></div>
					<div class="ddbh fl">${item.title}</div>
					<div class="ztxx fr">
						<ul>
							<li>${item.num}</li>
							<li>￥${item.price/100}</li>
							<li>2019/05/20 13:30</li>
							<li><a href=""> < 订单商品 </a></li>
							<div class="clear"></div>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
			</c:forEach>
			
			
			<div class="ddxq">
				收货信息：
					<select name="address">
					       <c:forEach items="${addressList}" var="add">
					               <option value="${add.userName} ${add.phone} ${add.postCode} ${add.address}">${add.userName} ${add.phone} ${add.postCode} ${add.address}</option>
					       </c:forEach>
					</select>
				买家备注：
					<textarea rows="3" cols="30" name="buyerMessage"></textarea>
				<div class="clear"></div>
			</div>
			
			
			<div class="ddxq">
					<p style="color:red;float:left" id="allAmount">总数量： ${totalCount}个</p>
                    <p style="color:red;float:left" id="allPrice"> | 总价格 $：${totalPrice}</p>
                     <input style="color:red;float:right" type="submit" name="jiesuan"  value="去结算" id="jiesuan"/>
				<div class="clear"></div>
			</div>
			
				<input type="hidden" name="allAmount" value="${totalCount}"/>
                <input type="hidden" name="allPrice" value="${totalPrice}"/>
			
			</form>
		</div>
		<div class="clear"></div>
		</div>
	</div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>