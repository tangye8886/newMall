package com.tangye.mall.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tangye.mall.entity.AfterService;
import com.tangye.mall.entity.MallItem;
import com.tangye.mall.entity.MallItemCat;
import com.tangye.mall.entity.MallOrder;
import com.tangye.mall.entity.MallOrderItem;
import com.tangye.mall.entity.MallOrderShipping;
import com.tangye.mall.entity.MallUser;
import com.tangye.mall.service.ManagerService;

/**
* @author 汤泓韬
* @version 创建时间
* @ClassName ManagerController
* @Description 后台管理员控制器
*/

/*
 * 控制层
 */

@Controller
public class ManagerController {

	//spring依赖注入ManagerService 相当ManagerService service=new ManagerService();
	@Resource
	ManagerService service;
	
	//----------------------通用--------------------------

	//跳转登录页
	@RequestMapping("/tologin")
	public String toManagerIndex()
	{
		return "public/index";
	}

	//登录处理
	@RequestMapping("/login")
	public String login(String username,String password,HttpSession session)
	{
		MallUser user=service.loginUser(username);
		String url="public/index";
		try {
			if(user!=null)
			{
				if(user.getPassword().equals(password))
				{
					if(user.getRole()==1)//管理员
					{
						url="public/main";
						session.setAttribute("userInfo", user);
					}
				}
				System.out.println(user);
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
		return "public/index";
	}
	
	//--------------------------------------用户管理-------------------------------------------
	
	//用户管理页
	@RequestMapping("/userManager")
	public String userManager(Model model)
	{
		List<MallUser> allUser = service.allUser();
		model.addAttribute("userList", allUser);
		return "user/userManager";
	}
	//跳转用户添加
	@RequestMapping("/toAddUser")
	public String toAddUser(Model model)
	{
		return "user/userAdd";
	}
	
	//添加用户操作
	@RequestMapping("/addUser")
	public String doAddUser(String username,String password,String phone,String email,String role)
	{
		MallUser user=new MallUser();
		user.setUsername(username);
		user.setPassword(password);
		user.setPhone(phone);
		user.setEmail(email);
		user.setCreated(new Date());
		if(role!=null && !"".equals(role))
		{
			user.setRole(Integer.parseInt(role));
		}
		if(service.addUser(user)>0)
		{
			return "redirect:userManager";
		}else 
		return "redirect:toAddUser";
	}
	
	//跳转修改信息
	
	@RequestMapping("/toUpdateUser/{id}")
	public String toUpdateUser(@PathVariable("id")long id,Model model)
	{
		model.addAttribute("userInfo",service.findUserByid(id));
		return "user/userModify";
	}
	
	//处理修改
	@RequestMapping("/updateUser")
	public String doUpdateUser(MallUser user,Model model)
	{
		user.setUpdated(new Date());
		if(service.updateUser(user)>0)
		{
			return "redirect:userManager";
		}else 
			return "redirect:toUpdateUser?id="+user.getId();
	}
	
	//用户删除
	@RequestMapping("/deleteUser")
	public String deleteUser(long[] id)
	{
		for(int i=0;i<id.length;i++)
		{
			service.deleteUser(id[i]);
		}
		return "redirect:userManager";
	}
	
	
	
	
	
	
	
	
	//-----------------------商品管理------------------------------------------------------------
	
	//商品列表
	  @RequestMapping("/itemManager")
	  public String itemManager(Model model) {
		  List<MallItem> allItem = service.allItem();
		  model.addAttribute("itemList", allItem); 
		  return "item/itemManager";
	  }
	  
	  //跳转添加商品
	 @RequestMapping("/toAddItem")
	 public String toAddItem(Model model) {
		 model.addAttribute("catOneList",service.getOneCatParent());
		 return "item/itemAdd"; 
	 }
	  
	 //处理添加商品
	 @RequestMapping("/addItem")
	 public String addItem(@Valid MallItem item,BindingResult bindingResult) 
	 {
		 service.addSolrItem(item);
		 if(service.addItem(item)>0) 
		 {
			 return "redirect:itemManager"; 
	  	 }else
	  		return "redirect:toAddItem";
	 }
	  
	 //跳转更新商品
	  @RequestMapping("/toUpdateItem/{id}")
	  public String toUpdateItem(@PathVariable("id")long id,Model model) 
	  { 
		  MallItem item=service.findItemByid(id);
		  model.addAttribute("item",item);
		  MallItemCat mallCat1 = service.findItemCatByid(item.getCid());
		  MallItemCat mallCat2 = service.findItemCatParent(mallCat1.getParentId());
		  MallItemCat mallCat3 = service.findItemCatParent(mallCat2.getParentId());
		  model.addAttribute("mallCat1",mallCat1);
		  model.addAttribute("mallCat2",mallCat2);
		  model.addAttribute("mallCat3",mallCat3);
		  model.addAttribute("catOneList",service.getOneCatParent());
		  model.addAttribute("catTwoList",service.getTwoCatParent());
		  model.addAttribute("catThreeList",service.getThreeCatParent());
		  model.addAttribute("allCatList",service.allItemCat());
		  return "item/itemModify"; 
	  }
	  
	  //处理更新商品
	  @RequestMapping("/updateItem")
	  public String updateItem(@Valid MallItem item,BindingResult bindingResult) 
	  {
		  service.addSolrItem(item);  //更新solr的商品数据
		  
		  if(service.updateItem(item)>0)
		  { 
			  return "redirect:itemManager"; 
		  }
		  else
			  return "redirect:toUpdateItem?id="+item.getId();
	}
	  
	  //商品删除
	  
	  @RequestMapping("/deleteItem") 
	  public String deleteItem(long id[]) 
	  { 
		  for(int i=0;i<id.length;i++)
		  {
			  service.deleteItem(id[i]);
			  service.deleteSolrItem(id[i]+"");
		  }
		  return "redirect:itemManager";
	  }
	  
	  
	  
	  //用于添加商品时，显示分类
	  @ResponseBody
	  @RequestMapping("/findCatSon") 
	  List<MallItemCat> catSon(long parentId)
	  {
		  List<MallItemCat> catSonList=new ArrayList<MallItemCat>();
		  catSonList=service.getCatSon(parentId);
		  return catSonList;
	  }
	  
	  
	  
	  
	  //带图片上传的添加商品
	  @RequestMapping("/newAddItem")
		 public String newAddItem(@RequestParam(value="photo",required=false)MultipartFile file,
				 @Valid MallItem item,BindingResult bindingResult,HttpServletRequest req) 
		 {
		    String imageUrl="";	
		    Random r=new Random(1000);
			//图片上传
			if(!file.isEmpty())
			{
				String fileName=r+file.getOriginalFilename();// 文件原名称
				String path =req.getServletContext().getRealPath("/images/");
				File filepath=new File(path,fileName);
				imageUrl=fileName;
				System.out.println(imageUrl);
				item.setImage("images/"+imageUrl);
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
			 if(service.addItem(item)>0) 
			 {
				 return "redirect:itemManager"; 
		  	 }else
		  		return "redirect:toAddItem";
			 
		 }
	  
	  
	  
	  
	  //-----------------------------订单管理-----------------------------------------
	  
	  //订单列表
	 @RequestMapping("/orderManager") 
	 public String orderManager(Model model)
	  {
		  model.addAttribute("orderList",service.allOreder());
		  return "order/orderManager"; 
	  }
	 
	 //跳转添加订单
	  @RequestMapping("/toAddOrder") 
	  public String toAddOrder(Model model)
	  {
		  model.addAttribute("userList",service.allUser());
		  return "order/orderAdd"; 
	  }
	  
	  //处理添加订单
	  @RequestMapping("/addOrder") 
	  public String addOrder(@Valid MallOrder order,BindingResult bindingResult1,
			  @Valid MallOrderItem orderItem,BindingResult bindingResult2,
			  @Valid MallOrderShipping orderShipping,BindingResult bindingResult3,
			  String userId,Model model,HttpSession session)
	  {
		  int machineId = 1;//最大支持1-9个集群机器部署
		  int hashCodeV = UUID.randomUUID().toString().hashCode();
		  if(hashCodeV < 0) {hashCodeV = - hashCodeV;}
		  String WIDout_trade_no=machineId+ String.format("%015d", hashCodeV);
		  order.setOrderId(WIDout_trade_no);
		  order.setCreateTime(new Date());
		  order.setUserId(Long.parseLong(userId));
		  orderItem.setOrderId(WIDout_trade_no);
		  orderShipping.setOrderId(WIDout_trade_no);
		  orderShipping.setCreated(new Date());
		  
		  service.addOreder(order);
		  service.addOrederItem(orderItem);
		  service.addOrderShipping(orderShipping);
		  return "redirect:orderManager"; 
	  }
	 
	 //跳转修改订单
	  @RequestMapping("/toUpdateOrder/{orderId}") 
	  public String toUpdateOrder(@PathVariable("orderId")String orderId,Model model)
	  {
		  model.addAttribute("orderInfo",service.findOrderToItemToShpping(orderId));
		  model.addAttribute("userList",service.allUser());
		  return "order/orderModify"; 
	  }
	  
	  //更新订单
	  @RequestMapping("/updateOrder") 
	  public String updateOrder(@Valid MallOrder order,BindingResult bindingResult1,
			  @Valid MallOrderShipping orderShipping,BindingResult bindingResult,
			  String id1,String id2,String billNo,
			  String id[],String itemId[],Integer num[],String title[],String price[],String totalFee[],
			  Model model)
	  {
		  order.setUpdateTime(new Date());
		  order.setId(Long.parseLong(id1));
		  order.setOrderId(billNo);
		  
		  for(int i=0;i<id.length;i++)
		  {
			  MallOrderItem orderItem=new MallOrderItem();
			  orderItem.setId(Long.parseLong(id[i]));
			  orderItem.setItemId(itemId[i]);
			  orderItem.setOrderId(billNo);
			  orderItem.setNum(num[i]);
			  orderItem.setTitle(title[i]);
			  orderItem.setPrice(Long.parseLong(price[i]));
			  orderItem.setTotalFee(Long.parseLong(totalFee[i]));
			  service.updateOrederItem(orderItem);//3
		  }
		  
		  orderShipping.setId(Long.parseLong(id2));
		  orderShipping.setUpdated(new Date());
		  orderShipping.setOrderId(billNo);
		  
		  service.updateOreder(order);//1
		  service.updateOrderShipping(orderShipping);//2
		  return "redirect:orderManager"; 
	  }
	 
	 //删除订单
	  @ResponseBody
	  @RequestMapping("/deleteOrder") 
	  public String deleteOrder(String id[])
	  {
		  
		  for(int i=0;i<id.length;i++)
		  {
			  MallOrder findOreder = service.findOreder(Long.parseLong(id[i]));
			  service.deleteOrederItemByOrderId(findOreder.getOrderId());    
			  service.deleteShippingByOrderId(findOreder.getOrderId());
			  service.deleteOreder(Long.parseLong(id[i]));
		  }
		  return "redirect:orderManager"; 
	  }
	
	  //跳转订单详情页
	  @RequestMapping("/orderInfo/{orderId}") 
	  public String orderInfo(@PathVariable("orderId")String orderId,Model model)
	  {
		  model.addAttribute("orderInfo",service.findOrderToItemToShpping(orderId));
		  model.addAttribute("userList",service.allUser());
		  return "order/orderInfo"; 
	  }

	  @RequestMapping("/toAliPay") 
	  public String toAliPay(String id,Model model)
	  {
		  MallOrder order=service.findOreder(Long.parseLong(id));
		  MallOrder order2=new MallOrder();
		  order2.setStatus(8);
		  order2.setId(Long.parseLong(id));
		  service.updateOreder(order2);
		  model.addAttribute("WIDTRout_trade_no",order.getOrderId());
		  model.addAttribute("WIDTRtrade_no",order.getPostFee());
		  model.addAttribute("WIDTRrefund_amount",order.getPayment());
		  model.addAttribute("id",id);
		  return "alipay/index"; 
	  }
	  
	  
	  
	  //-------------------------售后服务-------------------------
	  //售后服务的列表
	  @RequestMapping("/afterManager") 
	  public String afterManager(Model model)
	  {
		  model.addAttribute("afterServices",service.allAfterService());
		  return "service/serviceManager"; 
	  }
	  
	  
	  //受理服务
	  @ResponseBody
	  @RequestMapping("/updateService") 
	  public int updateService(Integer id,Model model)
	  {
		  AfterService findAfterService = service.findAfterService(id);
		  findAfterService.setStatus(1);
		  return service.updateAfterService(findAfterService);
	  }
	  
	  //删除售后服务
	  @RequestMapping("/deleteService") 
	  public String deleteService(Integer id[], Model model)
	  {
		  for(int i=0;i<id.length;i++)
		  {
			  service.deleteAfterService(id[i]);
		  }
		  return "redirect:afterManager"; 
	  }
	  
	  
	//--------------------------------通用--------------------------  
	  //处理时间格式
	   @InitBinder    
	    protected void initBinder(HttpServletRequest request,    
	            ServletRequestDataBinder binder) throws Exception {    
	        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
	        dateFormat.setLenient(true);  
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   
	    }    
	  
	
}
