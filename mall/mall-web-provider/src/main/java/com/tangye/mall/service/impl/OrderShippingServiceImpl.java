package com.tangye.mall.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.alibaba.dubbo.config.annotation.Service;
import com.tangye.mall.entity.MallOrderShipping;
import com.tangye.mall.mapper.MallOrderShippingMapper;
import com.tangye.mall.service.OrderShippingService;

@Service
@Component
public class OrderShippingServiceImpl implements OrderShippingService {

	@Resource
	MallOrderShippingMapper mapper;
	
	
	@Override
	public List<MallOrderShipping> allOrderShipping() {
		// TODO Auto-generated method stub
		return mapper.allOrderShipping();
	}

	@Override
	public MallOrderShipping findOrderShippingByid(long id) {
		// TODO Auto-generated method stub
		return mapper.findOrderShippingByid(id);
	}

	@Override
	public int deleteOrderShipping(long id) {
		// TODO Auto-generated method stub
		return mapper.deleteOrderShipping(id);
	}

	@Override
	public int addOrderShipping(MallOrderShipping shipping) {
		// TODO Auto-generated method stub
		return mapper.addOrderShipping(shipping);
	}

	@Override
	public int updateOrderShipping(MallOrderShipping shipping) {
		// TODO Auto-generated method stub
		return mapper.updateOrderShipping(shipping);
	}

	@Override
	public int deleteShippingByOrderId(String orderId) {
		// TODO Auto-generated method stub
		return mapper.deleteShippingByOrderId(orderId);
	}

}
