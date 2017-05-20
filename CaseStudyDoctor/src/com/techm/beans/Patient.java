package com.techm.beans;

public class Patient {
	private int pId;
	private String pName;
	private int pAge;
	private String pGender;
	private int pContact;
	private String Address;

	//default const.
	public Patient() {
		super();
	}

	//parametrized const.
	public Patient(int pId, String pName, int pAge, String pGender,
			int pContact, String address) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pAge = pAge;
		this.pGender = pGender;
		this.pContact = pContact;
		Address = address;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpAge() {
		return pAge;
	}

	public void setpAge(int pAge) {
		this.pAge = pAge;
	}

	public String getpGender() {
		return pGender;
	}

	public void setpGender(String pGender) {
		this.pGender = pGender;
	}

	public int getpContact() {
		return pContact;
	}

	public void setpContact(int pContact) {
		this.pContact = pContact;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	@Override
	public String toString() {
		return "Patient [pId=" + pId + ", pName=" + pName + ", pAge=" + pAge
				+ ", pGender=" + pGender + ", pContact=" + pContact
				+ ", Address=" + Address + "]";
	}
	
	

}
