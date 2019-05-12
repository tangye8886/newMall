<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的售后服务</title>

</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".deleteService").click(function(){
			var id=$(this).attr("lang");
			if(confirm("确定删除该条记录?"))
			{
				$.get("${pageContext.request.contextPath}/after/deleteService.do?id="id,function(data){
					if(data>0)
					{
						alert("删除成功！！");
					}else{
						alert("删除失败！！");
					}
				});
				$(this).parent().remove();
			}
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
					<li><a href="${pageContext.request.contextPath}/after/toService.do">申请售后</a></li>
					<li><a href="${pageContext.request.contextPath}/after/myService.do" style="color:#ff6700;font-weight:bold;">我的售后</a></li>
					<li><a href="${pageContext.request.contextPath}/user/myAddress.do">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div class="rtcont fr">
			<div class="ddzxbt">申请的售后</div>
		
			<c:forEach items="${myServices}" var="service">
		
					<div class="ddxq">
								联系人:${service.username}
                           		电话:${service.tel}
                           		订单编号：${service.orderId}
                           		原因：${service.reason}
                           		结果：<c:if test="${service.status==0}">处理中</c:if> 
                           		<c:if test="${service.status==1}">已解决</c:if>
                           		<a class="deleteService" lang="${service.id}">删除记录</a>
						<div class="clear"></div>
					</div>
					
			</c:forEach>		
		</div>
		<div class="clear"></div>
		</div>
	</div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>