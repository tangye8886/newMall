package com.tangye.mall.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tangye.mall.entity.AfterService;
import com.tangye.mall.entity.MallCar;
import com.tangye.mall.entity.MallOrder;
import com.tangye.mall.entity.MallUser;
import com.tangye.mall.service.ConsumerService;
/*
 * 购物车控制器
 */
@Controller
@RequestMapping("/car")
public class CarController {

	//spring依赖注入
	@Resource
	ConsumerService service;
	
	
	//商城搜索 关键字模糊查询，显示title
	@ResponseBody
	@RequestMapping("/addCar")
	public int addCar(long id,String amount,HttpSession session)
	{
		MallUser user=(MallUser) session.getAttribute("userInfo");
		int flag=0;
		if(user!=null)
		{
			MallCar car=new MallCar(id,user.getId(),Integer.parseInt(amount),new Date());
			flag=service.addCar(car);
		}
		return flag;
    }
	
	//我的购物车
	@RequestMapping("/mycar")
	public String mycar(int pageIndex,HttpSession session,Model model)
	{
		MallUser user=(MallUser) session.getAttribute("userInfo");
		PageInfo<MallCar> pageInfo = service.myCarByPage(pageIndex, user.getId());
		System.out.println(pageInfo.getList().size());
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("count",pageInfo.getList().size());
		return "myCar";
	}
	
	//我的购物车
		@ResponseBody
		@RequestMapping("/mycardemo")
		public PageInfo<MallCar> mycardemo(int pageIndex,HttpSession session)
		{
			MallUser user=(MallUser) session.getAttribute("userInfo");
			PageInfo<MallCar> pageInfo = service.myCarByPage(pageIndex, user.getId());
			return pageInfo;
		}

	//删除购物车商品
	@ResponseBody
	@RequestMapping("/deleteCarItem")
	public int deleteCarItem(Integer id,Model model)
	{
		return service.deleteCar(id);
	}
	
	//更新购物车页面的数量
	@ResponseBody
	@RequestMapping("/updateCarAmount")
	public int updateCar(Integer id,long amount,HttpSession session)
	{
		MallCar car=new MallCar();
		car.setId(id);
		car.setAmount(amount);
		return service.updateCarAmount(car);
    }
}
