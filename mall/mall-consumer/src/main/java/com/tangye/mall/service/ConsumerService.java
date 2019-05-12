package com.tangye.mall.service;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.tangye.mall.entity.AfterService;
import com.tangye.mall.entity.KeyWord;
import com.tangye.mall.entity.MallAddress;
import com.tangye.mall.entity.MallCar;
import com.tangye.mall.entity.MallCollect;
import com.tangye.mall.entity.MallComment;
import com.tangye.mall.entity.MallItem;
import com.tangye.mall.entity.MallOrder;
import com.tangye.mall.entity.MallOrderItem;
import com.tangye.mall.entity.MallOrderShipping;
import com.tangye.mall.entity.MallUser;

public interface ConsumerService {

	//登录
	public MallUser loginUser(String username);
	
	//修改个人信息
	public int updateUser(MallUser user);
	
	//查看个人信息用到
	public MallUser findUserByid(long id);
	
	public int addUser(MallUser user); //注册 添加用户
	
	public void rabbitSendMsg(String msg);//发送邮件
	
	
	//------------------订单----------------
	
	public int addOreder(MallOrder order);  //添加订单
	
	public int deleteOreder(long id); //删除订单
	
	public MallOrder findOreder(long id); //订单详情
	
	public List<MallOrder> myOrder(long userId);//我的订单
	
	public int addOrederItem(MallOrderItem orderItem);//添加订单的商品信息
	
	public int addOrderShipping(MallOrderShipping shipping);//添加订单的收货信息
	
	public MallOrder findOrderToItemToShpping(String orderId);//三张订单有关的表连表查询
	
	public int updateOreder(MallOrder order);//修改订单
	
	public int updateOrederPayment(MallOrder order);//修改支付状态
	
	public int deleteOrederItemByOrderId(String orderId);//根据订单ID删除 订单-商品表
	
	public int deleteShippingByOrderId(String orderId);//根据订单ID删除 订单-收货信息表
	
	//带分页功能的返回用户所有订单
	public PageInfo<MallOrder> myOrderByPage(int pageIndex,long userId);
	
	//----------------地址-------------------
	
	public List<MallAddress> myAddress(long userNo);  //我的地址
	
	public int deleteAddress(Integer id);//删除地址
	
	public int addAddress(MallAddress address);//添加地址
	
	public int updateAddress(MallAddress address);//修改地址
	
	//----------------购物车------------------------
	public List<MallCar> myCar(long userNo);//我的购物车
	
	public int deleteCar(Integer id);//删除购物车的商品
	
	public int addCar(MallCar car);//添加商品进购物车
	
	public int updateCar(MallCar car);//更新购物车的商品信息
	
	public int updateCarAmount(MallCar car);//更新购物车里面的熟料
	
	public PageInfo<MallCar> myCarByPage(int pageIndex, long userNo);//我的购物车（分页）
	
	
	//-----------------商品-----------------------
	
	public int updateItem(MallItem item);
	
	public List<MallItem> allItem();
	
	public MallItem findItemByid(long id);
	
	public List<MallItem> sortItem(String title,String cat,String price,String sort);
	
	public List<KeyWord> searchItemLike(String title); //没有分页
	
	//带分页功能
	public Map<String,Object> sortItemPage(Integer pageIndex,String title,String cat,String price,String sort);
	
	
	public void addSolrItem(MallItem item);//增加跟修改一样
	
	//售后服务
	public List<AfterService> myAfterService(long userNo);
	
	public int insertAfterService(AfterService afterService);
	
	public int deleteAfterService(int id);
	
	//评价
	public List<MallComment> findCommentByOrderId(String orderNo);
	
	public int deleteCommentByOrderNo(String orderNo);
	
	public int insertComment(MallComment comment);
	
	public List<MallComment> findCommentByItemNo(long itemNo);
	
	public List<MallComment> findCommentByUserNo(long userNo);
	
	//带分页功能返回我的所有评论
	public PageInfo<MallComment> myCommentByPage(int pageIndex,long userId);
	
	//收藏
	
	public PageInfo<MallCollect> findCollectByUserNo(int pageIndex,long userNo);
	
	public List<MallCollect> findCollectByItemNo(long itemNo);
	
	public MallCollect findCollectById(int id);
	
	public MallCollect searchCollectFlag(Map<String,Object> map);
	
	public int deleteCollect(int id);
	
	public int addCollect(MallCollect collect);
	
	public int deleteCollectByUser(Map<String,Object> map);
}
