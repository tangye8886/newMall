package com.tangye.mall.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tangye.mall.entity.MallAddress;
import com.tangye.mall.entity.MallCar;
import com.tangye.mall.entity.MallUser;
import com.tangye.mall.service.ConsumerService;
import com.tangye.mall.utils.ImageUtil;
/*
 * 用户控制器
 */
@Controller
@RequestMapping("/user/")
public class UserController {
	
	@Resource
	ConsumerService service;
	
		//跳转登录
		@RequestMapping("/tologin")
		public String tologin()
		{
			return "login";
		}
		//处理登录表单
		//登录
		@RequestMapping("/login")
		public String login(String username,String password,HttpSession session,Model model)
		{
			MallUser user=service.loginUser(username);
			String url="login";
			try {
				if(user!=null)
				{
					if(user.getPassword().equals(password))
					{
						if(user.getRole()==2) //1:管理 2用户
						{
							url="index"; //进入默认页
							session.setAttribute("userInfo", user);
							model.addAttribute("itemList",service.allItem());
							session.setAttribute("pageIndex",1);
						}
					}
				}
			}catch(Exception e)
			{
				System.out.println(e);
			}
			return url;
		}
		//注销
		@RequestMapping("/logout")
		public String logout(HttpSession session)
		{
			session.invalidate();
			return "login";
		}
		
		//跳转个人中心
		@RequestMapping("/toMyInfo")
		public String toMyInfo()
		{
			return "myInfo";
		}
		
		
		//跳转注册页面
		@RequestMapping("/toRegister")
		public String toRegister()
		{
			return "register";
		}
		
		//处理注册表单
		@RequestMapping("/register")
		public String register(MallUser user,Model model)
		{
			user.setRole(2);
			user.setCreated(new Date());
			int flag = service.addUser(user);
			if(flag>0)
			{
				
				//向注册者发送邮件提醒
				String msg=	user.getEmail()+" "+user.getUsername();
				service.rabbitSendMsg(msg);
				return "login";
			}else
			return "register";
		}
		
		//修改个人信息
		@ResponseBody
		@RequestMapping("/updateUserInfo")
		public int updateUserInfo(String username,String email,String phone,HttpSession session)
		{
			MallUser user=(MallUser) session.getAttribute("userInfo");
			user.setUsername(username);
			user.setEmail(email);
			user.setPhone(phone);
			System.out.println(username+" "+email+" "+phone );
			return service.updateUser(user);
		}	
		
		//修改密码
		@ResponseBody
		@RequestMapping("/updateMypwd")
		public int updateMypwd(String pwd,HttpSession session)
		{
			MallUser user=(MallUser) session.getAttribute("userInfo");
			user.setPassword(pwd);//赋值新的密码
			return service.updateUser(user);
		}	
		
		//我的地址
		@RequestMapping("/myAddress")
		public String myaddress(HttpSession session,Model model)
		{
			MallUser user=(MallUser) session.getAttribute("userInfo");
			List<MallAddress> myAddress = service.myAddress(user.getId());
			model.addAttribute("myAddress", myAddress);
			return "myAddress";
		}
		
		//修改地址
		@ResponseBody
		@RequestMapping("/updateMyAddress")
		public int updateMyAddress(MallAddress address,HttpSession session,Model model)
		{
			MallUser user=(MallUser) session.getAttribute("userInfo");
			address.setUserNo(user.getId().longValue());
			return service.updateAddress(address);
		}
		
		//删除地址
		@ResponseBody
		@RequestMapping("/deleteMyAddress")
		public int deleteMyAddress(Integer id,HttpSession session,Model model)
		{
			return service.deleteAddress(id);
		}
	
		//添加地址
		@ResponseBody
		@RequestMapping("/addMyAddress")
		public int addMyAddress(MallAddress address,HttpSession session,Model model)
		{
			MallUser user=(MallUser) session.getAttribute("userInfo");
			address.setCreateTime(new Date());
			address.setUserNo(user.getId());
			return service.addAddress(address);
		}
		
		
		//判断用户名是否被占用
		@ResponseBody
		@RequestMapping("/findUserNameExeit")
		public int findUserNameExeit(String username)
		{
			MallUser user=service.loginUser(username);
			if(user!=null)
			{
				return 1; //存在
			}else 
			return 0;//不存在
		}	
		
		
		//获得验证码
		@ResponseBody
		@RequestMapping("/getCode")
		public String getCode(HttpServletRequest request,HttpServletResponse response)
		{
			response.setContentType("image/jpeg");
	        //禁止图像缓存
	        response.setHeader("Pragma","no-cache");
	        response.setHeader("Cache-Control", "no-cache");
	        response.setDateHeader("Expires", 0);
	        HttpSession session = request.getSession();
	        ImageUtil imageUtil = new ImageUtil(120, 40, 5,30);
	        session.setAttribute("code", imageUtil.getCode());
	        try {
				imageUtil.write(response.getOutputStream());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		
		//验证验证码
		@ResponseBody
		@RequestMapping("/yanzheng")
		public int yanzheng(String code,HttpSession session) {
			String sessionCode=(String) session.getAttribute("code");
			if(!code.equalsIgnoreCase(sessionCode))
			{
				return 0;
			}
			return 1;
		}
	
		
		//跳转聊天
				@RequestMapping("/toChat")
				public String toChat()
				{
					return "chat";
				}
}
