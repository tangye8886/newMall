package com.tangye.mall.service;

import java.util.List;
import com.tangye.mall.entity.MallItemCat;

public interface ItemCatService {
	
	public List<MallItemCat> allItemCat();
	
	public MallItemCat findItemCatByid(long id);
	
	public MallItemCat findItemCatParent(long id);
	
	public int deleteItemCat(long id);
	
	public int addItemCat(MallItemCat itemcat);
	
	public int updateItemCat(MallItemCat itemcat);

	
	public List<MallItemCat> getOneCatParent();
	
	public List<MallItemCat> getTwoCatParent();
	
	public List<MallItemCat> getThreeCatParent();
	
	public List<MallItemCat> getCatSon(long parentId);
}
