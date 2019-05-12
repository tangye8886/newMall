<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品库存管理</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		//跳转订单修改页面
		$(".toModifyOrder").click(function(){
			window.location.href="${pageContext.request.contextPath}/toUpdateOrder/"+$(this).attr("lang");
		});
		
		//删除订单
		$(".deleteOrder").click(function(){
			if(confirm("确认删除？"))
			{
				window.location.href="${pageContext.request.contextPath}/deleteOrder?id="+$(this).attr("lang");
			}
		});
		//跳转订单详情
		$(".orderInfo").click(function(){
			window.location.href="${pageContext.request.contextPath}/orderInfo/"+$(this).attr("lang");
		});
		
		//跳转退款页面
		$(".tuikuanOrder").click(function(){
			var id=$(this).attr("lang");
			window.location.href="${pageContext.request.contextPath}/toAliPay?id="+id;
		});
		
		//全选
		$("#checkAllOrder").click(function(){
			var selectCheck=this.checked;
			$("tbody tr td input[type='checkbox']").prop("checked",selectCheck);
		});
		
		
		//删除全选选中的内容
		$("#deleteCheckOrder").click(function(){
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
				window.location.href="${pageContext.request.contextPath}/deleteOrder?"+url;
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
                  <a class="btn btn-danger" id="deleteCheckOrder">删除</a>	<a class="btn btn-success" href="${pageContext.request.contextPath}/toAddOrder">添加</a>
                   
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
                          </p>

                          <table id="datatable-keytable" class="table table-striped table-bordered">
                            <thead>
                              <tr align="center">
                                <th width="1%"><input type="checkbox" id="checkAllOrder" /></th>
                                <th width="5%">订单ID</th>
                                <th>支付金额</th>
                                <th>支付类型</th>
                                <th>支付交易号</th>
                                <th>状态</th>
                                <th>创建时间</th>
                                <th>物流名称</th>
                                <th>物流单号</th>
                                <th>买家信息</th>
                                <th width="15%" align="center">操作</th>
                              </tr>
                            </thead>


                            <tbody>
                            <c:forEach items="${orderList}" var="od">
                              <tr align="center">
                              	<td><input type="checkbox" id="${od.id}"/></td>
                                <td>${od.orderId}</td>
                                <td>${od.payment}</td>
                                <td>${od.paymentType}</td>
                                <td>${od.postFee}</td>
                                <td>
                                	<c:if test="${od.status==1}">未付款</c:if>
                                	<c:if test="${od.status==2}">已付款</c:if>
                                	<c:if test="${od.status==3}">未发货</c:if>
                                	<c:if test="${od.status==4}">已发货 </c:if>
                                	<c:if test="${od.status==5}">待评价</c:if>
                                	<c:if test="${od.status==6}">已评价</c:if>
                                	<c:if test="${od.status==7}">申请退款</c:if>
                                	<c:if test="${od.status==8}">已退款</c:if>
                                	<c:if test="${od.status==9}">交易成功</c:if>
                                </td>
                                <td>${od.createTime}</td>
                                <td>${od.shippingName}</td>
                                <td>${od.shippingCode}</td>
                                <td>${od.buyerMessage}</td>
                                <td>
                                <button class="btn btn-sm btn-info orderInfo" lang="${od.orderId}" type="button"  data-placement="top" data-toggle="tooltip" data-original-title="查看"><i class="fa fa-share"></i></button>
                                <button class="btn btn-sm btn-default toModifyOrder" lang="${od.orderId}" type="button"  data-placement="top" data-toggle="tooltip" data-original-title="修改"><i class="fa fa-share"></i></button>
                                <c:if test="${od.status==6}">
                                	<button class="btn btn-sm btn-warning tuikuanOrder" lang="${od.id}" type="button" data-placement="top" data-toggle="tooltip" data-original-title="退款"><i class="fa fa-share"></i></button>
                                </c:if>
                                <button class="btn btn-sm btn-danger deleteOrder" lang="${od.id}" type="button" data-placement="top" data-toggle="tooltip" data-original-title="删除"><i class="fa fa-trash-o"></i></button>
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