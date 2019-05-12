<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">

	//删除商品
	function todelete(id)
	{
	   if(confirm("确定删除?"))
		{
			window.location.href="${pageContext.request.contextPath}/deleteItem?id="+id;
		}
	}

	//跳转修改页面
	function tochange(id)
	{
		window.location.href="${pageContext.request.contextPath}/toUpdateItem/"+id;
	}
	
	$(document).ready(function(){
		
		//全选
		$("#checkAllItem").click(function(){
			var selectCheck=this.checked;
			$("tbody tr td input[type='checkbox']").prop("checked",selectCheck);
		});
		
		//删除全选的内容
		$("#deleteCheckItem").click(function(){
			var check=$("tbody tr td input:checked");
			var url="";
			$.each(check,function(i,data){
				if(i!=0)
				{
					url=url+"&";	
				}
				url=url+"id="+data.id;
			});
			if(confirm("确定删除?"))
			{
				window.location.href="/deleteItem?"+url;
			}
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
                <h3>Users <small>Some examples to get you started</small></h3>
              </div>
			<form action="/toGoodsInfoManager" method="post" id="findGoodsForm">
              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                  		<input type="text" name="name" class="form-control" placeholder="查找商品...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" id="find" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
               </form>
            </div>

            <div class="clearfix"></div>

            <div class="row">
		
        <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>
                    	<a class="btn btn-danger" id="deleteCheckItem">删除</a>	<a href="${pageContext.request.contextPath}/toAddItem" class="btn btn-success">添加</a>
                   	 所有商品 <small>商品列表</small>
                    
                    </h2>
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
                    <div class="row">
                      <div class="col-sm-12">
                        <div class="card-box table-responsive">
                          <table id="datatable-keytable" class="table table-striped table-bordered">
                            <thead>
                              <tr>
                              	<th><input type="checkbox" id="checkAllItem"/></th>
                                <th>编号</th>
                                <th>标题</th>
                                <th>图片</th>
                                <th>数量</th>
                                <th>状态</th>
                                <th>操作</th>
                              </tr>
                            </thead>


                            <tbody>
                            
                            <c:forEach items="${itemList}" var="item">
                              <tr>
                              	<td><input type="checkbox" id="${item.id}"/></td>
                                <td>${item.id}</td>
                                <td>${item.title}</td>
                                <td>${item.price}</td>
                                <td>${item.num}</td>
                                <td>
                                	<c:if test="${item.status==1}">已上架</c:if>
                                	<c:if test="${item.status==0}">已下架</c:if>
                                </td>
                                <td>
                                <button class="btn btn-sm btn-default" type="button" onclick="tochange(${item.id})"  data-placement="top" data-toggle="tooltip" data-original-title="修改"><i class="fa fa-share"></i></button>
                                <button class="btn btn-sm btn-default" type="button" onclick="todelete(${item.id})" data-placement="top" data-toggle="tooltip" data-original-title="删除"><i class="fa fa-trash-o"></i></button>
                                </td>
                              </tr>
                             </c:forEach>
                            </tbody>
                          </table>
                        </div>
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