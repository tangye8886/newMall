<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品详情</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
		$("#addCar").click(function(){
			var itemId=$(this).attr("lang");
			var amount=$(".shuliang").val();
			$.get("${pageContext.request.contextPath}/car/addCar.do?id="+itemId+"&amount="+amount,function(data){
				if(data>0)
				{
					alert("加入购物车成功!");
				}else
				{
					alert("加入失败，您还没登陆！！");
				}
			}); 
		});
		$(".shuliang").change(function(){
			var amount=$(this).val();
			var price=$("#price1").html();
			var all=amount*price;
			$("#price2").html("总计："+all+" 元");
		});
		
		$("#toSubmit").click(function(){
			var itemId=$(this).attr("lang");
			var amount=$(".shuliang").val();
			var price=$("#price1").html();
			window.location.href="${pageContext.request.contextPath}/order/toSubmitOrder.do?itemId="+itemId+"&amount="+amount+"&totalPrice="+amount*price;
		});
		
		
		$("#addCollect").click(function(){
			var itemNo=$(this).attr("lang");
			$.get("${pageContext.request.contextPath}/collect/addCollect.do?itemNo="+itemNo,function(data){
				if(data>0){
					$("#addCollect").html("已收藏❤");
				}
				else alert("您还未登录，收藏失败！");
			});
		});
		
		$("#flagCollect").click(function(){
			var itemNo=$(this).attr("lang");
			var content=$(this).html();			
			if(content=='已收藏❤')
			{
				$.get("${pageContext.request.contextPath}/collect/deleteCollect.do?itemNo="+itemNo,function(data){
					if(data>0){
						$("#flagCollect").html("加入我的收藏❤");
					}
					else alert("您还未登录，取消失败！");
				});
			}else
			{
				$.get("${pageContext.request.contextPath}/collect/addCollect.do?itemNo="+itemNo,function(data){
					if(data>0){
						$("#flagCollect").html("已收藏❤");
					}
					else alert("您还未登录，取消失败！");
				});
			}
		});
		
		
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<!-- xiangqing -->
	<form action="post" >
	<div class="xiangqing">
		<div class="neirong w">
			<div class="xiaomi6 fl">商品详情</div>
			<nav class="fr">
				<c:if test="${flag==1}">
					<li><a id="flagCollect" lang="${itemInfo.id}">已收藏❤</a></li>
					<li>|</li>
				</c:if>
				<c:if test="${flag==0}">
					<li><a id="addCollect" lang="${itemInfo.id}">加入我的收藏❤</a></li>
					<li>|</li>
				</c:if>
				<li><a>已有
				<c:if test="${empty collectNum}">
					0
				</c:if>
				<c:if test="${!empty collectNum}">
					${collectNum}
				</c:if>人收藏❤
				</a></li>
				<div class="clear"></div>
			</nav>
			<div class="clear"></div>
		</div>	
	</div>
	
	<div class="jieshao mt20 w">
		<div class="left fl"><img width="540" height="550" src="${pageContext.request.contextPath}/${itemInfo.image}"></div>
		<div class="right fr">
			<div class="h3 ml20 mt20">${itemInfo.title}</div>
			<div class="jianjie mr40 ml20 mt10">${itemInfo.sellPoint} <p>${itemInfo.sellDesc}</p></div>
			<div class="jiage ml20 mt10">${itemInfo.price/100}元</div>
			<div class="ft20 ml20 mt20">数量</div>
			<div class="xzbb ml20 mt10">
				
				<div class="sub_content fl">
					<input style="font-size: 20px" class="shuliang" name="amount" type="number" value="1"  min="1" >
				</div>
				
				<div class="clear"></div>
			</div>
			<div class="ft20 ml20 mt20">颜色</div>
			<div class="xzbb ml20 mt10">
				<div class="banben">
					<a>
						<span class="yuandian"></span>
						<span class="yanse">默认</span>
					</a>
				</div>
			</div>
			
			<div class="xqxq mt20 ml20">
				<div class="top1 mt10">
					<div class="left1 fl" id="itemSize">${itemInfo.title}</div>
					<div class="right1 fr" id="price1">${itemInfo.price/100}</div>
					<div class="clear"></div>
				</div>
				<div class="bot mt20 ft20 ftbc" id="price2">总计：${itemInfo.price/100}元</div>
			</div>
			<div class="xiadan ml20 mt20">
					<input class="jrgwc"  type="button" name="jrgwc" lang="${itemInfo.id}" id="toSubmit" value="立即选购" />
					<input class="jrgwc" type="button" name="jrgwc" lang="${itemInfo.id}" id="addCar" value="加入购物车" />
			</div>
		</div>
		<div class="clear"></div>
	</div>
	</form>
	
	<div style="margin-top: 60px;width: 100%;height: 400px;">
			<div style="margin: 10px auto;width: 50%;height: 400px;float: left;">
				<h1 style="margin: 2px auto;width: 200px;height: 30px;color:red;">视频展示</h1>
				<div  style="margin: 20px auto;width: 350px;height: 300px;">
					
					<video src="https://vod.300hu.com/4c1f7a6atransbjngwcloud1oss/32063280166971356909985793/v.f30.mp4?dockingId=821d3d6a-3da5-4141-82dd-b78656b18bf1&storageSource=3" controls="controls" width="350" height="350">
					
					</video>
				
				</div>
			</div>
			
			<div style="margin: 10px auto;width: 49%;height: 400px;float: left;	">
				<h1 style="margin: 2px auto;width: 200px;height: 30px;color:red;">买家评价</h1>
				<div  style="margin: 20px auto;width: 800px;height: 350px;">
				<ul style="margin:10px auto;font-size: 15px;font-weight: bold;width: 800px;height: 300px;">
					<c:choose>
		          		<c:when test="${!empty comments}">
		          			<c:forEach items="${comments}" var="comment">
					<li style="text-align:center;color:orange;height: 30px;width: 800px;">${comment.content}  物流：${comment.code}分&nbsp;服务：${comment.service}分&nbsp; 质量: ${comment.quelify}分&nbsp;</li>
							</c:forEach>
		          		</c:when>
		          		<c:otherwise>
			            	<li style="text-align:center;color:orange;height: 30px;width: 800px;">暂时没有评价，赶快下单抢沙发！</li>
		          		</c:otherwise>
		            </c:choose>
				</ul>
				</div>
			</div>
			
			<div class="clear"></div>
	</div>
	
	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>