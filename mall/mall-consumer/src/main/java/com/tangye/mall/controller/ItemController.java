package com.tangye.mall.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tangye.mall.entity.KeyWord;
import com.tangye.mall.entity.MallCollect;
import com.tangye.mall.entity.MallItem;
import com.tangye.mall.entity.MallUser;
import com.tangye.mall.service.ConsumerService;
/*
 * 商品控制器
 */
@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Resource
	ConsumerService service;
	
	//首页
	@RequestMapping("/index")
	public String toShop(HttpSession session,Model model)
	{
		model.addAttribute("itemList",service.allItem());
		session.setAttribute("pageIndex",1);
		return "index";
	}
	
	
	@RequestMapping("/toItemInfo")
	public String toItemInfo(long id,Model model,HttpSession session)
	{
		model.addAttribute("itemInfo",service.findItemByid(id));
		model.addAttribute("items",service.allItem());
		model.addAttribute("comments",service.findCommentByItemNo(id));
		List<MallCollect> collects = service.findCollectByItemNo(id);
		if(collects!=null) {
			model.addAttribute("collectNum",collects.size());
		}
		
		MallUser user=(MallUser) session.getAttribute("userInfo");
		int flag=0;
		if(user!=null)
		{
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("itemNo",id);
			map.put("userNo",user.getId());
			MallCollect userCollect = service.searchCollectFlag(map);
			if(userCollect!=null) flag=1;
		}
		model.addAttribute("flag",flag);
		return "itemInfo";
	}
	
	//商城搜索 关键字模糊查询，显示title
			@ResponseBody
			@RequestMapping("/searchItembyTitle/{title}")
			public List<KeyWord> searchItembyTitle(@PathVariable("title") String title,HttpSession session)
			{
				List<KeyWord> searchItemLike = service.searchItemLike(title);
				return searchItemLike;
			}
		
			
			@RequestMapping("/searchlistByPage")
			public String searchlistByPage(Integer pageIndex,String title,String cat,String price,String sort,HttpSession session,Model model)
			{
				if(pageIndex<1||pageIndex==null) pageIndex=1;
				Map<String, Object> sortItemPage = service.sortItemPage(pageIndex,title,cat,price,sort);
				List<MallItem> solrItemList = (List<MallItem>) sortItemPage.get("pList");
				model.addAttribute("pages",sortItemPage.get("pages"));
				model.addAttribute("totls",sortItemPage.get("totls"));
				if(solrItemList!=null) model.addAttribute("itemList",solrItemList);
				if(title!=null)model.addAttribute("title",title);
				if(title!=null)session.setAttribute("query",title);
				if(price!=null)
				{
					model.addAttribute("price",price);
				}
				if(sort!=null)model.addAttribute("sort",sort);
				if(cat!=null)model.addAttribute("cat",cat);
				System.out.println("solrItemList:"+solrItemList.size());
				System.out.println("title:"+title);
				System.out.println("price:"+price);
				System.out.println("sort:"+sort);
				System.out.println("cat:"+cat);
				model.addAttribute("pageIndex",pageIndex);
				return "search";
			}
	
}
