package com.tangye.mall.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tangye.mall.entity.MallComment;
import com.tangye.mall.entity.MallOrder;
import com.tangye.mall.entity.MallUser;
import com.tangye.mall.service.ConsumerService;

/*
 * 评价控制器
 */

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Resource
	ConsumerService consumerService;
	
	//添加评论
	@RequestMapping("/addComment")
	public String insertComment(String id,String itemId[],String orderNo,Integer service,Integer code,Integer quelify,String content[],HttpSession session)
	{
		MallUser user=(MallUser) session.getAttribute("userInfo");
		for(int i=0;i<itemId.length;i++)
		{
			MallComment comment=new MallComment();
			comment.setUserNo(user.getId());
			comment.setItemNo(Long.parseLong(itemId[i]));
			comment.setOrderNo(orderNo);
			comment.setQuelify(quelify);
			comment.setCode(code);
			comment.setService(service);
			comment.setContent(content[i]);
			consumerService.insertComment(comment);
		}
		MallOrder order=new MallOrder();
		order.setId(Long.parseLong(id));
		order.setStatus(6);
		consumerService.updateOreder(order);
		return "redirect:/index.do";  //重定向
	}
	
	//我的评价
	@RequestMapping("/myComment")
	public String myComment(HttpSession session,Model model)
	{
		MallUser user=(MallUser) session.getAttribute("userInfo");
		List<MallComment> myComments = consumerService.findCommentByUserNo(user.getId());
		model.addAttribute("myComments",myComments);
		return "myComment";
	}
	
	
	////我的评价 分页的
	@RequestMapping("/myCommentByPage")
	public String myCommentByPage(int pageIndex,HttpSession session,Model model)
	{
		MallUser user=(MallUser) session.getAttribute("userInfo");
        model.addAttribute("pageInfo",consumerService.myCommentByPage(pageIndex, user.getId()));
		return "myComment";
	}
	
	
	//删除评价
	@ResponseBody
	@RequestMapping("/deleteComment")
	public int deleteComment(String id,String orderNo)
	{
		MallOrder order=new MallOrder();
		order.setId(Long.parseLong(id));
		order.setStatus(5);
		consumerService.updateOreder(order);
		return consumerService.deleteCommentByOrderNo(orderNo);
	}
}
