package com.tangye.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.alibaba.dubbo.config.annotation.Service;
import com.tangye.mall.entity.AfterService;
import com.tangye.mall.mapper.MallAfterServiceMapper;
import com.tangye.mall.service.AfterServiceService;
@Service
@Component
public class AfterServiceImpl implements AfterServiceService{

	@Resource
	MallAfterServiceMapper mapper;
	
	@Override
	public List<AfterService> allAfterService() {
		// TODO Auto-generated method stub
		return mapper.allAfterService();
	}

	@Override
	public AfterService findAfterService(int id) {
		// TODO Auto-generated method stub
		return mapper.findAfterService(id);
	}

	@Override
	public int deleteAfterService(int id) {
		// TODO Auto-generated method stub
		return mapper.deleteAfterService(id);
	}

	@Override
	public int insertAfterService(AfterService afterService) {
		// TODO Auto-generated method stub
		return mapper.addAfterService(afterService);
	}

	@Override
	public int updateAfterService(AfterService afterService) {
		// TODO Auto-generated method stub
		return mapper.updateAfterService(afterService);
	}

	@Override
	public List<AfterService> myAfterService(long userNo) {
		// TODO Auto-generated method stub
		return mapper.myAfterService(userNo);
	}

}
