package com.tangye.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tangye.mall.entity.MallOrder;
import com.tangye.mall.mapper.MallOrderMapper;
import com.tangye.mall.service.OrderService;

@Service
@Component
public class OrderServiceImpl implements OrderService {

	@Resource
	MallOrderMapper mapper;
	
	@Override
	public List<MallOrder> allOreder() {
		// TODO Auto-generated method stub
		return mapper.allOreder();
	}

	@Override
	public MallOrder findOreder(long id) {
		// TODO Auto-generated method stub
		return mapper.findOreder(id);
	}

	@Override
	public int deleteOreder(long id) {
		// TODO Auto-generated method stub
		return mapper.deleteOreder(id);
	}

	@Override
	public int addOreder(MallOrder order) {
		// TODO Auto-generated method stub
		return mapper.addOreder(order);
	}

	@Override
	public int updateOreder(MallOrder order) {
		// TODO Auto-generated method stub
		return mapper.updateOreder(order);
	}

	@Override
	public List<MallOrder> myOrder(long userId) {
		// TODO Auto-generated method stub
		return mapper.myOrder(userId);
	}

	@Override
	public MallOrder findOrderToItemToShpping(String orderId) {
		// TODO Auto-generated method stub
		return mapper.findOrderToItemToShpping(orderId);
	}

	@Override
	public int updateOrederPayment(MallOrder order) {
		// TODO Auto-generated method stub
		return mapper.updateOrederPayment(order);
	}

	@Override
	public PageInfo<MallOrder> myOrderByPage(int pageIndex, long userId) {
		PageHelper.startPage(pageIndex,3);
		List<MallOrder> list = mapper.myOrder(userId);
		PageInfo<MallOrder> pageInfo = new PageInfo<MallOrder>(list);
		return pageInfo;
	}

}
