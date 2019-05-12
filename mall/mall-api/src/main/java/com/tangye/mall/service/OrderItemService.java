package com.tangye.mall.service;

import java.util.List;


import com.tangye.mall.entity.MallOrderItem;

public interface OrderItemService {
	public List<MallOrderItem> allOrederItem();
	
	public MallOrderItem findOrederItemByid(long id);
	
	public MallOrderItem findOrederItemByOrderId(String orderId);
	
	public int deleteOrederItem(long id);
	
	public int addOrederItem(MallOrderItem orderItem);
	
	public int updateOrederItem(MallOrderItem orderItem);
	
	public int deleteOrederItemByOrderId(String orderId);
	
}
