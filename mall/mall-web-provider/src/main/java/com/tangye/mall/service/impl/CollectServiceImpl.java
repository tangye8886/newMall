package com.tangye.mall.service.impl;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tangye.mall.entity.MallCollect;
import com.tangye.mall.mapper.MallCollectMapper;
import com.tangye.mall.service.CollectService;

@Service
@Component
public class CollectServiceImpl implements CollectService{

	
	@Resource
	MallCollectMapper mapper;
	
	
	@Override
	public List<MallCollect> allCollect() {
		// TODO Auto-generated method stub
		return mapper.allCollect();
	}

	@Override
	public PageInfo<MallCollect> findCollectByUserNo(int pageIndex,long userNo) {
		PageHelper.startPage(pageIndex,3);
		List<MallCollect> list = mapper.findCollectByUserNo(userNo);
		PageInfo<MallCollect> pageInfo = new PageInfo<MallCollect>(list);
		return pageInfo;
	}

	@Override
	public List<MallCollect> findCollectByItemNo(long itemNo) {
		// TODO Auto-generated method stub
		return mapper.findCollectByItemNo(itemNo);
	}

	@Override
	public MallCollect findCollectById(int id) {
		// TODO Auto-generated method stub
		return mapper.findCollectById(id);
	}

	@Override
	public int deleteCollect(int id) {
		// TODO Auto-generated method stub
		return mapper.deleteCollect(id);
	}

	@Override
	public int addCollect(MallCollect collect) {
		// TODO Auto-generated method stub
		return mapper.addCollect(collect);
	}

	@Override
	public int updateCollect(MallCollect collect) {
		// TODO Auto-generated method stub
		return mapper.updateCollect(collect);
	}

	@Override
	public MallCollect searchCollectFlag(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.searchCollectFlag(map);
	}

	@Override
	public int deleteCollectByUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.deleteCollectByUser(map);
	}

}
