<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THT商城</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
		
			<!-- start banner_y -->
		<div class="banner_y center">
			<div class="nav">				
				<ul>
					<li>
						<a href="">手机</a>
						<a href="">电话卡</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a >
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm5-80.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','小米')">小米</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','小米')" target="_blank">选购</a></div>
									<div class="clear"></div>
								</div>
								
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm6_80.png" alt=""></div>
											<span class="fl" onclick="filter('title','华为')">华为</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','华为')">选购</a></div>
									<div class="clear"></div>
								</div>
								
								<div>
									<div class="xuangou_left fl">
										<a >
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm5S-80.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','OPPO')">OPPO</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a  onclick="filter('title','OPPO')">选购</a></div>
									<div class="clear"></div>
								</div>
								
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/hm4-80.jpg" alt="" width="40" height="40"></div>
											<span class="fl"  onclick="filter('title','VIVO')">VIVO</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a  onclick="filter('title','VIVO')">选购</a></div>
									<div class="clear"></div>
								</div>
								
								<div>
									<div class="xuangou_left fl">
										<a >
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/hm4A-80.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','VIVO')">荣耀</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','VIVO')">选购</a></div>
									<div class="clear"></div>
								</div>
								
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/hm4x_80.png" alt=""></div>
											<span class="fl" onclick="filter('title','三星')">三星</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','三星')">选购</a></div>
									<div class="clear"></div>
								</div>
							</div>
							<div class="ctn fl">
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/hmn4x80.png" alt=""></div>
											<span class="fl" onclick="filter('title','苹果')">苹果</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','苹果')">选购</a></div>
									<div class="clear">
								</div>
								
								<div>
									<div class="xuangou_left fl">
										<a >
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/XRMAX.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','iPhoneX')">iPhoneX</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','苹果XR')">选购</a></div>
									<div class="clear"></div>
								</div>
								
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/XRMAX.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','苹果XR')">iPhoneXR</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','iPhoneXR')">选购</a></div>
									<div class="clear"></div>
								</div>
									
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/compare.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','MI9')">小米9</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','MI9')">选购</a></div>
									<div class="clear"></div>
								</div>
								
									
								<div>
									<div class="xuangou_left fl">
										<a >
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/Mate20.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','Mate20')">华为Mate20</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','Mate20')">选购</a></div>
									<div class="clear"></div>
								</div>
								
									
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/P30.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','华为P30')">华为P30</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','华为P30')">选购</a></div>
									<div class="clear"></div>
								</div>
									
									
									
								</div>
							</div>
							
							<div class="right fl">
								<div>
										<div class="xuangou_left fl">
											<a>
												<div class="img fl"><img src="${pageContext.request.contextPath}/images/card.jpg" width="40" height="40" alt=""></div>
												<span class="fl" onclick="filter('title','移动电话卡')">移动电话卡</span>
												<div class="clear"></div>
											</a>
										</div>
										<div class="xuangou_right fr"><a onclick="filter('title','移动电话卡')">选购</a>
									</div>
										<div class="clear"></div>
								</div>
								
								<div>
										<div class="xuangou_left fl">
											<a>
												<div class="img fl"><img src="${pageContext.request.contextPath}/images/card.jpg" width="40" height="40"  alt=""></div>
												<span class="fl" onclick="filter('title','联通电话卡')">联通电话卡</span>
												<div class="clear"></div>
											</a>
										</div>
										<div class="xuangou_right fr"><a onclick="filter('title','联通电话卡')">选购</a>
									</div>
										<div class="clear"></div>
								</div>
								
								<div>
										<div class="xuangou_left fl">
											<a>
												<div class="img fl"><img src="${pageContext.request.contextPath}/images/card.jpg" width="40" height="40"  alt=""></div>
												<span class="fl" onclick="filter('title','电信电话卡')">电信电话卡</span>
												<div class="clear"></div>
											</a>
										</div>
										<div class="xuangou_right fr"><a onclick="filter('title','电信电话卡')">选购</a>
									</div>
										<div class="clear"></div>
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</li>
					<li>
						<a href="">笔记本</a>
						<a href="">平板</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/华硕顽石五代FL8000U.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','华硕')">华硕</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','华硕')">选购</a></div>
									<div class="clear"></div>
								</div>
								
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/联想330C.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','联想')">联想</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','联想')">选购</a></div>
									<div class="clear"></div>
								</div>
								
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/惠普暗影精灵4代电脑.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','戴尔')">戴尔</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','戴尔')">选购</a></div>
									<div class="clear"></div>
								</div>
								
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/联想330C.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','神舟')">神舟</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','神舟')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/惠普暗影精灵4代电脑.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','惠普')">惠普</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','惠普')">选购</a></div>
									<div class="clear"></div>
								</div>
								
													
							</div>
							<div class="ctn fl">
								<div>
									<div class="xuangou_left fl">
										<a >
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/华为平板M5.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','华为平板')">华为平板</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','华为平板')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/iPad.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','iPad')">iPad</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','iPad')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a >
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/华为平板M5.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','mi平板')">小米平板</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','mi平板')">选购</a></div>
									<div class="clear"></div>
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</li>
					<li>
						<a href="">电视</a>
						<a href="">盒子</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/PHILIPSTV.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','创维电视')">创维电视</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','创维电视')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/三星电视.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','三星电视')">三星电视</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','三星电视')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/PHILIPSTV.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','LG电视')">LG电视</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','LG电视')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/三星电视.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','SONY电视')">SONY电视</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','SONY电视')">选购</a></div>
									<div class="clear"></div>
								</div>
							</div>
							<div class="ctn fl">
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/精灵.jpg" width="40" height="40"  alt=""></div>
											<span class="fl" onclick="filter('title','天猫精灵')">天猫精灵</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','天猫精灵')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/images/精灵.jpg" width="40" height="40" alt=""></div>
											<span class="fl" onclick="filter('title','小米盒子')">小米盒子</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','小米盒子')">选购</a></div>
									<div class="clear"></div>
								</div>
							</div>
							
							<div class="clear"></div>
						</div>
					</li>
					<li>
						<a href="">路由器</a>
						<a href="">智能硬件</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm6_80.png" alt=""></div>
											<span class="fl" onclick="filter('title','普联路由器')">普联路由器</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','普联路由器')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/5c_80.png" alt=""></div>
											<span class="fl" onclick="filter('title','腾达路由器')">腾达路由器</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','腾达路由器')">选购</a></div>
									<div class="clear"></div>
								</div>
										
							</div>
							<div class="ctn fl">
								<div>
									<div class="xuangou_left fl">
										<a>
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm5-80.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','手环1代')">小米手环1代</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','手环1代')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/hmn4x80.png" alt=""></div>
											<span class="fl" onclick="filter('title','手环2代')">小米手环2代</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','手环2代')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/hmnote4-80.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','手环3代')">小米手环3代</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','手环3代')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/hm4x_80.png" alt=""></div>
											<span class="fl" onclick="filter('title','荣耀手环')">荣耀手环</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','荣耀手环')">选购</a></div>
									<div class="clear"></div>
								</div>
								
							</div>
						
							<div class="clear"></div>
						</div>
					</li>
					<li>
						<a href="">移动电源</a>
						<a href="">电池</a>
						<a href="">插线板</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm6_80.png" alt=""></div>
											<span class="fl" onclick="filter('title','羽博')">羽博</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','羽博')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/5c_80.png" alt=""></div>
											<span class="fl" onclick="filter('title','飞毛腿')">飞毛腿</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','飞毛腿')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xmNOTE2-80.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','移动电源')">小米移动电源</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','移动电源')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/MIX-80.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','华为移动电源')">华为移动电源</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','华为移动电源')">选购</a></div>
									<div class="clear"></div>
								</div>
								
														
							</div>
							<div class="ctn fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm5-80.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','苹果原装电池')">苹果原装电池</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','苹果原装电池')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/hmn4x80.png" alt=""></div>
											<span class="fl" onclick="filter('title','南孚电池')">南孚电池</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','南孚电池')">选购</a></div>
									<div class="clear"></div>
								</div>
								
							</div>
							<div class="right fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/compare.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','公牛插头')">公牛插头</span>
											<div class="clear"></div>
										</a>
									</div>
									 <div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/mimobile.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','小米排插')">小米排插</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','小米排插')">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/mimobile.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','网易严选排插')">网易严选排插</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a onclick="filter('title','网易严选排插')">选购</a></div>
									<div class="clear"></div>
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</li>
					<li>
						<a href="">耳机</a>
						<a href="">音箱</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm6_80.png" alt=""></div>
											<span class="fl" onclick="filter('title','Beast耳机')">Beast耳机</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/5c_80.png" alt=""></div>
											<span class="fl" onclick="filter('title','苹果蓝牙耳机')">苹果蓝牙耳机</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xmNOTE2-80.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','苹果连线耳机')">苹果连线耳机</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/MIX-80.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','小米耳机')">小米耳机</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
							</div>
							<div class="ctn fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm5-80.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','小米音响')">小米音响</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/hmn4x80.png" alt=""></div>
											<span class="fl" onclick="filter('title','华为音响')">华为音响</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								
							</div>
							
							<div class="clear"></div>
						</div>
					</li>
					<li>
						<a href="">保护套</a>
						<a href="">贴膜</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm6_80.png" alt=""></div>
											<span class="fl" onclick="filter('title','苹果手机保护套')">苹果手机保护套</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/5c_80.png" alt=""></div>
											<span class="fl" onclick="filter('title','小米手机保护套')">小米手机保护套</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xmNOTE2-80.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','华为手机保护套')">华为手机保护套</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/MIX-80.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','三星手机保护套')">三星手机保护套</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/MIX-80.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','苹果手机贴膜')">苹果手机贴膜</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm5Splus.jpg" alt=""></div>
											<span class="fl" onclick="filter('title','小米手机贴膜')">小米手机贴膜</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>								
							</div>							
							<div class="clear"></div>
						</div>
					</li>
					<li>
						<a href="">支架</a>
						<a href="">储存卡</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm6_80.png" alt=""></div>
											<span class="fl">手机支架</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/5c_80.png" alt=""></div>
											<span class="fl">闪迪</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xmNOTE2-80.jpg" alt=""></div>
											<span class="fl">金士顿</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/MIX-80.jpg" alt=""></div>
											<span class="fl">三星</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/MIX-80.jpg" alt=""></div>
											<span class="fl">东芝</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
									
							</div>
							
							<div class="clear"></div>
						</div>
					</li>
					<li>
						<a href="">箱包</a>
						<a href="">服饰</a>
						<a href="">鞋</a>
						<a href="">眼镜</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm6_80.png" alt=""></div>
											<span class="fl">爱华仕</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/5c_80.png" alt=""></div>
											<span class="fl">LV</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xmNOTE2-80.jpg" alt=""></div>
											<span class="fl">古驰</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/MIX-80.jpg" alt=""></div>
											<span class="fl">蔻驰</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/MIX-80.jpg" alt=""></div>
											<span class="fl">运动鞋</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm5Splus.jpg" alt=""></div>
											<span class="fl">豆豆鞋</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>			
								
							</div>		
							
							<div class="ctn fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm5-80.jpg" alt=""></div>
											<span class="fl">明朗</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/hmn4x80.png" alt=""></div>
											<span class="fl">牛仔裤</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/hmn4x80.png" alt=""></div>
											<span class="fl">休闲裤</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/hmn4x80.png" alt=""></div>
											<span class="fl">运动服装</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								
								
							</div>					
							<div class="clear"></div>
						</div>
					</li>
					<li>
						<a href="">家电</a>
						<a href="">生活用品</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm6_80.png" alt=""></div>
											<span class="fl">电饭煲</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/5c_80.png" alt=""></div>
											<span class="fl">牙刷</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xmNOTE2-80.jpg" alt=""></div>
											<span class="fl">毛巾</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/MIX-80.jpg" alt=""></div>
											<span class="fl">数据线</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/MIX-80.jpg" alt=""></div>
											<span class="fl">电视</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="${pageContext.request.contextPath}/image/xm5Splus.jpg" alt=""></div>
											<span class="fl">空调</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">选购</a></div>
									<div class="clear"></div>
								</div>								
							</div>							
							<div class="clear"></div>
						</div>
					</li>
				</ul>
			</div>
		
		</div>	

		<div class="sub_banner center">
			<div class="sidebar fl">
				<div class="fl"><a onclick="filter('title','手机')"><img src="${pageContext.request.contextPath}/image/hjh_01.gif"></a></div>
				<div class="fl"><a onclick="filter('title','移动')"><img src="${pageContext.request.contextPath}/image/hjh_02.gif"></a></div>
				<div class="fl"><a href=""><img src="${pageContext.request.contextPath}/image/hjh_03.gif"></a></div>
				<div class="fl"><a href=""><img src="${pageContext.request.contextPath}/image/hjh_04.gif"></a></div>
				<div class="fl"><a href=""><img src="${pageContext.request.contextPath}/image/hjh_05.gif"></a></div>
				<div class="fl"><a href=""><img src="${pageContext.request.contextPath}/image/hjh_06.gif"></a></div>
				<div class="clear"></div>
			</div>
			<div class="datu fl"><a onclick="filter('title','小米4X')"><img src="${pageContext.request.contextPath}/image/hongmi4x.png" alt=""></a></div>
			<div class="datu fl"><a onclick="filter('title','小米5')"><img src="${pageContext.request.contextPath}/image/xiaomi5.jpg" alt=""></a></div>
			<div class="datu fr"><a onclick="filter('title','平衡车')"><img src="${pageContext.request.contextPath}/image/pinghengche.jpg" alt=""></a></div>
			<div class="clear"></div>


		</div>
	<!-- end banner -->

	<!-- start danpin -->
		<div class="danpin center">
			
			<div class="biaoti center">明星单品</div>
			<div class="main center">
			<c:forEach items="${itemList}" var="item" begin="40" end="44">
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="${pageContext.request.contextPath}/item/toItemInfo.do?id=${item.id}" target="_blank"><img width="150" height="150" src="${pageContext.request.contextPath}/${item.image}" alt=""></a></div>
					<div class="pinpai"><a href="${pageContext.request.contextPath}/item/toItemInfo.do?id=${item.id}" target="_blank">${item.title}</a></div>
					<div class="youhui">5月9日-21日享花呗12期分期免息</div>
					<div class="jiage">${item.price/100}元起</div>
				</div>
			</c:forEach>	
				<div class="clear"></div>
			</div>
		</div>
		<div class="peijian w">
			<div class="biaoti center">热销</div>
			<div class="main center">
				<div class="content">
					<div class="remen fl"><a href=""><img src="${pageContext.request.contextPath}/image/peijian1.jpg"></a>
					</div>
					<c:forEach items="${itemList}" var="item" begin="35" end="38">
					<div class="remen fl">
						<div class="xinpin"><span>新品</span></div>
						<div class="tu"><a href="${pageContext.request.contextPath}/item/toItemInfo.do?id=${item.id}" target="_blank"><img width="150" height="150"  src="${pageContext.request.contextPath}/${item.image}"></a></div>
						<div class="miaoshu"><a href="${pageContext.request.contextPath}/item/toItemInfo.do?id=${item.id}" target="_blank">${item.title}</a></div>
						<div class="jiage">${item.price/100}元</div>
						<div class="pingjia">销量：${item.sellNum}</div>
						<div class="piao">
							<a href="">
								<span>发货速度很快！</span>
								<span>来至于mi狼牙的评价</span>
							</a>
						</div>
					</div>
					</c:forEach>
					
					<div class="clear"></div>
				</div>
				<div class="content">
					<div class="remen fl"><a href="${pageContext.request.contextPath}/item/toItemInfo.do?id=${item.id}"><img src="${pageContext.request.contextPath}/image/peijian6.png"></a>
					</div>
					<c:forEach items="${itemList}" var="item" begin="30" end="33">
					
					
						<div class="remen fl">
						<div class="xinpin"><span style="background:#fff"></span></div>
						<div class="tu"><a href="${pageContext.request.contextPath}/item/toItemInfo.do?id=${item.id}" target="_blank"><img width="150" height="150"  src="${pageContext.request.contextPath}/${item.image}"></a></div>
						<div class="miaoshu"><a href="${pageContext.request.contextPath}/item/toItemInfo.do?id=${item.id}" target="_blank">${item.title}</a></div>
						<div class="jiage">${item.price/100}元</div>
						<div class="pingjia">销量：${item.sellNum}</div>
						<div class="piao">
							<a href="">
								<span>发货速度很快！很配！</span>
								<span>来至于mi狼牙的评价</span>
							</a>
						</div>
					</div>
					
					
					</c:forEach>
					
					<div class="clear"></div>
				</div>				
			</div>
		</div>
		
		
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>