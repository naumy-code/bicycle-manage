package com.store.domain;

public class groupOrderItem {

	private groupOrder grouporder;
	private groupProduct p;
	private int buynum;

	public groupOrder getgroupOrder() {
		return grouporder;
	}

	public void setgroupOrder(groupOrder grouporder) {
		this.grouporder = grouporder;
	}

	public groupProduct getP() {
		return p;
	}

	public void setP(groupProduct p) {
		this.p = p;
	}

	public int getBuynum() {
		return buynum;
	}

	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}

}
