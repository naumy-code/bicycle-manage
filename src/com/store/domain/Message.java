package com.store.domain;



import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Message  {
	private int id;
	private String productid;
	private String name;
	private String mail;
	private String title;
	private String content;
	private Date time;
	private String imgurl; // 图片路径
	private int userid;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getproductid() {
		return productid;
	}
	public void setproductid(String productid) {
		this.productid = productid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String toString() {
		return "Message [id="+id+",productid=" + productid + ",name=" + name + ", title=" + title + ", time="
				+ time + ", content=" + content + ", mail=" + mail  + ", imgurl=" + imgurl  +", userid=" + userid  + "]";
	}
}
