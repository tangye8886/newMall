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
	
</script>
</head>
<body>
		<jsp:include page="../public/header.jsp" flush="true"/>

		<!-- page content -->
         <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>订单详情</h3>
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

                    <form class="form-horizontal form-label-left" action="${pageContext.request.contextPath}/updateOrder" id="modifyOrderForm" method="post" enctype="multipart/form-data">

                      <span class="section">订单信息</span>
						
					<input type="hidden" name="billNo" value="${orderInfo.orderId}"/>
					<input type="hidden" name="id1" value="${orderInfo.id}" />
					<input type="hidden" name="id2" value="${orderInfo.orderShipping.id}" />
					
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">支付金额 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly"  name="payment"  value="${orderInfo.payment}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">支付类型 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        	<select disabled="disabled" name="paymentType" class="selectpicker">
                        		<option value="1" <c:if test="${orderInfo.paymentType==1}">selected="selected"</c:if>>在线支付</option>
                        		<option value="2" <c:if test="${orderInfo.paymentType==2}">selected="selected"</c:if>>货到付款</option>
                        	</select>
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">邮费 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="postFee" value="${orderInfo.postFee}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" type="text">
                        </div>
                      </div>
                     
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">状态<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        	<select disabled="disabled" name="status" class="selectpicker">
                        		<option value="1" <c:if test="${orderInfo.status==1}">selected="selected"</c:if>>未付款</option>
                        		<option value="2" <c:if test="${orderInfo.status==2}">selected="selected"</c:if>>已付款</option>
                        		<option value="3" <c:if test="${orderInfo.status==3}">selected="selected"</c:if>>未发货</option>
                        		<option value="4" <c:if test="${orderInfo.status==4}">selected="selected"</c:if>>已发货</option>
                        		<option value="5" <c:if test="${orderInfo.status==5}">selected="selected"</c:if>>待评价</option>
                        		<option value="6" <c:if test="${orderInfo.status==6}">selected="selected"</c:if>>已评价</option>
                        		<option value="7" <c:if test="${orderInfo.status==7}">selected="selected"</c:if>>待退款</option>
                        		<option value="8" <c:if test="${orderInfo.status==8}">selected="selected"</c:if>>已退款</option>
                        		<option value="9" <c:if test="${orderInfo.status==9}">selected="selected"</c:if>>交易完成</option>
                        	</select>
                        </div>
                      </div>
                      
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">物流名称 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="shippingName" value="${orderInfo.shippingName}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">物流编号 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="shippingCode"  value="${orderInfo.shippingCode}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">用户ID<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        	<select disabled="disabled" name="userId">
                        		<c:forEach items="${userList}" var="usr">
                        			<option value="${usr.id}" <c:if test="${orderInfo.userId==usr.id}">selected="selected"</c:if>>${usr.username}</option>
                        		</c:forEach>
                        	</select>
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">买家留言 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly"  name="buyerMessage" value="${orderInfo.buyerMessage}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">用户昵称 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="buyerNick" value="${orderInfo.buyerNick}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                      
                      
                      
                      <!-- -------------------------OrderItem-------------------------- -->
						 <div class="ln_solid">订单商品内容信息</div>
						
					<c:forEach items="${orderInfo.orderItemList}" var="oi">
					<input type="hidden" name="id" value="${oi.id}" />
					 <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">商品编号 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="itemId" id="itemId"  value="${oi.itemId}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">数量 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="num" id="num"  value="${oi.num}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                      
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">名称<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="title" id="title"  value="${oi.title}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">单价 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="price" id="price"  value="${oi.price}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">总费用 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="totalFee" id="totalFee"   value="${oi.totalFee}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
					  
					  </c:forEach>	
					  
					  <!-- ---------------------------OrderShipping-------------------------- -->
					  
					  <div class="ln_solid">收货信息</div>
					  
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">收货人 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="receiverName" id="receiverName"  value="${orderInfo.orderShipping.receiverName}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">手机 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="receiverPhone" id="receiverPhone"  value="${orderInfo.orderShipping.receiverPhone}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">固定电话 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="receiverMobile" id="receiverMobile" value="${orderInfo.orderShipping.receiverMobile}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">省份 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="receiverState" id="receiverState"  value="${orderInfo.orderShipping.receiverState}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">城市<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="receiverCity" id="receiverCity" value="${orderInfo.orderShipping.receiverCity}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                      
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">地址<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="receiverAddress" id="receiverAddress"  value="${orderInfo.orderShipping.receiverAddress}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">邮政编码<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input readonly="readonly" name="receiverZip" id="receiverZip"  value="${orderInfo.orderShipping.receiverZip}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" required="required" type="text">
                        </div>
                      </div>
                    </form>
                    
                    </div>
                </div>
              </div>
            </div>
          </div>
        </div>

		<jsp:include page="../public/footer.jsp" flush="true"/>
</body>
</html>