package com.tangye.mall.service;
import java.util.List;
import java.util.Map;

import com.tangye.mall.entity.KeyWord;
import com.tangye.mall.entity.MallItem;

/*
 * 商品服务
 */
public interface ItemService {
	
	public List<MallItem> allItem();
	
	public MallItem findItemByid(long id);
	
	public int deleteItem(long id);
	
	public int updateItem(MallItem item);
	
	public int addItem(MallItem item);
	
	public List<KeyWord> searchItemLike(String title);
	
	public List<MallItem> sortItem(String title,String cat,String price,String sort);
	
	public void addSolrItem(MallItem item);//增加跟修改一样
	
	public void deleteSolrItem(String id);
	
	public Map<String,Object> sortItemPage(Integer pageIndex,String title,String cat,String price,String sort);
	
}
