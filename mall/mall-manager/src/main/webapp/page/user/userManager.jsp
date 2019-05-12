<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品库存管理</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	
		//删除用户
		function deleteUser(id)
		{
			if(confirm("确定删除？"))
			{
				window.location.href="${pageContext.request.contextPath}/deleteUser?id="+id;
			}
		}
		//跳转用户信息修改页面
		function toModify(id)
		{
			window.location.href="${pageContext.request.contextPath}/toUpdateUser/"+id;
		}
		
		//jquery
	$(document).ready(function(){
		
		//全选
		$("#checkAll").click(function(){
			var selectCheck=this.checked;
			$("tbody tr td input[type='checkbox']").prop("checked",selectCheck);
		});
		
		//删除全选选中的内容
		$("#deleteCheck").click(function(){
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
				window.location.href="${pageContext.request.contextPath}/deleteUser?"+url;
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
                  <a class="btn btn-danger" id="deleteCheck">删除</a>	<a class="btn btn-success" href="/toAddUser">添加</a>
                   
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
                          <p class="text-muted font-13 m-b-30">
                            KeyTable provides Excel like cell navigation on any table. Events (focus, blur, action etc) can be assigned to individual cells, columns, rows or all cells.
                          </p>

                          <table id="datatable-keytable" class="table table-striped table-bordered">
                            <thead>
                              <tr align="center">
                                <th width="1%"><input type="checkbox" id="checkAll" /></th>
                                <th width="5%">编号ID</th>
                                <th>用户名</th>
                                <th>密码</th>
                                <th>电话</th>
                                <th>邮箱</th>
                                <th>创建时间</th>
                                <th>修改时间</th>
                                <th width="10%">操作</th>
                              </tr>
                            </thead>


                            <tbody>
                            <c:forEach items="${userList}" var="user">
                              <tr align="center">
                              	<td><input type="checkbox" id="${user.id}"/></td>
                                <td>${user.id}</td>
                                <td>${user.username}</td>
                                <td>${user.password}</td>
                                <td>${user.phone}</td>
                                <td>${user.email}</td>
                                <td><fmt:formatDate value="${user.created}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></td>
                                <td><fmt:formatDate value="${user.updated}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></td>
                                <td>
                                <button class="btn btn-sm btn-default" onclick="javascript:toModify(${user.id})" type="button"  data-placement="top" data-toggle="tooltip" data-original-title="修改"><i class="fa fa-share"></i></button>
                                <button class="btn btn-sm btn-default" onclick="javascript:deleteUser(${user.id})" type="button" data-placement="top" data-toggle="tooltip" data-original-title="删除"><i class="fa fa-trash-o"></i></button>
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