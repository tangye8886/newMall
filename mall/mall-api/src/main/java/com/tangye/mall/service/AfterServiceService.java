package com.tangye.mall.service;

import java.util.List;

import com.tangye.mall.entity.AfterService;

public interface AfterServiceService {
	
	public List<AfterService> allAfterService();
	
	public List<AfterService> myAfterService(long userNo);
	
	public AfterService findAfterService(int id);
	
	public int deleteAfterService(int id);
	
	public int insertAfterService(AfterService afterService);
	
	public int updateAfterService(AfterService afterService);
}
