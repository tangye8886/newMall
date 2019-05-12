<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的地址</title>
<style type="text/css">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".editAddress").click(function(){
			var id=$(this).attr("lang");
			var span=$(this).parent().parent().children("span").eq(1);
			var input=span.children("input");
			var userName=input.eq(0);
			var phone=input.eq(1);
			var postCode=input.eq(2);
			var address=input.eq(3);
			userName.removeAttr("readonly");
			phone.removeAttr("readonly");
			postCode.removeAttr("readonly");
			address.removeAttr("readonly");
			var save=$(this).parent().parent().children("span").eq(2).children("a").eq(1);
			$(this).html("");
			save.html("保存");
			
		});
		
		
		$(".saveAddress").click(function(){
			var id=$(this).attr("lang");
			var span=$(this).parent().parent().children("span").eq(1);
			var edit=$(this).parent().parent().children("span").eq(2).children("a").eq(0);
			var input=span.children("input");
			var userName=input.eq(0);
			var phone=input.eq(1);
			var postCode=input.eq(2);
			var address=input.eq(3);
			if(confirm("是否保存修改？"))
			{
				$.get("${pageContext.request.contextPath}/user/updateMyAddress.do?id="+id+"&userName="+userName.val()+"&phone="+phone.val()+"&address="+address.val()+"&postCode="+postCode.val(),function(data){
					if(data>0)
					{
						alert("地址保存成功！！");
					}else 
					{
						alert("地址保存失败！！");
					}
				});
				edit.html("编辑");
				$(this).html("");
			} 
		});
		
		
		
		
		$(".deleteAddress").click(function(){
			var id=$(this).attr("lang");
			if(confirm("是否删除地址？"))
			{
				$.get("${pageContext.request.contextPath}/user/deleteMyAddress.do?id="+id,function(data){
					alert("删除成功");
				});
				$(this).parent().parent().remove();
			}
		});
		
		
		$("#addAddress").click(function(){
			$("#delallpartdialog").css("display", "block");
		});
		
		var city=['广州市','汕头市','深圳市','潮州市'];
		var qu1=['天河区','白云区','增城区','黄浦区','花都区','番禺区','越秀区'];
		var qu2=['金平区','龙湖区','达濠区'];
		var qu3=['福田区','宝安区','罗湖区'];
		var qu4=['饶平县']
		
		$("#province").change(function(){
			$("#city").empty();
			if($(this).val()=='广东省')
			{
				$.each(city,function(i,da){
					$("#city").append("<option value="+da+">"+da+"</option>");
				});
			}
		});
		
		$("#city").change(function(){
			$("#qu").empty();
			if($(this).val()=='广州市')
			{
				$.each(qu1,function(i,value){
					$("#qu").append("<option value="+value+">"+value+"</option>");
				});
			}
			else if($(this).val()=='汕头市')
			{
				$.each(qu2,function(i,value){
					$("#qu").append("<option value="+value+">"+value+"</option>");
				});
			}
			else if($(this).val()=='深圳市')
			{
				$.each(qu3,function(i,value){
					$("#qu").append("<option value="+value+">"+value+"</option>");
				});
			}
			else
			{
				$.each(qu4,function(i,value){
					$("#qu").append("<option value="+value+">"+value+"</option>");
				});
			}
		});
		
		$("#btOk").click(function(){
			var province=$("#province").val();
			var city=$("#city").val();
			var qu=$("#qu").val();
			var address=$("#address").val();
			var code=$("#code").val();
			var phone=$("#phone").val();
			var username=$("#username").val();
			var alladdress=province+city+qu+address;
			$.get("${pageContext.request.contextPath}/user/addMyAddress.do?userName="+username+"&phone="+phone+"&address="+alladdress+"&postCode="+code,function(data){
					alert("添加成功");
			});
			$("#delallpartdialog").css("display", "none");
		});
		
		$("#btNoOk").click(function(){
			$("#delallpartdialog").css("display", "none");
		});
		
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	
	<div class="dialog" id="delallpartdialog">
		    <div class="title">
		       添加地址
		    </div>
		    <div class="content">
		    	<select id="province" size="2">
		    		<option>请选择</option>
		    		<option value="广东省">广东省</option>
		    	</select>
		    	
		    	<select id="city" size="2">
		    		<option>请选择</option>
		    	</select>
		    	
		    	<select id="qu" size="2">
		    		<option>请选择</option>
		    	</select>
		    	
		    	<input type="text" id="username" placeholder="收货人" size="2"/>
		    	<input type="text" id="phone" placeholder="电话" size="8"/>
		    	<input type="text" id="code" placeholder="邮编" size="4"/>
		    	<input type="text" id="address" placeholder="地址"/>
		    	
		    </div>
		    <div class="bottom">
		        <input type="button" value="添加" id="btOk">
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
					<li><a href="${pageContext.request.contextPath}/after/myService.do">我的售后</a></li>
					<li><a href="${pageContext.request.contextPath}/user/myAddress.do" style="color:#ff6700;font-weight:bold;">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div class="rtcont fr">
			<div class="grzlbt ml40">我的地址     <a id="addAddress">+</a></div>
			
			<c:forEach items="${myAddress}" var="add">
				<input type="hidden" id="id" value="${add.id}"/>
				<div class="subgrzl ml40">
				<span>${add.id}</span>
				<span>
				<input type="text" id="userName" name="userName" value="${add.userName}" readonly="readonly" size="4" style="border: none;" />
                <input type="text" id="phone" name="phone" value="${add.phone}" readonly="readonly" style="border: none;"/>
                <input type="text" id="postCode" name="postCode" value="${add.postCode}" readonly="readonly" size="6" style="border: none;"/>
                <input type="text" id="address" name="address" value="${add.address}" readonly="readonly" style="border: none;"/>
				</span>
				<span>
					<a lang="${add.id}" class="editAddress">编辑</a>
					<a lang="${add.id}" class="saveAddress"></a>&nbsp;|&nbsp;
					<a lang="${add.id}" class="deleteAddress">删除</a>
				</span>
				</div>
			</c:forEach>
			
		</div>
		<div class="clear"></div>
		</div>
	</div>
<!-- self_info -->
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>