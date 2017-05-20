package com.techm.beans;

import java.sql.Date;

public class Appointment {
	private Date dateOfAppointment;
	private String slot;
	private int couponNo;
	private int pId;
	private int dId;

	public Appointment() {
		super();
	}

	public Appointment(Date dateOfAppointment, String slot, int couponNo,
			int pId, int dId) {
		super();
		this.dateOfAppointment = dateOfAppointment;
		this.slot = slot;
		this.couponNo = couponNo;
		this.pId = pId;
		this.dId = dId;
	}

	public Date getDateOfAppointment() {
		return dateOfAppointment;
	}

	public void setDateOfAppointment(Date dateOfAppointment) {
		this.dateOfAppointment = dateOfAppointment;
	}

	public String getSlot() {
		return slot;
	}

	public void setSlot(String slot) {
		this.slot = slot;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public int getdId() {
		return dId;
	}

	public void setdId(int dId) {
		this.dId = dId;
	}

	@Override
	public String toString() {
		return "Appointment [dateOfAppointment=" + dateOfAppointment
				+ ", slot=" + slot + ", couponNo=" + couponNo + ", pId=" + pId
				+ ", dId=" + dId + "]";
	}

}
