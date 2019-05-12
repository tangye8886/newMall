package com.tangye.mall.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.tangye.mall.entity.MallCollect;
import com.tangye.mall.entity.MallUser;
import com.tangye.mall.service.CollectService;
import com.tangye.mall.service.ConsumerService;

@Controller
@RequestMapping("/collect")
public class CollectController {
	
	@Resource
	ConsumerService service;
	
	//我的收藏
	@RequestMapping("/myCollect")
	public String myCollect(int pageIndex,Model model,HttpSession session)
	{
		if(pageIndex<1)pageIndex=1;
		MallUser user= (MallUser) session.getAttribute("userInfo");
		model.addAttribute("pageInfo", service.findCollectByUserNo(pageIndex,user.getId()));
		return "myCollect";
	}
	
	
	//根据商品编号跟用户id删除收藏
	@ResponseBody
	@RequestMapping("/deleteCollect")
	public int deleteCollect(long itemNo,HttpSession session)
	{
		int flag=0;
		MallUser user= (MallUser) session.getAttribute("userInfo");
		if(user!=null)
		{
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("userNo",user.getId());
			map.put("itemNo",itemNo);
			flag=service.deleteCollectByUser(map);
		}
		return flag;
	}
	
	//根据id删除收藏
	@ResponseBody
	@RequestMapping("/deleteCollectByid")
	public int deleteCollectByid(int id)
	{
		return service.deleteCollect(id);
	}
	
}
