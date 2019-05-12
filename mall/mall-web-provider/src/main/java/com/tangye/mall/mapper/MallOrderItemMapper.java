package com.tangye.mall.mapper;

import com.tangye.mall.entity.MallOrderItem;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MallOrderItemMapper {
    
	public List<MallOrderItem> allOrederItem();
	
	public MallOrderItem findOrederItemByid(@Param("id")long id);
	
	public MallOrderItem findOrederItemByOrderId(@Param("orderId")String orderId);
	
	public int deleteOrederItem(@Param("id")long id);
	
	public int addOrederItem(MallOrderItem orderItem);
	
	public int updateOrederItem(MallOrderItem orderItem);
	
	public int deleteOrederItemByOrderId(@Param("orderId")String orderId);
	
}