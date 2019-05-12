package com.tangye.mall.mapper;

import com.tangye.mall.entity.MallItemCat;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MallItemCatMapper {
	
	public List<MallItemCat> allItemCat();
	
	public MallItemCat findItemCatParent(@Param("id")long id);
	
	public MallItemCat findItemCatByid(@Param("id")long id);
	
	public int deleteItemCat(@Param("id")long id);
	
	public int addItemCat(MallItemCat itemcat);
	
	public int updateItemCat(MallItemCat itemcat);
	
	public List<MallItemCat> getOneCatParent();
	
	public List<MallItemCat> getTwoCatParent();
	
	public List<MallItemCat> getThreeCatParent();
	
	public List<MallItemCat> getCatSon(@Param("parentId")long parentId);
	
}