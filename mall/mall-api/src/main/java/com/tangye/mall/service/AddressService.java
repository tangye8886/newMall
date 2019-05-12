package com.tangye.mall.service;

import java.util.List;
import com.tangye.mall.entity.MallAddress;


public interface AddressService {
	
	public List<MallAddress> myAddress(long userNo);
	
	public int deleteAddress(Integer id);
	
	public int addAddress(MallAddress address);
	
	public int updateAddress(MallAddress address);
	
}
