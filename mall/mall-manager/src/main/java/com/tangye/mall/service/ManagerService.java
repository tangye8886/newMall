package com.tangye.mall.service;
import java.util.List;

import com.tangye.mall.entity.AfterService;
import com.tangye.mall.entity.MallItem;
import com.tangye.mall.entity.MallItemCat;
import com.tangye.mall.entity.MallOrder;
import com.tangye.mall.entity.MallOrderItem;
import com.tangye.mall.entity.MallOrderShipping;
import com.tangye.mall.entity.MallUser;
public interface ManagerService {

	/*
	 * 	服务层
	 */
	
	///////---------------用户服务-----------------------
	
	public List<MallUser> allUser(); //所有用户
	
	public MallUser findUserByid(long id); //根据id查找用户
	
	public int deleteUser(long id); //根据id删除用户
	
	public int addUser(MallUser user); //添加用户
	
	public int updateUser(MallUser user); //更新用户
	
	public MallUser loginUser(String username); //登录
	
	//-----------------------------------商品服务--------------
	
	public List<MallItem> allItem(); //所有商品
	
	public MallItem findItemByid(long id); //根据id查找商品
	
	public int deleteItem(long id); //删除商品
	
	public int updateItem(MallItem item); //更新商品
	
	public int addItem(MallItem item); //添加商品
	
	public MallItemCat findItemCatByid(long id); //查找商品种类
	
	public MallItemCat findItemCatParent(long id); //查找商品种类的父类
	
	public List<MallItemCat> allItemCat(); //所有商品种类
	
	public List<MallItemCat> getOneCatParent(); //一级菜单
	
	public List<MallItemCat> getTwoCatParent(); //二级菜单
	
	public List<MallItemCat> getThreeCatParent();//三级菜单
	
	public List<MallItemCat> getCatSon(long parentId); //获得父类菜单的儿子
	
	public void addSolrItem(MallItem item);//增加跟修改一样   //添加商品进入搜索引擎
	
	public void deleteSolrItem(String id); //删除搜索引擎的商品
	
	//------------------------------------订单服务----
	public List<MallOrder> allOreder();//所有订单
	
	public MallOrder findOreder(long id);//根据id查找订单
	
	public int deleteOreder(long id);//删除订单
	
	public int addOreder(MallOrder order);//添加订单
	
	public int updateOreder(MallOrder order);//更新订单

	public MallOrder findOrderToItemToShpping(String orderId);//查找订单的物流表
	
	public int deleteOrederItemByOrderId(String orderId);//根据订单id删除商品表
	
	public int deleteShippingByOrderId(String orderId);//根据订单id删除物流表
	
	//------order-item---
	
	public List<MallOrderItem> allOrederItem();  //返回订单里面的商品
	
	public MallOrderItem findOrederItemByid(long id);//根据id查询订单的商品
	
	public int deleteOrederItem(long id); //删除订单的商品信息
	
	public int addOrederItem(MallOrderItem orderItem); //添加订单商品的信息
	
	public int updateOrederItem(MallOrderItem orderItem);//修改订单商品的信息
	
	public MallOrderItem findOrederItemByOrderId(String orderId);//根据订单id查询订单里面的商品
	
	
	//------orderShipping-----
	public List<MallOrderShipping> allOrderShipping(); //返回物流地址表的信息
	
	public MallOrderShipping findOrderShippingByid(long id);//返回订单详情里面的物流地址信息
	
	public int deleteOrderShipping(long id);//删除订单的物流地址信息
	
	public int addOrderShipping(MallOrderShipping shipping);//添加订单的物流地址信息 
	
	public int updateOrderShipping(MallOrderShipping shipping);//修改订单的物流地址信息（发货）
	
	
	//afterService    售后服务
	public List<AfterService> allAfterService();  //售后服务列表
	
	public AfterService findAfterService(int id);//查找售后服务信息
	
	public int deleteAfterService(int id);//删除售后服务
	
	public int insertAfterService(AfterService afterService);//添加售后服务
	
	public int updateAfterService(AfterService afterService);//更新售后服务
	
}
