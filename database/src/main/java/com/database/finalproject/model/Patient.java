package com.database.finalproject.model;

public class Patient {

	private int patientId;
	private int physicianIdAdmit;
	private int referringPhysician;
	private int Bed;
	private int Room;
	private int careCenter;
	private String fname;
	private String lname;
	private String address;
	private String zip;
	private String patientType;
	private String dateAdmitted;
	private String city;
	private String state;
	private String phone;
	private int facilityNo;
	public Patient(int patientId, int physicianIdAdmit, int referringPhysician,
			int bed, int room, int careCenter, String fname, String lname,
			String address, String zip, String patientType,
			String dateAdmitted, String city, String state, String phone,
			int facilityNo) {
		super();
		this.patientId = patientId;
		this.physicianIdAdmit = physicianIdAdmit;
		this.referringPhysician = referringPhysician;
		Bed = bed;
		Room = room;
		this.careCenter = careCenter;
		this.fname = fname;
		this.lname = lname;
		this.address = address;
		this.zip = zip;
		this.patientType = patientType;
		this.dateAdmitted = dateAdmitted;
		this.city = city;
		this.state = state;
		this.phone = phone;
		this.facilityNo = facilityNo;
	}
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	public int getPhysicianIdAdmit() {
		return physicianIdAdmit;
	}
	public void setPhysicianIdAdmit(int physicianIdAdmit) {
		this.physicianIdAdmit = physicianIdAdmit;
	}
	public int getReferringPhysician() {
		return referringPhysician;
	}
	public void setReferringPhysician(int referringPhysician) {
		this.referringPhysician = referringPhysician;
	}
	public int getBed() {
		return Bed;
	}
	public void setBed(int bed) {
		Bed = bed;
	}
	public int getRoom() {
		return Room;
	}
	public void setRoom(int room) {
		Room = room;
	}
	public int getCareCenter() {
		return careCenter;
	}
	public void setCareCenter(int careCenter) {
		this.careCenter = careCenter;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getPatientType() {
		return patientType;
	}
	public void setPatientType(String patientType) {
		this.patientType = patientType;
	}
	public String getDateAdmitted() {
		return dateAdmitted;
	}
	public void setDateAdmitted(String dateAdmitted) {
		this.dateAdmitted = dateAdmitted;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getFacilityNo() {
		return facilityNo;
	}
	public void setFacilityNo(int facilityNo) {
		this.facilityNo = facilityNo;
	}
	
	
	
	
		
	
}