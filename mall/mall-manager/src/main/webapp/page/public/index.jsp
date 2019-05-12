<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/12
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>后台登陆</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath }/statics/css/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="https://colorlib.com/polygon/gentelella/css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath }/statics/css/custom.min.css" rel="stylesheet">
</head>

<body class="login">
<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form method="post" action="${pageContext.request.contextPath }/login" id="loginFrm">
                    <h1>后台登陆</h1>
                    <div>
                        <input type="text" id="username" name="username" class="form-control" placeholder="请输入登陆名" required /><span></span>
                    </div>
                    <div>
                        <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码" required /><span></span>
                    </div>
                    <div>
                        <a class="btn btn-default submit" href="javascript:void(0);" id="smt">登陆</a>
                        <a class="btn btn-default" href="javascript:void(0);" onclick="history.back();">返回</a>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <div class="clearfix"></div>
                        <br />
                        <div>
                            <h1><i class="fa fa-paw"></i>管理平台</h1>
                            <p>©2018 All Rights Reserved. </p>
                        </div>
                    </div>
                </form>
            </section>
        </div>

    </div>
</div>
<script src="/statics/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">

    $(function () {
        //登陆用户名和密码
        $("#smt").click(function () {
            if ($("#userCode").val()==""){
                $("#userCode").next().html("登陆名不能为空");
                return false;
            } else {
                $("#userCode").next().html("");
            }
            if ($("#userPassword").val()==""){
                $("#userPassword").next().html("密码不能为空");
                return false;
            } else {
                $("#userPassword").next().html("");
            }
            
            $("#loginFrm").submit(); 
        });
    })
</script>
</body>
</html>
