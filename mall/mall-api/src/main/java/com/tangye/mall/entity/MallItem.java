package com.tangye.mall.entity;

import java.io.Serializable;
import java.util.Date;

public class MallItem implements Serializable{
	private static final long serialVersionUID = 1908696218193485297L;

	private Long id;

    private String title;

    private String sellDesc;

    private String sellPoint;

    private Float price;

    private Integer num;

    private String barcode;

    private String image;

    public MallItem(Long id, String title,String sellPoint, Float price, Integer num, String image) {
		this.id = id;
		this.title = title;
		this.sellPoint = sellPoint;
		this.price = price;
		this.num = num;
		this.image = image;
	}

	private Long cid;

    private Byte status;

    private Date created;

    private Date updated;
    
    private Integer sellNum;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getSellDesc() {
        return sellDesc;
    }

    public void setSellDesc(String sellDesc) {
        this.sellDesc = sellDesc == null ? null : sellDesc.trim();
    }

    public String getSellPoint() {
        return sellPoint;
    }

    public void setSellPoint(String sellPoint) {
        this.sellPoint = sellPoint == null ? null : sellPoint.trim();
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode == null ? null : barcode.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Long getCid() {
        return cid;
    }

    public void setCid(Long cid) {
        this.cid = cid;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

	public MallItem(String title, String sellDesc, String sellPoint, Float price, Integer num, String barcode,
			String image, Long cid, Byte status, Date created, Date updated) {
		super();
		this.title = title;
		this.sellDesc = sellDesc;
		this.sellPoint = sellPoint;
		this.price = price;
		this.num = num;
		this.barcode = barcode;
		this.image = image;
		this.cid = cid;
		this.status = status;
		this.created = created;
		this.updated = updated;
	}

	public MallItem() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Integer getSellNum() {
		return sellNum;
	}

	public void setSellNum(Integer sellNum) {
		this.sellNum = sellNum;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    
    
}