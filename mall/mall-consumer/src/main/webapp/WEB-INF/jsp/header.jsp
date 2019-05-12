<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>小米商城</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#sousuo").click(function(){
			$("#price").val("");
			$("#sort").val("");
			$("#cat").val("");
			$("#pageIndex").val("1");
			$("#searchForm").submit();
		});
		$("#chongzhi").click(function(){
			$("#price").val("");
			$("#sort").val("1");
			$("#cat").val("");
			$("#pageIndex").val("1");
			$("#searchForm").submit();
		});
		$("#kefu").click(function(){
			window.open('${pageContext.request.contextPath}/user/toChat.do','newwindow','height=600,width=400, top=100,left=560,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=n o, status=no')
		});
		
		$("#title").keyup(function(){
			$.get("${pageContext.request.contextPath}/item/searchItembyTitle.do/"+$(this).val(),function(data){
				if(data.length>0)
				{
					$("#shCstms table").html("");
					$("#shCstms").show();
					$.each(data,function(i,json){
						$("#shCstms table").append("<tr><td class='chosCz'>"+json.name+"</td></tr>");
					});
					
					$(".chosCz").mouseover(function(){
		    			  $(this).css({"background-color":"yellow"});
				    		}).mouseout(function(){
				    			  $(this).css({"background-color":"white"});
				    		}).click(function(){
				    			  $("input[name='title']").val($(this).html());
				    		$("#shCstms").hide();
		       		 });
				}
			});
		});
	
	});
	
	function filter(key,value)
	{
		document.getElementById(key).value="";
		document.getElementById(key).value=value;
		toSearch();
	}
	
	function catSort(key,value)
	{
		document.getElementById('title').value="";
		document.getElementById(key).value="";
		document.getElementById(key).value=value;
		toSearch();
	}
	
	function toSearch()
	{
		document.getElementById("searchForm").submit();
	}
	
	function sortItem()
	{
		var s=document.getElementById('sortSelect').value;
		document.getElementById('sort').value=s;
		toSearch();
	}
	function priceSearch()
	{
		var from=document.getElementById('priceFrom').value;
		var to=document.getElementById('priceTo').value;
		filter("price",from+"-"+to);
	}
	function page(pageIndex)
	{
		document.getElementById('pageIndex').value=pageIndex;
		toSearch();
	}
</script>
	</head>

	<body>
	<!-- start header -->
		<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li><a href="${pageContext.request.contextPath}/item/index.do">THT商城</a></li>
						<c:choose>
                    	<c:when test="${!empty sessionScope.userInfo}">
                    	<li>|</li>
                    		<li><a href="${pageContext.request.contextPath}/order/myOrdersByPage.do?pageIndex=1">我的订单</a></li>
                    	<li>|</li>
                    		<li><a href="${pageContext.request.contextPath}/user/toMyInfo.do">个人中心</a></li>
                    	<li>|</li>
                    		<li><a href="${pageContext.request.contextPath}/after/toService.do">售后服务</a></li>
                    	<li>|</li>
                    		<li><a href="${pageContext.request.contextPath}/collect/myCollect.do?pageIndex=1">收藏夹</a></li>
                    	<li>|</li>
                    		<li><a href="${pageContext.request.contextPath}/user/logout.do">注销</a></li>
                    	<div class="clear"></div>
                    	</c:when>
                    </c:choose>
					
					</ul>
				</div>
				<div class="right fr">
					<div class="gouwuche fr"><a href="${pageContext.request.contextPath}/car/mycar.do?pageIndex=1">购物车</a></div>
					<div class="fr">
						<ul>
						<c:if test="${empty sessionScope.userInfo}">
							<li><a href="${pageContext.request.contextPath}/user/tologin.do">登录</a></li>
							<li>|</li>
							<li><a href="${pageContext.request.contextPath}/user/toRegister.do">注册</a></li>
						</c:if>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
	<!--end header -->

<!-- start banner_x -->
		<div class="banner_x center">
			<a href="${pageContext.request.contextPath}/item/index"><div class="logo fl"></div></a>
			<a href=""><div class="ad_top fl"></div></a>
			<div class="nav fl">
				<ul>
					<li><a onclick="filter('title','苹果')">苹果</a></li>
					<li><a onclick="filter('title','红米')">小米</a></li>
					<li><a onclick="filter('title','平板电脑')">平板·笔记本</a></li>
					<li><a onclick="filter('title','电视')">电视</a></li>
					<li><a onclick="filter('title','盒子影音')">盒子·影音</a></li>
					<li><a onclick="filter('title','路由器')">路由器</a></li>
					<li><a onclick="filter('title','智能硬件')">智能硬件</a></li>
					<li><a href="${pageContext.request.contextPath}/after/toService.do">售后服务</a></li>
					<li><a id="kefu">客服</a></li>
				</ul>
			</div>
			<div class="search fr">
				<form action="${pageContext.request.contextPath}/item/searchlistByPage.do" method="post" id="searchForm">
					<div class="text fl">
						<input id="title" type="text" name="title" value="${title}" class="shuru" autocomplete="off"/>
						<div id="shCstms" style="display: none;position: absolute;background-color: white;width: 500px;margin-top: 20px">
					     <table>
					         <tr><td>data</td></tr>
					     </table>
				     </div> 
					</div>
					<div class="submit fl">
						<input type="submit" class="sousuo" value="搜索"/>
					</div>
					
					<div class="clear"></div>
					 <input type="hidden" name="cat" id="cat" value="${cat}"/>
					<input type="hidden" name="price" id="price" value="${price}"/>
					<input type="hidden" name="sort" id="sort" value="${sort}"/>
					<input type="hidden" name="pageIndex" id="pageIndex" value="${pageIndex}"/>
				</form>
				<div class="clear"></div>
			</div>
		</div>
<!-- end banner_x -->