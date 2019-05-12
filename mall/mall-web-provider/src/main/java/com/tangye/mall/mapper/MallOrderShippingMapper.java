package com.tangye.mall.mapper;

import com.tangye.mall.entity.MallOrderShipping;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MallOrderShippingMapper {
	public List<MallOrderShipping> allOrderShipping();
	
	public MallOrderShipping findOrderShippingByid(@Param("id")long id);
	
	public int deleteOrderShipping(@Param("id")long id);
	
	public int addOrderShipping(MallOrderShipping shipping);
	
	public int updateOrderShipping(MallOrderShipping shipping);
	
	public int deleteShippingByOrderId(@Param("orderId")String orderId);
}