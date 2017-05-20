package com.techm.beans;

public class Doctor {
	private int dId;
	private String dName;
	private String Specialization;
	private int phoneNo;

	public Doctor() {
		super();
	}

	public Doctor(int dId, String dName, String specialization, int phoneNo) {
		super();
		this.dId = dId;
		this.dName = dName;
		Specialization = specialization;
		this.phoneNo = phoneNo;
	}

	public int getdId() {
		return dId;
	}

	public void setdId(int dId) {
		this.dId = dId;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getSpecialization() {
		return Specialization;
	}

	public void setSpecialization(String specialization) {
		Specialization = specialization;
	}

	public int getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(int phoneNo) {
		this.phoneNo = phoneNo;
	}

	@Override
	public String toString() {
		return "Doctor [dId=" + dId + ", dName=" + dName + ", Specialization="
				+ Specialization + ", phoneNo=" + phoneNo + "]";
	}

	
}
