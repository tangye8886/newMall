<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".deleteCollect").click(function(){
			var id=$(this).attr("lang");
			 if(confirm("确定移除？"))
			{
				$.get("${pageContext.request.contextPath}/collect/deleteCollectByid.do?id="+id,function(data){
					
				});
				$(this).parent().parent().parent().parent().remove();
			}
		});
		
		$(".toItemInfo").click(function(){
			var id=$(this).attr("lang");
			window.location.href="${pageContext.request.contextPath}/item/toItemInfo.do?id="+id;
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
					<li><a href="${pageContext.request.contextPath}/collect/myCollect.do?pageIndex=1" style="color:#ff6700;font-weight:bold;">收藏夹</a></li>
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
			<div class="ddzxbt">收藏夹
					<c:if test="${pageInfo.pageNum>1}">
						<a style="font-size: 15px;float: right" href="${pageContext.request.contextPath}/collect/myCollect.do?pageIndex=${pageInfo.pageNum-1}">上一页</a>
					</c:if>
					&nbsp;&nbsp;&nbsp;
					<c:if test="${pageInfo.pageNum<pageInfo.pages}">
						<a style="font-size: 15px;float: right" href="${pageContext.request.contextPath}/collect/myCollect.do?pageIndex=${pageInfo.pageNum+1}">下一页</a>
					</c:if>
			</div>
		
						<c:choose>
                        	<c:when test="${!empty pageInfo.list}">
		                        <c:forEach items="${pageInfo.list}" var="collect">
		
					<div class="ddxq">
						<div class="ddspt fl toItemInfo" lang="${collect.item.id}"><img src="${pageContext.request.contextPath}/${collect.item.image}" width="80" height="80" alt=""></div>
						<div class="ddbh fl toItemInfo" lang="${collect.item.id}">${collect.item.title}</div>
			               <div class="ztxx fr">
									<ul>
										<li>编号：${collect.itemNo}</li>
										<li>价格：${collect.item.price/100}</li>
										<li>
										<c:if test="${collect.status==1}">已收藏♥</c:if>
										</li>
										<li><a class="deleteCollect" lang="${collect.id}">取消收藏</a></li>
										<div class="clear"></div>
									</ul>
								</div>
					</div>
					
					 </c:forEach>	
                        	</c:when>
                        	<c:otherwise>
                        		<li>
		                            <div class="step-title"> <span class="number"></span>
		                            	暂时没有收藏的商品
		                            </div>
		                        </li>
                        	</c:otherwise>
                        </c:choose>
		</div>
		<div class="clear"></div>
		</div>
	</div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>