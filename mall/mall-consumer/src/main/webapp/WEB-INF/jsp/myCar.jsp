<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的购物车</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		//删除购物车商品
		$(".remove").click(function(){
			var id=$(this).attr("lang");
			var div=$(this).parent().parent();
			var zongjia=div.children("div").eq(5);
			if(confirm("确定删除？"))
			{
				var p=zongjia.html();//拿到商品总价
				var total=$("#allPrice").html();//拿到全部购物车总价格
				if(total!=0&&total>0)
				{
					$("#allPrice").html(parseFloat(total)-parseFloat(p));  //减去被删除的购物车商品的价格
					$("#hiddenTotalPrice").html(parseFloat(total)-parseFloat(p));
				}
				$.get("${pageContext.request.contextPath}/car/deleteCarItem.do?id="+id,function(data){});
				$(this).parent().parent().remove();
			}
		});
		$(".quanxuan").click(function(){
			var se=this.checked;
			$(".sub_content input[type='checkbox']").prop("checked",se);
			var select=$(".sub_content input:checked");
			var allPrice=0;
			$.each(select,function(i,data){
				allPrice=allPrice+parseFloat(data.value);
			});
			
			var edit=$(".content2 input[type='number']");
			if(se==true)
			{
				$.each(edit,function(i,data){
					data.disabled=true;
				});
			}else{
				$.each(edit,function(i,data){
					data.disabled=false;
				});
			}
			
			$("#amount").html(select.length);
			$("#allPrice").html(allPrice+"元");
			$("#hiddenTotalPrice").val(allPrice);
		});
		
		
		$(".shuliang").change(function(){
			var amount=$(this).val();
			var p=$(this).attr("id");
			var price =p*amount;
			var div=$(this).parent().parent();
			var xiaoji=div.children("div").eq(5);
			var select=div.children("div").eq(0).children();
			xiaoji.html(price+"元");
			select.val(price);
			select.attr("lang",amount);
			var id=$(this).attr("lang");
			$.get("${pageContext.request.contextPath}/car/updateCarAmount.do?id="+id+"&amount="+amount,function(data){
			});
		});
		
		$(".danxuan").click(function(){
			var allPrice=$(this).val();
			var initPrice=$("#allPrice").html();
			var status=this.checked;
			var select=$(".sub_content input:checked");
			var edit=$(this).parent().parent().children("div").eq(4).children();
			if(status==true)
			{
				edit.attr("readonly","readonly");
				$("#hiddenTotalPrice").val(parseFloat(initPrice)+parseFloat(allPrice));
				$("#allPrice").html(parseFloat(initPrice)+parseFloat(allPrice));
			}else 
			{
				$(".quanxuan").removeAttr("checked");
				edit.removeAttr("readonly");
				$("#hiddenTotalPrice").val(parseFloat(initPrice)-parseFloat(allPrice));
				$("#allPrice").html(parseFloat(initPrice)-parseFloat(allPrice));
			}
			$("#amount").html(select.length);
		});
		
		 //提交表单
		 $("#jiesuan").click(function(){
			var totalPrice=$("#hiddenTotalPrice").val();
			var select=$(".sub_content input:checked");
			var it='';
			var amount='';
			if(select.length==0)
			{
				alert('未选中商品');
			}else
			{
				$.each(select,function(i,data){
					if(i!=0)
					{
						it=it+"&";	
						amount=amount+"&";
					}
					it=it+"itemId="+data.id;
					amount=amount+"amount="+data.lang;
				});
				window.location.href="${pageContext.request.contextPath}/order/toSubmitOrder.do?"+it+"&"+amount+"&totalPrice="+totalPrice;
			}
		 });
		 
		 $(".ft20").click(function(){
			 var id=$(this).attr("lang");
			 window.location.href="${pageContext.request.contextPath}/item/toItemInfo.do?id="+id;
		 });
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	
		<div class="banner_x center">
			<div class="wdgwc fl ml40">我的购物车</div>
			<div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
			<div class="dlzc fr">
				<ul>
					<c:if test="${pageInfo.pageNum>1}">
						<li><a style="font-size: 15px;float: right" href="${pageContext.request.contextPath}/car/mycar.do?pageIndex=${pageInfo.pageNum-1}">上一页</a></li>
					</c:if>
					<c:if test="${pageInfo.pageNum<pageInfo.pages}">
						<li>|</li>
						<li><a style="font-size: 15px;float: right" href="${pageContext.request.contextPath}/car/mycar.do?pageIndex=${pageInfo.pageNum+1}">下一页</a></li>	
					</c:if>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	
	
		<div class="xiantiao"></div>
		<div class="gwcxqbj">
			<div class="gwcxd center">
				<div class="top2 center">
					<div class="sub_top fl">
						<input type="checkbox" value="quanxuan" class="quanxuan" />全选
					</div>
					<div class="sub_top fl">商品名称</div>
					<div class="sub_top fl">单价/元</div>
					<div class="sub_top fl">数量</div>
					<div class="sub_top fl">小计</div>
					<div class="sub_top fr">操作</div>
					<div class="clear"></div>
				</div>
					<input type="hidden" name="totalPrice" id="hiddenTotalPrice" value="0"/><!-- 总价格隐藏域 -->
					
					<c:forEach items="${pageInfo.list}" var="car">
						<input type="hidden" name="itemId" value="${car.item.id}" />
						<div class="content2 center">
							<div class="sub_content fl">
								<input type="checkbox" id="${car.item.id}" value="${(car.item.price*car.amount)/100}" lang="${car.amount}" class="danxuan"/>
							</div>
							<div class="sub_content fl"><img width="90" height="90" src="${pageContext.request.contextPath}/${car.item.image}"></div>
							<div class="sub_content fl ft20" lang="${car.item.id}">${car.item.title}</div>
							<div class="sub_content fl ">${car.item.price/100}</div>
							<div class="sub_content fl">
								<input class="shuliang" name="amount" type="number" value="${car.amount}" id="${car.item.price/100}"  min="1" lang="${car.id}" >
							</div>
							<div class="sub_content fl">${(car.item.price*car.amount)/100}</div>
							<div class="sub_content fl"><a class="remove" lang="${car.id}">×</a></div>
							<div class="clear"></div>
						</div>	
					</c:forEach>
			</div>
			<div class="jiesuandan mt20 center">
				<div class="tishi fl ml20">
					<ul>
						<li>
							<a href="${pageContext.request.contextPath}/item/index.do">继续购物</a>
						</li>
						<li>|</li>
						<li>共<span>${count}</span>件商品，已选择<span id="amount">0</span>件</li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="jiesuan fr">
					<div class="jiesuanjiage fl">合计（不含运费）：<span id="allPrice">0元</span></div>
					<div class="jsanniu fr"><input class="jsan" type="submit" name="jiesuan"  value="去结算" id="jiesuan"/></div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			
		</div>

  
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>