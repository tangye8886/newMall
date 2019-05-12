package com.tangye.mall.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class MallOrder implements Serializable{
	private static final long serialVersionUID = 8521534857670385710L;

	private long id;
	
	private String orderId;

    private String payment;

    private Integer paymentType;

    private String postFee;

    private Integer status; //1：未付款 2:已付款 3：未发货 4：已发货 5：待评价 6:已评价  7:申请退款 8：已退款 9:交易成功

    private Date createTime;

    private Date updateTime;

    private Date paymentTime;

    private Date consignTime;

    private Date endTime;

    private Date closeTime;

    private String shippingName;//物流名称

    private String shippingCode;//物流编号

    private Long userId;

    private String buyerMessage;

    private String buyerNick;

    private Integer buyerRate;//手续费
    
    
    //一对多
    private List<MallOrderItem> orderItemList;
    
    //一对一
    private MallOrderShipping orderShipping;
    

    
    

	public List<MallOrderItem> getOrderItemList() {
		return orderItemList;
	}

	public void setOrderItemList(List<MallOrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}

	public MallOrderShipping getOrderShipping() {
		return orderShipping;
	}

	public void setOrderShipping(MallOrderShipping orderShipping) {
		this.orderShipping = orderShipping;
	}

	public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment == null ? null : payment.trim();
    }

    public Integer getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Integer paymentType) {
        this.paymentType = paymentType;
    }

    public String getPostFee() {
        return postFee;
    }

    public void setPostFee(String postFee) {
        this.postFee = postFee == null ? null : postFee.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(Date paymentTime) {
        this.paymentTime = paymentTime;
    }

    public Date getConsignTime() {
        return consignTime;
    }

    public void setConsignTime(Date consignTime) {
        this.consignTime = consignTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Date closeTime) {
        this.closeTime = closeTime;
    }

    public String getShippingName() {
        return shippingName;
    }

    public void setShippingName(String shippingName) {
        this.shippingName = shippingName == null ? null : shippingName.trim();
    }

    public String getShippingCode() {
        return shippingCode;
    }

    public MallOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MallOrder(String payment, Integer paymentType, String postFee, Integer status, Date createTime,
			Date updateTime, Date paymentTime, Date consignTime, Date endTime, Date closeTime, String shippingName,
			String shippingCode, Long userId, String buyerMessage, String buyerNick, Integer buyerRate) {
		super();
		this.payment = payment;
		this.paymentType = paymentType;
		this.postFee = postFee;
		this.status = status;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.paymentTime = paymentTime;
		this.consignTime = consignTime;
		this.endTime = endTime;
		this.closeTime = closeTime;
		this.shippingName = shippingName;
		this.shippingCode = shippingCode;
		this.userId = userId;
		this.buyerMessage = buyerMessage;
		this.buyerNick = buyerNick;
		this.buyerRate = buyerRate;
	}

	public void setShippingCode(String shippingCode) {
        this.shippingCode = shippingCode == null ? null : shippingCode.trim();
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getBuyerMessage() {
        return buyerMessage;
    }

    public void setBuyerMessage(String buyerMessage) {
        this.buyerMessage = buyerMessage == null ? null : buyerMessage.trim();
    }

    public String getBuyerNick() {
        return buyerNick;
    }

    public void setBuyerNick(String buyerNick) {
        this.buyerNick = buyerNick == null ? null : buyerNick.trim();
    }

    public Integer getBuyerRate() {
        return buyerRate;
    }

    public void setBuyerRate(Integer buyerRate) {
        this.buyerRate = buyerRate;
    }

	@Override
	public String toString() {
		return "MallOrder [orderId=" + orderId + ", payment=" + payment + ", paymentType=" + paymentType + ", postFee="
				+ postFee + ", status=" + status + ", createTime=" + createTime + ", updateTime=" + updateTime
				+ ", paymentTime=" + paymentTime + ", consignTime=" + consignTime + ", endTime=" + endTime
				+ ", closeTime=" + closeTime + ", shippingName=" + shippingName + ", shippingCode=" + shippingCode
				+ ", userId=" + userId + ", buyerMessage=" + buyerMessage + ", buyerNick=" + buyerNick + ", buyerRate="
				+ buyerRate + "]";
	}
}