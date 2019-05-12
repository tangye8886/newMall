package com.tangye.mall.service;
import java.util.List;
import java.util.Map;
import com.github.pagehelper.PageInfo;
import com.tangye.mall.entity.MallCollect;

public interface CollectService {
	public List<MallCollect> allCollect();
	
	public PageInfo<MallCollect> findCollectByUserNo(int pageIndex,long userNo);
	
	public List<MallCollect> findCollectByItemNo(long itemNo);
	
	public MallCollect findCollectById(int id);
	
	public MallCollect searchCollectFlag(Map<String,Object> map);
	
	public int deleteCollect(int id);
	
	public int addCollect(MallCollect collect);
	
	public int updateCollect(MallCollect collect);
	
	public int deleteCollectByUser(Map<String,Object> map);
}
