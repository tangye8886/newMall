<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/js/jquery.js"  charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//提交添加用户表单
		$("#send").click(function(){
			$("#addUserInfoForm").submit();
		});
	});
</script>
</head>
<body>
		<jsp:include page="../public/header.jsp" flush="true"/>

		<!-- page content -->
         <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Form Validation</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                              <button class="btn btn-default" type="button">Go!</button>
                          </span>
                  </div>
                </div>
              </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Form validation <small>sub title</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <form class="form-horizontal form-label-left" action="${pageContext.request.contextPath}/addUser" id="addUserInfoForm">

                      <p>For alternative validation library <code>parsleyJS</code> check out in the <a href="form.html">form page</a>
                      </p>
                      <span class="section">个人信息</span>
                      <input type="hidden" name="flag" value="1"/>
									
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">用户名 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="username" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="username"  required="required" type="text">
                        </div>
                      </div>
                      
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">密码 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="password"  class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="password"  required="required" type="password">
                        </div>
                      </div>
                    
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">电话 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="phone"  class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="phone" required="required" type="text">
                        </div>
                      </div>
                     
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">邮箱 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="email"  class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="email" required="required" type="text">
                        </div>
                      </div>
                      
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">角色<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        	<select name="role">
                        		<option value="1">管理员</option>
                        		<option value="2">用户</option>
                        	</select>
                        </div>
                      </div>
                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                          <button id="send" type="submit" class="btn btn-success">添加</button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

		<jsp:include page="../public/footer.jsp" flush="true"/>
</body>
</html>