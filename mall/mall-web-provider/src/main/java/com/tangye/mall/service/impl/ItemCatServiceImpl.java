package com.tangye.mall.service.impl;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.alibaba.dubbo.config.annotation.Service;
import com.tangye.mall.entity.MallItemCat;
import com.tangye.mall.mapper.MallItemCatMapper;
import com.tangye.mall.service.ItemCatService;

@Service
@Component
public class ItemCatServiceImpl implements ItemCatService{

	@Resource
	MallItemCatMapper mapper;
	
	@Override
	public List<MallItemCat> allItemCat() {
		// TODO Auto-generated method stub
		return mapper.allItemCat();
	}

	@Override
	public MallItemCat findItemCatByid(long id) {
		// TODO Auto-generated method stub
		return mapper.findItemCatByid(id);
	}

	@Override
	public int deleteItemCat(long id) {
		// TODO Auto-generated method stub
		return mapper.deleteItemCat(id);
	}

	@Override
	public int addItemCat(MallItemCat itemcat) {
		// TODO Auto-generated method stub
		return mapper.addItemCat(itemcat);
	}

	@Override
	public int updateItemCat(MallItemCat itemcat) {
		// TODO Auto-generated method stub
		return mapper.updateItemCat(itemcat);
	}

	@Override
	public MallItemCat findItemCatParent(long id) {
		// TODO Auto-generated method stub
		return mapper.findItemCatParent(id);
	}

	@Override
	public List<MallItemCat> getOneCatParent() {
		// TODO Auto-generated method stub
		return mapper.getOneCatParent();
	}

	@Override
	public List<MallItemCat> getTwoCatParent() {
		// TODO Auto-generated method stub
		return mapper.getTwoCatParent();
	}

	@Override
	public List<MallItemCat> getThreeCatParent() {
		// TODO Auto-generated method stub
		return mapper.getThreeCatParent();
	}

	@Override
	public List<MallItemCat> getCatSon(long parentId) {
		// TODO Auto-generated method stub
		return mapper.getCatSon(parentId);
	}

}
