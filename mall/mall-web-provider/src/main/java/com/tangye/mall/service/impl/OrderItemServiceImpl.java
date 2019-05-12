package com.tangye.mall.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.alibaba.dubbo.config.annotation.Service;
import com.tangye.mall.entity.MallOrderItem;
import com.tangye.mall.mapper.MallOrderItemMapper;
import com.tangye.mall.service.OrderItemService;

@Service
@Component
public class OrderItemServiceImpl implements OrderItemService{

	@Resource
	MallOrderItemMapper mapper;
	
	@Override
	public List<MallOrderItem> allOrederItem() {
		// TODO Auto-generated method stub
		return mapper.allOrederItem();
	}

	@Override
	public MallOrderItem findOrederItemByid(long id) {
		// TODO Auto-generated method stub
		return mapper.findOrederItemByid(id);
	}

	@Override
	public int deleteOrederItem(long id) {
		// TODO Auto-generated method stub
		return mapper.deleteOrederItem(id);
	}

	@Override
	public int addOrederItem(MallOrderItem orderItem) {
		// TODO Auto-generated method stub
		return mapper.addOrederItem(orderItem);
	}

	@Override
	public int updateOrederItem(MallOrderItem orderItem) {
		// TODO Auto-generated method stub
		return mapper.updateOrederItem(orderItem);
	}

	@Override
	public MallOrderItem findOrederItemByOrderId(String orderId) {
		// TODO Auto-generated method stub
		return mapper.findOrederItemByOrderId(orderId);
	}

	@Override
	public int deleteOrederItemByOrderId(String orderId) {
		// TODO Auto-generated method stub
		return mapper.deleteOrederItemByOrderId(orderId);
	}

}
