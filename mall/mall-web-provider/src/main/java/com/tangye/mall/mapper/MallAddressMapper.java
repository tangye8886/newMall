package com.tangye.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tangye.mall.entity.MallAddress;

public interface MallAddressMapper {
	public List<MallAddress> myAddress(@Param("userNo")long userNo);
	
	public int deleteAddress(@Param("id")Integer id);
	
	public int addAddress(MallAddress address);
	
	public int updateAddress(MallAddress address);
}
