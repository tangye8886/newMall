package com.tangye.mall.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.alibaba.dubbo.config.annotation.Reference;
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
import com.tangye.mall.service.AddressService;
import com.tangye.mall.service.AfterServiceService;
import com.tangye.mall.service.CarService;
import com.tangye.mall.service.CollectService;
import com.tangye.mall.service.CommentService;
import com.tangye.mall.service.ConsumerService;
import com.tangye.mall.service.ItemService;
import com.tangye.mall.service.OrderItemService;
import com.tangye.mall.service.OrderService;
import com.tangye.mall.service.OrderShippingService;
import com.tangye.mall.service.UserService;

@Service
public class ConsumerServiceImpl implements ConsumerService{

	@Reference
	UserService userService;
	
	@Reference
	CarService carService;
	
	@Reference
	OrderService orderService;
	
	@Reference
	AddressService addressService;
	
	@Reference
	OrderItemService orderItemService;
	
	@Reference
	ItemService itemService;
	
	@Reference
	OrderShippingService shippingService;
	
	@Reference
	AfterServiceService after;
	
	@Reference
	CommentService comment;
	
	@Reference
	CollectService cs;
	
	
	@Override
	public MallUser loginUser(String username) {
		// TODO Auto-generated method stub
		return userService.loginUser(username);
	}

	@Override
	public int updateUser(MallUser user) {
		// TODO Auto-generated method stub
		return userService.updateUser(user);
	}

	@Override
	public MallUser findUserByid(long id) {
		// TODO Auto-generated method stub
		return userService.findUserByid(id);
	}

	@Override
	public int addOreder(MallOrder order) {
		// TODO Auto-generated method stub
		return orderService.addOreder(order);
	}

	@Override
	public int deleteOreder(long id) {
		// TODO Auto-generated method stub
		return orderService.deleteOreder(id);
	}

	@Override
	public MallOrder findOreder(long id) {
		// TODO Auto-generated method stub
		return orderService.findOreder(id);
	}

	@Override
	public List<MallOrder> myOrder(long userId) {
		// TODO Auto-generated method stub
		return orderService.myOrder(userId);
	}

	@Override
	public List<MallAddress> myAddress(long userNo) {
		// TODO Auto-generated method stub
		return addressService.myAddress(userNo);
	}

	@Override
	public int deleteAddress(Integer id) {
		// TODO Auto-generated method stub
		return addressService.deleteAddress(id);
	}

	@Override
	public int addAddress(MallAddress address) {
		// TODO Auto-generated method stub
		return addressService.addAddress(address);
	}

	@Override
	public int updateAddress(MallAddress address) {
		// TODO Auto-generated method stub
		return addressService.updateAddress(address);
	}

	@Override
	public List<MallCar> myCar(long userNo) {
		// TODO Auto-generated method stub
		return carService.myCar(userNo);
	}

	@Override
	public int deleteCar(Integer id) {
		// TODO Auto-generated method stub
		return carService.deleteCar(id);
	}

	@Override
	public int addCar(MallCar car) {
		// TODO Auto-generated method stub
		return carService.addCar(car);
	}

	@Override
	public int updateCar(MallCar car) {
		// TODO Auto-generated method stub
		return carService.updateCar(car);
	}

	@Override
	public int addOrederItem(MallOrderItem orderItem) {
		// TODO Auto-generated method stub
		return orderItemService.addOrederItem(orderItem);
	}

	@Override
	public List<MallItem> allItem() {
		return itemService.allItem();
	}

	@Override
	public MallItem findItemByid(long id) {
		return itemService.findItemByid(id);
	}

	@Override
	public List<MallItem> sortItem(String title, String cat, String price, String sort) {
		return itemService.sortItem(title, cat, price, sort);
	}

	@Override
	public int addOrderShipping(MallOrderShipping shipping) {
		return shippingService.addOrderShipping(shipping);
	}

	@Override
	public List<KeyWord> searchItemLike(String title) {
		// TODO Auto-generated method stub
		return itemService.searchItemLike(title);
	}

	@Override
	public int addUser(MallUser user) {
		// TODO Auto-generated method stub
		return userService.addUser(user);
	}

	@Override
	public Map<String, Object> sortItemPage(Integer pageIndex, String title, String cat, String price, String sort) {
		// TODO Auto-generated method stub
		return itemService.sortItemPage(pageIndex, title, cat, price, sort);
	}

	@Override
	public int updateCarAmount(MallCar car) {
		// TODO Auto-generated method stub
		return carService.updateCarAmount(car);
	}

	@Override
	public MallOrder findOrderToItemToShpping(String orderId) {
		// TODO Auto-generated method stub
		return orderService.findOrderToItemToShpping(orderId);
	}

	@Override
	public int updateOreder(MallOrder order) {
		// TODO Auto-generated method stub
		return orderService.updateOreder(order);
	}

	@Override
	public int updateOrederPayment(MallOrder order) {
		// TODO Auto-generated method stub
		return orderService.updateOrederPayment(order);
	}

	@Override
	public int deleteOrederItemByOrderId(String orderId) {
		// TODO Auto-generated method stub
		return orderItemService.deleteOrederItemByOrderId(orderId);
	}

	@Override
	public int deleteShippingByOrderId(String orderId) {
		// TODO Auto-generated method stub
		return shippingService.deleteShippingByOrderId(orderId);
	}

	@Override
	public List<AfterService> myAfterService(long userNo) {
		// TODO Auto-generated method stub
		return after.myAfterService(userNo);
	}

	@Override
	public int insertAfterService(AfterService afterService) {
		// TODO Auto-generated method stub
		return after.insertAfterService(afterService);
	}

	@Override
	public List<MallComment> findCommentByOrderId(String orderNo) {
		// TODO Auto-generated method stub
		return comment.findCommentByOrderId(orderNo);
	}

	@Override
	public int deleteCommentByOrderNo(String orderNo) {
		// TODO Auto-generated method stub
		return comment.deleteCommentByOrderNo(orderNo);
	}

	@Override
	public int insertComment(MallComment com) {
		// TODO Auto-generated method stub
		return comment.insertComment(com);
	}

	@Override
	public List<MallComment> findCommentByItemNo(long itemNo) {
		// TODO Auto-generated method stub
		return comment.findCommentByItemNo(itemNo);
	}

	@Override
	public int updateItem(MallItem item) {
		// TODO Auto-generated method stub
		return itemService.updateItem(item);
	}

	@Override
	public void rabbitSendMsg(String msg) {
		// TODO Auto-generated method stub
		userService.rabbitSendMsg(msg);
	}

	@Override
	public void addSolrItem(MallItem item) {
		// TODO Auto-generated method stub
		itemService.addSolrItem(item);
	}

	@Override
	public List<MallComment> findCommentByUserNo(long userNo) {
		// TODO Auto-generated method stub
		return comment.findCommentByUserNo(userNo);
	}

	@Override
	public int deleteAfterService(int id) {
		// TODO Auto-generated method stub
		return after.deleteAfterService(id);
	}

	@Override
	public PageInfo<MallOrder> myOrderByPage(int pageIndex, long userId) {
		// TODO Auto-generated method stub
		return orderService.myOrderByPage(pageIndex, userId);
	}

	@Override
	public PageInfo<MallComment> myCommentByPage(int pageIndex, long userId) {
		// TODO Auto-generated method stub
		return comment.myCommentByPage(pageIndex, userId);
	}

	@Override
	public  PageInfo<MallCollect> findCollectByUserNo(int pageIndex,long userNo) {
		// TODO Auto-generated method stub
		return cs.findCollectByUserNo(pageIndex,userNo);
	}

	@Override
	public List<MallCollect> findCollectByItemNo(long itemNo) {
		// TODO Auto-generated method stub
		return cs.findCollectByItemNo(itemNo);
	}

	@Override
	public MallCollect findCollectById(int id) {
		// TODO Auto-generated method stub
		return cs.findCollectById(id);
	}

	@Override
	public MallCollect searchCollectFlag(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return cs.searchCollectFlag(map);
	}

	@Override
	public int deleteCollect(int id) {
		// TODO Auto-generated method stub
		return cs.deleteCollect(id);
	}

	@Override
	public int addCollect(MallCollect collect) {
		// TODO Auto-generated method stub
		return cs.addCollect(collect);
	}

	@Override
	public int deleteCollectByUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return cs.deleteCollectByUser(map);
	}

	@Override
	public PageInfo<MallCar> myCarByPage(int pageIndex, long userNo) {
		// TODO Auto-generated method stub
		return carService.myCarByPage(pageIndex, userNo);
	}


	
	
}
