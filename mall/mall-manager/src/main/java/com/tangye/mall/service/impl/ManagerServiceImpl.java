package com.tangye.mall.service.impl;
import java.util.List;

import org.springframework.stereotype.Service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.tangye.mall.entity.AfterService;
import com.tangye.mall.entity.MallItem;
import com.tangye.mall.entity.MallItemCat;
import com.tangye.mall.entity.MallOrder;
import com.tangye.mall.entity.MallOrderItem;
import com.tangye.mall.entity.MallOrderShipping;
import com.tangye.mall.entity.MallUser;
import com.tangye.mall.service.AfterServiceService;
import com.tangye.mall.service.ItemCatService;
import com.tangye.mall.service.ItemService;
import com.tangye.mall.service.ManagerService;
import com.tangye.mall.service.OrderItemService;
import com.tangye.mall.service.OrderService;
import com.tangye.mall.service.OrderShippingService;
import com.tangye.mall.service.UserService;

@Service
public class ManagerServiceImpl implements ManagerService{

	/*
	 * ManagerService实现类
	 * 	注：@Reference :远程过程调用，直接引用服务
	 */
	
	@Reference   
	UserService userService;
	
	@Reference
	ItemService itemService;
	
	@Reference
	OrderService orderService;
	
	@Reference
	ItemCatService itemCatService;
	
	@Reference
	OrderShippingService shippingService;
	
	@Reference
	OrderItemService orderItemService;
	
	@Reference
	AfterServiceService afterServiceService;

	@Override
	public List<MallUser> allUser() {
		// TODO Auto-generated method stub
		return userService.allUser();
	}

	@Override
	public MallUser findUserByid(long id) {
		// TODO Auto-generated method stub
		return userService.findUserByid(id);
	}

	@Override
	public int deleteUser(long id) {
		// TODO Auto-generated method stub
		return userService.deleteUser(id);
	}

	@Override
	public int addUser(MallUser user) {
		// TODO Auto-generated method stub
		return userService.addUser(user);
	}

	@Override
	public int updateUser(MallUser user) {
		// TODO Auto-generated method stub
		return userService.updateUser(user);
	}

	@Override
	public List<MallItem> allItem() {
		// TODO Auto-generated method stub
		return itemService.allItem();
	}

	@Override
	public MallItem findItemByid(long id) {
		// TODO Auto-generated method stub
		return itemService.findItemByid(id);
	}

	@Override
	public int deleteItem(long id) {
		int flag=0;
		flag=itemService.deleteItem(id);
		return flag;
	}

	@Override
	public int updateItem(MallItem item) {
		// TODO Auto-generated method stub
		return itemService.updateItem(item);
	}

	@Override
	public int addItem(MallItem item) {
		// TODO Auto-generated method stub
		return itemService.addItem(item);
	}

	@Override
	public List<MallOrder> allOreder() {
		// TODO Auto-generated method stub
		return orderService.allOreder();
	}

	@Override
	public MallOrder findOreder(long id) {
		// TODO Auto-generated method stub
		return orderService.findOreder(id);
	}

	@Override
	public int deleteOreder(long id) {
		// TODO Auto-generated method stub
		return orderService.deleteOreder(id);
	}

	@Override
	public int addOreder(MallOrder order) {
		// TODO Auto-generated method stub
		return orderService.addOreder(order);
	}

	@Override
	public int updateOreder(MallOrder order) {
		// TODO Auto-generated method stub
		return orderService.updateOreder(order);
	}

	@Override
	public MallUser loginUser(String username) {
		// TODO Auto-generated method stub
		return userService.loginUser(username);
	}

	@Override
	public MallItemCat findItemCatByid(long id) {
		// TODO Auto-generated method stub
		return itemCatService.findItemCatByid(id);
	}

	@Override
	public MallItemCat findItemCatParent(long id) {
		// TODO Auto-generated method stub
		return itemCatService.findItemCatParent(id);
	}

	@Override
	public List<MallItemCat> allItemCat() {
		// TODO Auto-generated method stub
		return itemCatService.allItemCat();
	}

	@Override
	public List<MallItemCat> getOneCatParent() {
		// TODO Auto-generated method stub
		return itemCatService.getOneCatParent();
	}

	@Override
	public List<MallItemCat> getTwoCatParent() {
		// TODO Auto-generated method stub
		return itemCatService.getTwoCatParent();
	}

	@Override
	public List<MallItemCat> getThreeCatParent() {
		// TODO Auto-generated method stub
		return itemCatService.getThreeCatParent();
	}

	@Override
	public List<MallItemCat> getCatSon(long parentId) {
		// TODO Auto-generated method stub
		return itemCatService.getCatSon(parentId);
	}

	@Override
	public int updateOrderShipping(MallOrderShipping shipping) {
		// TODO Auto-generated method stub
		return shippingService.updateOrderShipping(shipping);
	}

	@Override
	public List<MallOrderItem> allOrederItem() {
		// TODO Auto-generated method stub
		return orderItemService.allOrederItem();
	}

	@Override
	public MallOrderItem findOrederItemByid(long id) {
		// TODO Auto-generated method stub
		return orderItemService.findOrederItemByid(id);
	}

	@Override
	public int deleteOrederItem(long id) {
		// TODO Auto-generated method stub
		return orderItemService.deleteOrederItem(id);
	}

	@Override
	public int addOrederItem(MallOrderItem orderItem) {
		// TODO Auto-generated method stub
		return orderItemService.addOrederItem(orderItem);
	}

	@Override
	public int updateOrederItem(MallOrderItem orderItem) {
		// TODO Auto-generated method stub
		return orderItemService.updateOrederItem(orderItem);
	}

	@Override
	public List<MallOrderShipping> allOrderShipping() {
		// TODO Auto-generated method stub
		return shippingService.allOrderShipping();
	}

	@Override
	public MallOrderShipping findOrderShippingByid(long id) {
		// TODO Auto-generated method stub
		return shippingService.findOrderShippingByid(id);
	}

	@Override
	public int deleteOrderShipping(long id) {
		// TODO Auto-generated method stub
		return shippingService.deleteOrderShipping(id);
	}

	@Override
	public int addOrderShipping(MallOrderShipping shipping) {
		// TODO Auto-generated method stub
		return shippingService.addOrderShipping(shipping);
	}

	@Override
	public MallOrderItem findOrederItemByOrderId(String orderId) {
		// TODO Auto-generated method stub
		return orderItemService.findOrederItemByOrderId(orderId);
	}

	@Override
	public MallOrder findOrderToItemToShpping(String orderId) {
		// TODO Auto-generated method stub
		return orderService.findOrderToItemToShpping(orderId);
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
	public void addSolrItem(MallItem item) {
		itemService.addSolrItem(item);
	}

	@Override
	public void deleteSolrItem(String id) {
		itemService.deleteSolrItem(id);
	}

	@Override
	public List<AfterService> allAfterService() {
		// TODO Auto-generated method stub
		return afterServiceService.allAfterService();
	}

	@Override
	public AfterService findAfterService(int id) {
		// TODO Auto-generated method stub
		return afterServiceService.findAfterService(id);
	}

	@Override
	public int deleteAfterService(int id) {
		// TODO Auto-generated method stub
		return afterServiceService.deleteAfterService(id);
	}

	@Override
	public int insertAfterService(AfterService afterService) {
		// TODO Auto-generated method stub
		return afterServiceService.insertAfterService(afterService);
	}

	@Override
	public int updateAfterService(AfterService afterService) {
		// TODO Auto-generated method stub
		return afterServiceService.updateAfterService(afterService);
	}
}
