package com.tangye.mall.controller;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.config.AlipayConfig;
import com.tangye.mall.entity.MallItem;
import com.tangye.mall.entity.MallOrder;
import com.tangye.mall.entity.MallOrderItem;
import com.tangye.mall.entity.MallOrderShipping;
import com.tangye.mall.entity.MallUser;
import com.tangye.mall.service.ConsumerService;
/*
 * 订单控制器
 */
@Controller
@RequestMapping("/order/")
public class OrderController {

	@Resource
	ConsumerService service;
	

	//删除订单
	@ResponseBody
	@RequestMapping("/deleteOreder")
	public int deleteOreder(String id,String orderid)
	{
		int c1=service.deleteOrederItemByOrderId(orderid);
		int c2=service.deleteShippingByOrderId(orderid);
		int c3=service.deleteOreder(Long.parseLong(id));
		if(c1>0 && c2>0 &&c3>0)
		{
			return 1;
		}else 
		return 0;
	}
	
	  
	  //添加(提交)订单
	  @RequestMapping("/addOrder") 
	  public String addOrder(String itemId[],String num[],String address,String allPrice,String buyerMessage,String allAmount,Model model,HttpSession session)
	  {
		  MallUser user=(MallUser) session.getAttribute("userInfo");
		  int machineId = 1;//最大支持1-9个集群机器部署
		  int hashCodeV = UUID.randomUUID().toString().hashCode();
		  if(hashCodeV < 0) {hashCodeV = - hashCodeV;}
		  String WIDout_trade_no=machineId+ String.format("%015d", hashCodeV);
		  
		  MallOrder order=new MallOrder();//订单对象
		  MallOrderItem orderItem=new MallOrderItem();//订单发货信息对象
		  MallOrderShipping shipping=new MallOrderShipping();//订单收货信息对象
		  
		  
		  //插入订单
		  order.setOrderId(WIDout_trade_no);
		  order.setCreateTime(new Date());
		  order.setUserId(user.getId());
		  order.setStatus(1); //1：未付款 2:已付款 3：未发货 4：已发货 5：待评价 6:已评价  7:申请退款 8：已退款
		  order.setPayment(allPrice);
		  order.setPaymentType(1);
		  order.setBuyerRate(1);
		  order.setPostFee("0");
		  order.setBuyerMessage(buyerMessage);
		  order.setBuyerNick(user.getUsername());
	
		  //一个订单可以有多个或者一个商品
		  for(int i=0;i<itemId.length;i++)
		  {
			  Float id=Float.parseFloat(itemId[i]);
			  Integer amount=Integer.parseInt(num[i]);
			  MallItem item=service.findItemByid(id.longValue());
			  
			  
			  int initCount =item.getSellNum();
			  int kucun=item.getNum();
			  item.setSellNum(initCount+amount); //更新销量
			  item.setNum(kucun-amount); //更新库存
			  
			  Float priceItem=item.getPrice();
			  orderItem.setOrderId(WIDout_trade_no);
			  orderItem.setNum(amount);
			  orderItem.setTitle(item.getTitle());
			  orderItem.setItemId(itemId[i]);
			  orderItem.setPicPath(item.getImage());
			  orderItem.setPrice(priceItem.longValue());
			  orderItem.setTotalFee(priceItem.longValue()*amount);
			  
			  //更新数据库商品的销量
			  service.updateItem(item);
			  //更新搜索引擎商品的销量
			  service.addSolrItem(item);
			  service.addOrederItem(orderItem);
		  }

		 //地址处理
		  String s[]=address.split(" ");
		  shipping.setOrderId(WIDout_trade_no);
		  shipping.setReceiverName(s[0]);
		  shipping.setReceiverPhone(s[1]);
		  shipping.setReceiverMobile(s[1]);
		  shipping.setReceiverZip(s[2]);
		  String add=s[3];
		  shipping.setReceiverState(add.substring(0, 3));
		  shipping.setReceiverCity(add.substring(3, 6));
		  shipping.setReceiverDistrict(add.substring(6, 9));
		  shipping.setReceiverAddress(add.substring(9,add.length()));
		  shipping.setCreated(new Date());
		  
		  service.addOreder(order);
		  service.addOrderShipping(shipping);
		  
		  model.addAttribute("WIDout_trade_no",WIDout_trade_no);
		  model.addAttribute("WIDsubject",WIDout_trade_no);
		  model.addAttribute("WIDtotal_amount",Float.parseFloat(allPrice));
		  model.addAttribute("WIDbody","支付");
		 
		  return "toPay"; 
	  }
	 
	  //跳转订单详情
	    @RequestMapping("/orderInfo")
		public String orderInfo(String orderId,HttpServletRequest req)
		{
		 	MallOrder order = service.findOrderToItemToShpping(orderId);//一对一 一对多查询
			req.setAttribute("order",order);
			if(service.findCommentByOrderId(orderId)!=null)
			{
				req.setAttribute("comments",service.findCommentByOrderId(orderId));
			}
			return "orderInfo";
		}
	  
	  
	   //跳转支付宝支付
	  @RequestMapping("/aliPay")
		public String aliPay(
				String WIDout_trade_no,//商户订单号 
				String WIDsubject,//订单名称
				String WIDtotal_amount,//付款金额
				String WIDbody,  //商品描述
				HttpServletRequest req)
		{
		 	System.out.println(WIDout_trade_no);
			req.setAttribute("WIDout_trade_no",WIDout_trade_no);
			req.setAttribute("WIDsubject",WIDsubject);
			req.setAttribute("WIDtotal_amount",Float.parseFloat(WIDtotal_amount));
			req.setAttribute("WIDbody",WIDbody);
			return "payment";
		}
	  
	  //返回支付结果,返回到我的订单
	  @RequestMapping("/payResult")
		public String payResult(
				String out_trade_no,//商户订单号 
				String trade_no,//订单交易号
				String total_amount,//付款金额
				HttpServletRequest req)
		{
		  	String result="error";
		  Map<String,String> params = new HashMap<String,String>();
			Map<String,String[]> requestParams = req.getParameterMap();
			for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = (String) iter.next();
				String[] values = (String[]) requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i]
							: valueStr + values[i] + ",";
				}
				//乱码解决，这段代码在出现乱码时使用
				try {
					valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				params.put(name, valueStr);
			}
			
			boolean signVerified;
			try {
				signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
				//——请在这里编写您的程序（以下代码仅作参考）——
				if(signVerified) {
					
					//支付成功,更新订单的支付状态
					MallOrder order=new MallOrder();
					order.setPostFee(trade_no);
					order.setOrderId(out_trade_no);
					order.setPaymentTime(new Date());
					service.updateOrederPayment(order);
					
					result="redirect:myOrdersByPage.do?pageIndex=1";
				}else {
					System.out.println("验签失败");
					result="error";
				}
			
			} catch (AlipayApiException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} //调用SDK验证签名
			
			return result;
		}
	 
	  
	  	//发起退款申请
	  	@ResponseBody
	  	@RequestMapping("/applicationTuiKuan")
		public int tuikuan(String id,String reason,Model model)
		{
			MallOrder order=new MallOrder();
			order.setStatus(7);
			order.setId(Long.parseLong(id));
			int result=service.updateOreder(order);
			return result;
		}
	  	//取消退款申请
		@ResponseBody
	  	@RequestMapping("/quxiaoTuiKuan")
		public int quxiaoTuiKuan(String id,Model model)
		{
			MallOrder order=new MallOrder();
			order.setStatus(9);
			order.setId(Long.parseLong(id));
			int result=service.updateOreder(order);
			return result;
		}
	  	
	  	//确认收货
	  	@ResponseBody
	  	@RequestMapping("/shouhuo")
		public int shouhuo(String id)
		{
	  		MallOrder order=new MallOrder();
	  		order.setId(Long.parseLong(id));
	  		order.setStatus(5);//修改状态为待评价
			return service.updateOreder(order);
		}
	  	
	  	//跳转提交订单
	  	@RequestMapping("/toSubmitOrder")
		public String toSubmitOrder(String itemId[],String amount[],float totalPrice,Model model,HttpSession session)
		{
			List<MallItem> items=new ArrayList<MallItem>();
			MallUser user=(MallUser) session.getAttribute("userInfo");
			int totalCount=0;
			for(int i=0;i<itemId.length;i++)
			{
				MallItem item = service.findItemByid(Long.parseLong(itemId[i]));
				item.setNum(Integer.parseInt(amount[i]));
				totalCount=totalCount+item.getNum();
				items.add(item);
			}
			model.addAttribute("totalPrice",totalPrice);
			model.addAttribute("items",items);
			model.addAttribute("totalCount",totalCount);
			model.addAttribute("addressList",service.myAddress(user.getId()));
			return "submitOrder";
		}
		
		
	  	//我的订单
		@RequestMapping("/myOrders")
		public String myOrders(HttpSession session,Model model)
		{
			List<MallOrder> lsOrder=new ArrayList<MallOrder>();
			MallUser user=(MallUser) session.getAttribute("userInfo");
			lsOrder=service.myOrder(user.getId());
			model.addAttribute("Orders",lsOrder);
			return "myOrder";
		}
		
		
		@RequestMapping("/myOrdersByPage")
		public String myOrdersByPage(int pageIndex,HttpSession session,Model model)
		{
			MallUser user=(MallUser) session.getAttribute("userInfo");
	        model.addAttribute("pageInfo",service.myOrderByPage(pageIndex, user.getId()));
	        return "myOrder";
		}
		
	
}
