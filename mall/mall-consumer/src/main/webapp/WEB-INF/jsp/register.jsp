<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache,must-revalidate">
    <title>注册-个人用户</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/regist.personal.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/passport.base.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>

</head>
<body>
<div class="w" id="logo">
    <div>
    	<a href="${pageContext.request.contextPath}/">
    		<img src="${pageContext.request.contextPath}/image/ban.jpg" alt="THT商城" width="170" height="60"/>
    	</a> <b></b>
    </div>
</div>

<div class="w" id="regist">
    <div class="mt">
        <ul class="tab">
            <li class="curr">个人用户</li>
        </ul>
        <div class="extra">
        <span>我已经注册，现在就&nbsp;
        	<a href="${pageContext.request.contextPath}/user/tologin.do" class="flk13">登录</a>
        </span>
        </div>
    </div>
    <div class="mc">
        <form id="personRegForm" action="${pageContext.request.contextPath}/user/register.do" method="post" onsubmit="return registerCheck()">
            <div class="form" onselectstart="return false;">
                <div class="item" id="select-regName">
                    <span class="label"><b class="ftx04">*</b>用户名：</span>
					<input type="hidden" id="returnFlag"/>
                    <div class="fl item-ifo">
                        <div class="o-intelligent-regName">
                            <input type="text" id="regName" name="username" class="text" tabindex="1" autoComplete="off"
                                   onpaste="return false;"
                                   value=""
                                   onfocus="if(this.value=='') this.value='';this.style.color='#333'"
                                   onblur="if(this.value=='') {this.value='';this.style.color='#999999'}"/>
                            <i class="i-name"></i>
                            <ul id="intelligent-regName" class="hide"></ul>
                            <label id="regName_succeed" class="blank"></label>
                            <label id="regName_error" class="hide"></label>
                        </div>
                    </div>
                </div>
                <div id="o-password">
                    <div class="item">
                        <span class="label"><b class="ftx04">*</b>请设置密码：</span>

                        <div class="fl item-ifo">
                            <input type="password" id="pwd" name="password" class="text" tabindex="2"
                                   style="ime-mode:disabled;"
                                   onpaste="return  false" autocomplete="off"/>
                            <i class="i-pass"></i>
                            <label id="pwd_succeed" class="blank"></label>
                            <label id="pwd_error"></label>
                            <span class="clr"></span>
                        </div>
                    </div>

                    <div class="item">
                        <span class="label"><b class="ftx04">*</b>请确认密码：</span>

                        <div class="fl item-ifo">
                            <input type="password" id="pwdRepeat" name="pwdRepeat" class="text" tabindex="3"
                                   onpaste="return  false" autocomplete="off"/>
                            <i class="i-pass"></i>
                            <label id="pwdRepeat_succeed" class="blank"></label>
                            <label id="pwdRepeat_error"></label>
                        </div>
                    </div>
					<div class="item" id="dphone">
						<span class="label"><b class="ftx04">*</b>验证手机：</span>

						<div class="fl item-ifo">
							<input type="text" id="phone" maxlength="11" name="phone"
								class="text" tabindex="4"
								autocomplete="off" /> <i class="i-phone"></i> <label
								id="phone_succeed" class="blank"></label> <label
								id="phone_error"></label>
						</div>
					</div>
					<div class="item" id="dphone">
						<span class="label"><b class="ftx04">*</b>邮箱：</span>

						<div class="fl item-ifo">
							<input type="text" id="email" name="email"
								class="text" tabindex="4"/> <i class="i-phone"></i> <label
								id="phone_succeed" class="blank"></label> <label
								id="phone_error"></label>
						</div>
					</div>
					</div>
                <div class="item item-new">
                    <span class="label">&nbsp;</span>

                    <div class="fl item-ifo">
                        <input type="checkbox" class="checkbox" checked="checked" id="readme">
                        <label for="protocol">我已阅读并同意<a href="#" class="blue" id="protocol">《THT用户注册协议》</a></label>
                        <span class="clr"></span>
                        <label id="protocol_error" class="error hide">请接受服务条款</label>
                    </div>
                </div>
                <div class="item">
                    <span class="label">&nbsp;</span>
                    <input type="button" class="btn-img btn-regist" id="registsubmit" value="立即注册" tabindex="8"
                           clstag="regist|keycount|personalreg|07"/>
                </div>
            </div>
            <div class="phone">
                <img width="180" height="180" src="/images/phone-bg.jpg">
            </div>
            <span class="clr"></span>
        </form>
    </div>
<script type="text/javascript">
	function registerCheck()
	{
		var username=document.getElementById('regName').value;
		var pwd1=document.getElementById('pwd').value;
		var pwd2=document.getElementById('pwdRepeat').value;
		var phone=document.getElementById('phone').value;
		var flag=document.getElementById('readme').checked;
		var exit=document.getElementById('returnFlag').value;
		var eamil=document.getElementById('email').value;
		
		if(username=='' || username.length<1) //username.length<1
		{
			alert('请输入用户名！');
			return false;
		}
		if(pwd1=='' || pwd.length<1 || pwd2=='' || pwd2.length<1 )//pwd.length<1
		{
			alert("请输入密码！");
			return false;
		}
		if(pwd1!=pwd2)
		{
			alert("密码不一致！"); return false;
		}
		if(phone=='' || phone.length<1)
		{
			alert("请输入手机号码！");
			return false;
		}
		if(phone.length<11)
		{
			alert("手机号码有误！");
			return false;
		}
		if(flag==false)
		{
			alert("请同意注册协议！");
			return false;
		}
		if(exit=="1")
		{
			alert("用户名被占用");
			return false;	
		}
		if(eamil=='' || eamil.length<1)
		{
			alert("用户名被占用");
			return false;	
		}
		return true;
	}
	
</script>
<script>
	$(document).ready(function(){
			$("#registsubmit").click(function(){
				$("#personRegForm").submit();
			});
			
			$("#regName").blur(function(){
				 $.get("${pageContext.request.contextPath}/user/findUserNameExeit.do?username="+$(this).val(),function(data){
					if(data==1)
					{
						alert("用户名被占用!");	
						$("#returnFlag").val("1"); //标记已经存在
						return false;
					}else 
					{
						$("#returnFlag").val("0");
					}
				});
			});
		});
</script>
</body>
</html>
