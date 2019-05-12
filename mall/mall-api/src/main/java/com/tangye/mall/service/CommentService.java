package com.tangye.mall.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.tangye.mall.entity.MallComment;

public interface CommentService {

	public List<MallComment> allComment();
	
	public MallComment findComment(long id);
	
	public List<MallComment> findCommentByItemNo(long itemNo);
	
	public List<MallComment> findCommentByUserNo(long userNo);
	
	public List<MallComment> findCommentByOrderId(String orderNo);
	
	public int deleteComment(long id);
	
	public int deleteCommentByOrderNo(String orderNo);
	
	public int insertComment(MallComment comment);
	
	public int updateComment(MallComment comment);
	
	//带分页功能返回我的所有评论
	public PageInfo<MallComment> myCommentByPage(int pageIndex,long userId);
}
