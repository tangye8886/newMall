package com.tangye.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tangye.mall.entity.KeyWord;
import com.tangye.mall.entity.MallItem;

public interface MallItemMapper {

	public List<MallItem> allItem();
	
	public List<KeyWord> searchItemLike(@Param("title")String title);
	
	public MallItem findItemByid(@Param("id")long id);
	
	public int deleteItem(@Param("id")long id);
	
	public int updateItem(MallItem item);
	
	public int addItem(MallItem item);
   
}