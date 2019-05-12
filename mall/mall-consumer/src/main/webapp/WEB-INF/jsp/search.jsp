<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品搜索</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<!-- start danpin -->
		<div class="danpin center">
			
			<div class="biaoti center" style="font-size: 15px">
			
				<label>排序 :</label>
                <select id="sortSelect" onchange="sortItem()">
                            <option value="1" <c:if test="${sort=='1'}">selected="selected"</c:if>>综合排序</option>
							<option value="2" <c:if test="${sort=='2'}">selected="selected"</c:if>>按销量升序↑</option>
							<option value="3" <c:if test="${sort=='3'}">selected="selected"</c:if>>按销量降序↓</option>
							<option value="4" <c:if test="${sort=='4'}">selected="selected"</c:if>>按价格升序↑</option>
							<option value="5" <c:if test="${sort=='5'}">selected="selected"</c:if>>按价格降序↓</option>
                </select>
                
              <label>价格区间 :</label>
              <input type="text" size="3" value="${priceFrom}" id="priceFrom" /> -
			  <input type="text" size="3"  value="${priceTo}"id="priceTo"/>
			  <button onclick="priceSearch()">筛选</button>
			  <button id="chongzhi">重置</button>
			
				<div style="float: right;font-size: 15px">
				
					<span class="store-qty"><label>当前页码 :${pageIndex}</label></span>
						
							<c:if test="${!empty pages}">
								<a class="active" onclick="page('1')">首页</a>
							<c:if test="${pageIndex>1}">
								<a onclick="page(${pageIndex-1})"><i class="fa fa-angle-left"></i>上一页</a>
							</c:if>
							<c:if test="${pageIndex<pages}">
								<a onclick="page(${pageIndex+1})"><i class="fa fa-angle-right"></i>下一页</a>
							</c:if>
								<a onclick="page(${pages})">尾页</a>
							</c:if> 
				
				</div>
							
			</div>
			
			
			
				<div class="main center">
						<c:choose>
                      		<c:when test="${!empty itemList}">
                      			<c:forEach items="${itemList}" var="item" begin="0" end="4" varStatus="idxStatus">
			                        <div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
										<div class="sub_mingxing"><a href="${pageContext.request.contextPath}/item/toItemInfo.do?id=${item.id}" target="_blank"><img src="${pageContext.request.contextPath}/${item.image}" alt=""></a></div>
										<div class="pinpai"><a href="${pageContext.request.contextPath}/item/toItemInfo.do?id=${item.id}" target="_blank">${item.title}</a></div>
										<div class="youhui">销量：${item.sellNum}</div>
										<div class="jiage">${item.price/100}元</div>
										<c:if test="${idxStatus.index%4==0 and idxStatus.index!=0}">
										<div class="clear"></div>
									</c:if>
									</div>
		                        </c:forEach>
                      		</c:when>
                      		<c:otherwise>
                      				<li>	
                      					抱歉，暂时没有记录!换个关键词试试
			                        </li>	
                      		</c:otherwise>
                      	</c:choose>
				
				<div class="clear"></div>
			</div>
			
			
				<div class="main center mb20">
				<c:forEach items="${itemList}" var="item" begin="5" end="9">
					<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
						<div class="sub_mingxing"><a href="${pageContext.request.contextPath}/item/toItemInfo.do?id=${item.id}" target="_blank"><img src="${pageContext.request.contextPath}/${item.image}" alt=""></a></div>
						<div class="pinpai"><a href="${pageContext.request.contextPath}/item/toItemInfo.do?id=${item.id}" target="_blank">${item.title}</a></div>
						<div class="youhui">销量：${item.sellNum}</div>
						<div class="jiage">${item.price/100}元</div>
					</div>
				</c:forEach>	
					<div class="clear"></div>
				</div>
			
			

		</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>