package com.tangye.mall.entity;

import java.io.Serializable;

public class MallComment implements Serializable{
	private static final long serialVersionUID = -1620585253465593762L;

	private long id;//默认ID
	
	private long itemNo;//商品ID
	
	private long userNo;//用户ID
	
	private String orderNo;//订单编号
	
	private String content;//评价内容
	
	private int code;//物流评分 1-5
	
	private int service;//服务评分1-5
	
	private int quelify;//商品质量评分1-5
	
	
	private MallItem item;
	

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getItemNo() {
		return itemNo;
	}

	public void setItemNo(long itemNo) {
		this.itemNo = itemNo;
	}

	public long getUserNo() {
		return userNo;
	}

	public void setUserNo(long userNo) {
		this.userNo = userNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getService() {
		return service;
	}

	public void setService(int service) {
		this.service = service;
	}

	public int getQuelify() {
		return quelify;
	}

	public void setQuelify(int quelify) {
		this.quelify = quelify;
	}

	public MallComment(long id, long itemNo, long userNo, String orderNo, String content, int code, int service,
			int quelify) {
		super();
		this.id = id;
		this.itemNo = itemNo;
		this.userNo = userNo;
		this.orderNo = orderNo;
		this.content = content;
		this.code = code;
		this.service = service;
		this.quelify = quelify;
	}

	public MallItem getItem() {
		return item;
	}

	public void setItem(MallItem item) {
		this.item = item;
	}

	public MallComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MallComment(long itemNo, long userNo, String orderNo, String content, int code, int service, int quelify) {
		super();
		this.itemNo = itemNo;
		this.userNo = userNo;
		this.orderNo = orderNo;
		this.content = content;
		this.code = code;
		this.service = service;
		this.quelify = quelify;
	}
	
	
	
	
}
