package com.tangye.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tangye.mall.entity.AfterService;

public interface MallAfterServiceMapper {
	public List<AfterService> allAfterService(); 
	
	public List<AfterService> myAfterService(@Param("userNo")long userNo);
	
	public AfterService findAfterService(@Param("id") int id);
	
	public int deleteAfterService(@Param("id")int id);
	
	public int addAfterService(AfterService afterService);
	
	public int updateAfterService(AfterService afterService);
}
