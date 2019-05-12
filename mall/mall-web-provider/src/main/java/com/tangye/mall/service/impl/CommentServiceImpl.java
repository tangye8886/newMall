package com.tangye.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tangye.mall.entity.MallComment;
import com.tangye.mall.mapper.MallCommentMapper;
import com.tangye.mall.service.CommentService;

@Service
@Component
public class CommentServiceImpl implements CommentService {

	@Resource
	MallCommentMapper mapper;
	
	@Override
	public List<MallComment> allComment() {
		// TODO Auto-generated method stub
		return mapper.allComment();
	}

	@Override
	public MallComment findComment(long id) {
		// TODO Auto-generated method stub
		return mapper.findComment(id);
	}

	@Override
	public List<MallComment> findCommentByItemNo(long itemNo) {
		// TODO Auto-generated method stub
		return mapper.findCommentByItemNo(itemNo);
	}

	@Override
	public List<MallComment> findCommentByUserNo(long userNo) {
		// TODO Auto-generated method stub
		return mapper.findCommentByUserNo(userNo);
	}

	@Override
	public int deleteComment(long id) {
		// TODO Auto-generated method stub
		return mapper.deleteComment(id);
	}

	

	@Override
	public int updateComment(MallComment comment) {
		// TODO Auto-generated method stub
		return mapper.updateComment(comment);
	}

	@Override
	public int insertComment(MallComment comment) {
		// TODO Auto-generated method stub
		return mapper.insertComment(comment);
	}

	@Override
	public List<MallComment> findCommentByOrderId(String orderNo) {
		// TODO Auto-generated method stub
		return mapper.findCommentByOrderId(orderNo);
	}

	@Override
	public int deleteCommentByOrderNo(String orderNo) {
		// TODO Auto-generated method stub
		return mapper.deleteCommentByOrderNo(orderNo);
	}

	@Override
	public PageInfo<MallComment> myCommentByPage(int pageIndex, long userId) {
		PageHelper.startPage(pageIndex,3);
		List<MallComment> myComments = mapper.findCommentByUserNo(userId);
		PageInfo<MallComment> pageInfo = new PageInfo<MallComment>(myComments);
		return pageInfo;
	}

}
