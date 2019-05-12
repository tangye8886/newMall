package com.tangye.mall.service;
import java.util.List;
import com.github.pagehelper.PageInfo;
import com.tangye.mall.entity.MallOrder;

public interface OrderService {
	public List<MallOrder> allOreder();
	
	public List<MallOrder> myOrder(long userId);
	
	public MallOrder findOreder(long id);
	
	public int deleteOreder(long id);
	
	public int addOreder(MallOrder order);
	
	public int updateOreder(MallOrder order);
	
	public int updateOrederPayment(MallOrder order);
	//一对一
	public MallOrder findOrderToItemToShpping(String orderId);
	
	//带分页功能的返回用户所有订单
	public PageInfo<MallOrder> myOrderByPage(int pageIndex,long userId);
}
