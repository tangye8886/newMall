package com.tangye.mall.service;
import java.util.List;

import com.tangye.mall.entity.MallOrderShipping;

public interface OrderShippingService {
	
	public List<MallOrderShipping> allOrderShipping();
	
	public MallOrderShipping findOrderShippingByid(long id);//订单详情
	
	public int deleteOrderShipping(long id);
	
	public int addOrderShipping(MallOrderShipping shipping);
	
	public int updateOrderShipping(MallOrderShipping shipping);
	
	public int deleteShippingByOrderId(String orderId);

}
