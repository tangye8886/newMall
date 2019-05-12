package com.tangye.mall.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.alibaba.dubbo.config.annotation.Service;
import com.tangye.mall.entity.MallAddress;
import com.tangye.mall.mapper.MallAddressMapper;
import com.tangye.mall.service.AddressService;

@Service
@Component
public class AddressServiceImpl implements AddressService {

	@Resource
	MallAddressMapper mapper;
	
	@Override
	public List<MallAddress> myAddress(long userNo) {
		return mapper.myAddress(userNo);
	}

	@Override
	public int deleteAddress(Integer id) {
		return mapper.deleteAddress(id);
	}

	@Override
	public int addAddress(MallAddress address) {
		return mapper.addAddress(address);
	}

	@Override
	public int updateAddress(MallAddress address) {
		return mapper.updateAddress(address);
	}

}
