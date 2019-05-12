package com.tangye.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.tangye.mall.entity.MallCollect;

public interface MallCollectMapper {

	public List<MallCollect> allCollect();
	
	public List<MallCollect> findCollectByUserNo(@Param("userNo")long userNo);
	
	public List<MallCollect> findCollectByItemNo(@Param("itemNo")long itemNo);
	
	public MallCollect findCollectById(@Param("id")int id);
	
	public MallCollect searchCollectFlag(Map<String,Object> map);
	
	public int deleteCollect(@Param("id")int id);
	
	public int addCollect(MallCollect collect);
	
	public int updateCollect(MallCollect collect);
	
	public int deleteCollectByUser(Map<String,Object> map);
}
