package com.tangye.mall.controller;

import java.io.File;
import java.io.IOException;
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

import com.tangye.mall.entity.AfterService;
import com.tangye.mall.entity.MallUser;
import com.tangye.mall.service.AfterServiceService;
import com.tangye.mall.service.ConsumerService;

/*
   * 售后服务控制器
 */

@Controller
@RequestMapping("/after")
public class AfterController {

	@Resource
	ConsumerService ser;
	
	//跳转售后服务页
	@RequestMapping("/toService")
	public String toService()
	{
		return "afterService";
	}
	
	//提交申请售后服务
	@RequestMapping("/addService")
	public String addService(@RequestParam(value="file",required=false)MultipartFile file,
			@Valid AfterService service,BindingResult bindingResult,HttpServletRequest req)
	{
		String imageUrl="";	
		if(!file.isEmpty())
		{
			String fileName=file.getOriginalFilename();// 文件原名称
			String path =req.getServletContext().getRealPath("/upload/");
			File filepath=new File(path,fileName);
			imageUrl=fileName;
			service.setPhoto(path);
			// 判断路径是否存在，不存在则新创建一个
			if (!filepath.getParentFile().exists()) {
				filepath.getParentFile().mkdirs();
			}
			try {
				file.transferTo(new File(path + fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		service.setCrateTime(new Date());
		service.setStatus(0);//0:未处理，1：已处理
		ser.insertAfterService(service);
		return "/item/";
	}
	
	//我的售后服务
	@RequestMapping("/myService")
	public String myService(Model model,HttpSession session)
	{
		MallUser user=(MallUser)session.getAttribute("userInfo");
		List<AfterService> myAfterService = ser.myAfterService(user.getId());
		model.addAttribute("myServices", myAfterService);
		return "myService";
	}
	
		//删除售后服务的记录
		@ResponseBody
		@RequestMapping("/deleteService")
		public int deleteService(Integer id)
		{
			return ser.deleteAfterService(id);
		}
}
