package com.tangye.mall.mapper;

import com.tangye.mall.entity.MallOrder;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MallOrderMapper {

	public List<MallOrder> allOreder();
	
	public MallOrder findOreder(@Param("id")long id);
	
	public int deleteOreder(@Param("id")long id);
	
	public int addOreder(MallOrder order);
	
	public int updateOreder(MallOrder order);
	
	public int updateOrederPayment(MallOrder order);
	
	public List<MallOrder> myOrder(@Param("userId")long userId);
	
	public MallOrder findOrderToItemToShpping(@Param("orderId")String orderId);
	
}