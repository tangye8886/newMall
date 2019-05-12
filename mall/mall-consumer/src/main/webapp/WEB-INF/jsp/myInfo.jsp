<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
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
		
		var password=$("#passwordHidden").val();
		var pwd=password.substring(0, 3);
		$("#password").val(pwd+"****");
		$("#modifyInfo").click(function(){
			$("#username").removeAttr("readonly");
			$("#phone").removeAttr("readonly");
			$("#email").removeAttr("readonly");
			$("#save").html("保存");
		});
		$("#save").click(function(){
			var u=$("#username").val();
			var p=$("#phone").val();
			var e=$("#email").val();
			$.get("${pageContext.request.contextPath}/user/updateUserInfo.do?username="+u+"&email="+e+"&phone="+p,function(data){
				if(data>0)
				{
					alert("保存成功!");
					$("#username").val(u);
					$("#phone").val(p);
					$("#email").val(e);
					$("#username").attr("readonly","readonly");
					$("#phone").attr("readonly","readonly");
					$("#email").attr("readonly","readonly");
					$("#save").html("THT");
				}
			});
			
		});
		
		$("#modifyPwd").click(function(){
			$("#delallpartdialog").css("display", "block");
		});
		
		$("#btOk").click(function(){
			var p1=$("#newpwd").val();
			var p2=$("#newpwd2").val();
			if(p1!=p2)
			{
				alert("密码不一致!")
			}else 
			{
				if(confirm("确定修改?"))
				{
					$.get("${pageContext.request.contextPath}/user/updateMypwd.do?pwd="+p1,function(data){
						if(data==1)
						{
							$("#password").val(p1.substring(0, 3)+"****");
							alert("修改成功!");
						}
					});
				}
			}
		});
		$("#btOk").click(function(){
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
		    
		    	新密码: <input type="password" id="newpwd"/>
		    	确认密码:<input type="password" id="newpwd2"/>
		    	
		    </div>
		    <div class="bottom">
		        <input type="button" value="修改" id="btOk">
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
					<ul>
					<li><a href="${pageContext.request.contextPath}/order/myOrdersByPage.do?pageIndex=1">我的订单</a></li>
					<li><a href="${pageContext.request.contextPath}/car/mycar.do?pageIndex=1">购物车</a></li>
					<li><a href="${pageContext.request.contextPath}/collect/myCollect.do?pageIndex=1">收藏夹</a></li>
					<li><a href="${pageContext.request.contextPath}/comment/myCommentByPage.do?pageIndex=1">评价管理</a></li>
				</ul>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="${pageContext.request.contextPath}/user/toMyInfo.do" style="color:#ff6700;font-weight:bold;">个人中心</a></li>
					<li><a href="${pageContext.request.contextPath}/after/toService.do">申请售后</a></li>
					<li><a href="${pageContext.request.contextPath}/after/myService.do">我的售后</a></li>
					<li><a href="${pageContext.request.contextPath}/user/myAddress.do">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div class="rtcont fr">
			<div class="grzlbt ml40">我的资料</div>
			<div class="subgrzl ml40">
			<span>昵称</span><span>
			<input type="text" style="border: none;font-size: 20px" readonly="readonly" id="username" name="username" value="${userInfo.username}" /></span><span><a href="">THT</a></span></div>
			<div class="subgrzl ml40">
			<span>手机号</span><span>
			<input type="text" style="border: none;font-size: 20px" readonly="readonly" id="phone" name="phone" value="${userInfo.phone}" /></span><span><a href="">THT</a></span></div>
			<div class="subgrzl ml40"><span>密码</span><span>
			<input type="hidden" id="passwordHidden" value="${userInfo.password}"/>
			<input type="text" style="border: none;font-size: 20px" name="password" id="password" value="${userInfo.password}" readonly="readonly" /></span><span><a id="modifyPwd">修改密码？</a></span></div>
			<div class="subgrzl ml40"><span>邮箱</span><span>
			<input type="text" style="border: none;font-size: 20px" name="email" id="email" value="${userInfo.email}" readonly="readonly" /></span><span><a href="">THT</a></span></div>
			
			<c:forEach items="${myAddress}" var="add" begin="1" end="1">
				<div class="subgrzl ml40"><span>收货地址</span><span>${add.address}</span><span><a href="">THT</a></span></div>
			</c:forEach>
			
			<div class="subgrzl ml40"><span>注册时间</span><span>
			<fmt:formatDate value="${userInfo.created}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></span><span><a href="">THT</a></span></div>
			<div class="subgrzl ml40"><span>操作</span><span id="modifyInfo"><a>编辑</a></span><span id="save">THT</span></div>
			
		</div>
		<div class="clear"></div>
		</div>
	</div>
<!-- self_info -->
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>