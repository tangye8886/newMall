package com.tangye.mall.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.tangye.mall.entity.MallComment;

public interface MallCommentMapper {
	public List<MallComment> allComment();
	
	public MallComment findComment(@Param("id")long id);
	
	public List<MallComment> findCommentByItemNo(@Param("itemNo")long itemNo);
	
	public List<MallComment> findCommentByUserNo(@Param("userNo")long userNo);
	
	public List<MallComment> findCommentByOrderId(@Param("orderNo")String orderNo);
	
	public int deleteComment(@Param("id")long id);
	
	public int deleteCommentByOrderNo(@Param("orderNo")String orderNo);
	
	public int insertComment(MallComment comment);
	
	public int updateComment(MallComment comment);
	
}
