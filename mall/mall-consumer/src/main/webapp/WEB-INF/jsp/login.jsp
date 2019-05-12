<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author"/>
		<title>会员登录</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript">
	function loginCheck()
	{
		username=document.getElementById('loginname').value;
		pwd=document.getElementById('nloginpwd').value;
		inputCode=document.getElementById('inputCode').value;
		flagCode=document.getElementById('flagCode').value;
		if(username=='' || username.length<1) //username.length<1
		{
			alert('账号不能为空');
			return false;
		}
		if(pwd=='' || pwd.length<1)//pwd.length<1
		{
			alert("密码不能为空");
			return false;
		}
		if(flagCode==0)
		{
			alert("验证码有误！");
			return false;
		}
		if(inputCode=='' || inputCode.length<1)
		{
			alert("请输入验证码！");
			return false;
		}
		return true;
	}
	
</script>
<script>
	$(document).ready(function(){
			$("#inputCode").blur(function(){
				var code=$("#inputCode").val();
				$.get("${pageContext.request.contextPath}/user/yanzheng.do?code="+code,function(data){
					if(data==1)//输入正确
					{
						$("#flagCode").val(1);
					}else//输入错误
					{
						alert("验证码错误");
						$("#flagCode").val(0);
					}
				});
			});
			
			$("#loginsubmit").click(function(){
				$("#formlogin").submit();
			});
		});
		
</script>
	</head>
	<body>
		<!-- login -->
		<div class="top center">
			<div class="logo center">
				<a href="${pageContext.request.contextPath}/item/index.do"><img src="${pageContext.request.contextPath}/image/ban.jpg" alt=""></a>
			</div>
		</div>
		<form onsubmit="return loginCheck()"  method="post" action="${pageContext.request.contextPath}/user/login.do" class="form center">
		<div class="login">
			<div class="login_center">
				<div class="login_top">
					<div class="left fl">会员登录</div>
					<div class="right fr">您还不是我们的会员？<a href="${pageContext.request.contextPath}/user/toRegister.do" target="_self">立即注册</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="login_main center">
					<div class="username">用户名:&nbsp;<input class="shurukuang" type="text" name="username" placeholder="请输入你的用户名" id="loginname" /></div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input class="shurukuang" type="password" name="password" placeholder="请输入你的密码" id="nloginpwd"/></div>
					<div class="username">
						<div class="left fl">验证码:&nbsp;<input class="yanzhengma" type="text" placeholder="请输入验证码" id="inputCode" name="inputCode"/></div>
						<div class="right fl"><img src="${pageContext.request.contextPath}/user/getCode.do" onclick="this.src=this.src+'?'"></div>
						<div class="clear"></div>
						<input type="hidden" id="flagCode" value="1"/>
					</div>
				</div>
				<div class="login_submit">
					<input class="submit" type="submit" name="submit" value="立即登录" >
				</div>
			</div>
		</div>
		</form>
		<footer>
			<div class="copyright">简体 | 繁体 | English | 常见问题</div>
			<div class="copyright">小米公司版权所有-京ICP备10046444-<img src="./image/ghs.png" alt="">京公网安备11010802020134号-京ICP证110507号</div>

		</footer>
	</body>
</html>