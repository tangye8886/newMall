<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的订单</title>
<style>
*{
	padding: 0;
	margin: 0;
}
.dialog{width:560px;border:1px #666 solid;margin:50px 30%;position:absolute;display:none;z-index:101;}
.dialog .title {background: #333;padding:10px;  color: #fff;  font-weight: bold;  }
.dialog .title img {float: right;}
.dialog .content {background: #fff;padding:25px;height: 60px;}
.dialog .content img {float: left;}
.dialog .content span {float: left;padding:10px;}
.dialog .bottom {text-align: right;padding:10px 10px 10px 0px;background: #eee;}
.dialog .btn {border: #666 1px solid;width:65px;}
</style>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".topay").click(function(){
			var WIDout_trade_no=$(this).attr("lang");
			var WIDtotal_amount=$(this).attr("title");
			var WIDsubject=$(this).attr("lang");
			var WIDbody=$(this).attr("lang");
			window.location.href="${pageContext.request.contextPath}/order/aliPay.do?WIDout_trade_no="+WIDout_trade_no+"&WIDtotal_amount="+WIDtotal_amount+"&WIDsubject="+WIDsubject+"&WIDbody="+WIDbody;	
		});

		$(".tuiKuan").click(function(){
			var id=$(this).attr("id");
			$("#orderId").val(id);
			$("#delallpartdialog").css("display","block");
		});
		
		$(".quxiaoTuikuan").click(function(){
			var id=$(this).attr("id");
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
		
		

		$("#btOk").click(function(){
			var id=$("#orderId").val();
			var reason=$("#reason").val();
			$.get("${pageContext.request.contextPath}/order/applicationTuiKuan.do?id="+id+"&reason="+reason,function(data){
				if(data>0)
				{
					alert("申请退款成功，请等待平台处理！");
				}else
				{
					alert("申请退款失败，请重试！");
				} 
			});
			
			$("#delallpartdialog").css("display", "none");
		});
		
		$("#btNoOk").click(function(){
			$("#delallpartdialog").css("display", "none");
		});
		
		$(".shouhuo").click(function(){
			var id=$(this).attr("id");
			alert(id);
			if(confirm("是否确认收货？"))
			{
				$.get("${pageContext.request.contextPath}/order/shouhuo.do?id="+id,function(data){
					if(data>0)
					{
						alert("收货成功，期待你的下次光临！！")
					}
				});
			} 
		});
		
		$(".delMycom").click(function(){
			var orderid=$(this).attr("lang");
			var id=$(this).attr("title");
			alert(id);
			if(confirm("是否删除评价？"))
			{
				$.get("${pageContext.request.contextPath}/comment/deleteComment.do?orderNo="+orderid+"&id="+id,function(data){
					if(data>0)
					{
						alert("删除评价成功！");
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	
	<div class="dialog" id="delallpartdialog">
		    <div class="title">
		       退款申请
		    </div>
		    <div class="content">
		    			<input type="hidden" id="orderId" size="2"/>
		    	退款原因： <select id="reason" >
				    		<option value="不想要了">不想要了</option>
				    		<option value="信息填写错误">信息填写错误</option>
				    		<option value="商品没有现货">商品没有现货</option>
				    	</select>
		    </div>
		    <div class="bottom">
		        <input type="button" value="申请退款" id="btOk">
		        <input type="button" value="取消" id="btNoOk">
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
			<div class="ddzxbt">交易订单
					<c:if test="${pageInfo.pageNum>1}">
						<a style="font-size: 15px;float: right" href="${pageContext.request.contextPath}/order/myOrdersByPage.do?pageIndex=${pageInfo.pageNum-1}">上一页</a>
					</c:if>
					&nbsp;&nbsp;&nbsp;
					<c:if test="${pageInfo.pageNum<pageInfo.pages}">
						<a style="font-size: 15px;float: right" href="${pageContext.request.contextPath}/order/myOrdersByPage.do?pageIndex=${pageInfo.pageNum+1}">下一页</a>
					</c:if>
			</div>
			
			<c:choose>
              <c:when test="${!empty pageInfo.list}">
               <c:forEach items="${pageInfo.list}" var="order" varStatus="idx">
					<div class="ddxq">
						<div class="ddspt fl"><img src="${pageContext.request.contextPath}/images/order.png" width="80" height="80" alt=""></div>
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
								<li>￥${order.payment}</li>
								<li>
									<c:if test="${order.status!=5 and order.status!=6 and order.status!=1}">
					                                       	<a class="tuiKuan" lang="${order.orderId}" id="${order.id}" >申请退款</a>
					                                       </c:if>
					                                       <c:if test="${order.status==4}">
					                                       	 <a class="shouhuo"  id="${order.id}" style="float: right;text-decoration:none">确认收货</a>
					                                       </c:if>
					                                       <c:if test="${order.status==6}">
					                                       	 <a class="delMycom" lang="${order.orderId}" id="${order.id}" title="${order.id}">删除评价</a>
					                                       </c:if>
					                                       <c:if test="${order.status==7}">
					                                       	 <a>退款中</a>
					                                       </c:if>
								 <c:if test="${order.status==1}">
					                 <a class="topay" lang="${order.orderId}" title="${order.payment}" id="${order.id}">立即付款</a>
					              </c:if>
					             </li>
								<li><a href="${pageContext.request.contextPath}/order/orderInfo.do?orderId=${order.orderId}">详情</a></li>
								<div class="clear"></div>
							</ul>
						</div>
						<div class="clear"></div>
					</div>
				</c:forEach>
                        </c:when>
                      <c:otherwise>
			                <h2>暂无订单，快去买买买</h2>
                      </c:otherwise>
                  </c:choose>
		</div>
		
		
		<div class="clear"></div>
		
		</div>
		
		
	</div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>