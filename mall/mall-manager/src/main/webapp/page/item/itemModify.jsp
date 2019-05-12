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
	
	//一级菜单
	$("#oneCat").change(function(){
		var s=$(this).val();
		$("#twoCat").empty();
		$("#threeCat").empty();
		$.get("${pageContext.request.contextPath}/findCatSon?parentId="+s,function(data){
			$.each(data,function(i,cat){
				$("#twoCat").append("<option value="+cat.id+">"+cat.name+"</option>");
			});
		});
	});
	
	//二级菜单
	$("#twoCat").change(function(){
		var s=$(this).val();
		$("#threeCat").empty();
		$.get("${pageContext.request.contextPath}/findCatSon?parentId="+s,function(data){
			$.each(data,function(i,cat){
				$("#threeCat").append("<option value="+cat.id+">"+cat.name+"</option>");
			});
		});
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

                    <form action="${pageContext.request.contextPath }/updateItem" method="post" class="form-horizontal form-label-left" novalidate>

						<input type="hidden" name="id" value="${item.id}"/>
                      <p>For alternative validation library <code>parsleyJS</code> check out in the <a href="form.html">form page</a>
                      </p>
                      <span class="section">Personal Info</span>

                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">标题 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="title" value="${item.title}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="title" required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">描述 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="sellDesc" value="${item.sellDesc}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="sellDesc" required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">卖点 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="sellPoint" value="${item.sellPoint}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="sellPoint" required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">价格 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="price" value="${item.price}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="price"  required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">数量 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="num" value="${item.num}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="num"  required="required" type="text">
                        </div>
                      </div>
                      
                      
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">图片 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        
                        	<img width="60" height="60" src="${pageContext.request.contextPath}/${item.image}">
                          <input id="image" value="${item.image}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="image" required="required" type="text">
                        </div>
                      </div>
                      
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">类型 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        
                        <select id="oneCat">
                       		<option>${mallCat3.name}</option>
                     		<c:forEach items="${catOneList}" var="one">
                     			<option value="${one.id}">${one.name}</option>
                     		</c:forEach>
                     	</select>
                     
                     	<!-- 二级分类 -->
                    	 <select id="twoCat">
                    	 	<c:forEach items="${allCatList}" var="cats">
                    	 		<option value="${cats.id}" <c:if test="${cats.id==mallCat2.id}">selected="selected"</c:if>>${cats.name}</option>
                    	 	</c:forEach>
                    	 </select>
                     	
                     	 <!-- 3级分类 -->
                    	 <select name="cid" id="threeCat">
                    	 	<c:forEach items="${allCatList}" var="cats">
                    	 		<option value="${cats.id}" <c:if test="${cats.id==mallCat1.id}">selected="selected"</c:if>>${cats.name}</option>
                    	 	</c:forEach>
                    	 </select>
                          
                        </div>
                      </div>
                      
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">状态 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                  			<input type="radio" name="status" value="1" <c:if test="${item.status==1}">checked="checked"</c:if>/>上架 
                  			<input type="radio" name="status" value="0" <c:if test="${item.status==0}">checked="checked"</c:if>/>下架 
                        </div>
                      </div>
                      
                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                          <button id="send" type="submit" class="btn btn-success">修改</button>
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