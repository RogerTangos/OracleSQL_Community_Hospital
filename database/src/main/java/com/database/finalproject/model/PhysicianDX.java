package com.database.finalproject.model;

import java.util.Date;

public class PhysicianDX {

	private Date pDate;
	private Date pTime;
	private int physicianId;
	private int patientId;
	private int diagnosisId;
	private int physicianIdAdmit;
	private int physicianIdRefer;

	public PhysicianDX(Date pDate, Date pTime, int physicianId, int patientId,
			int diagnosisId, int physicianIdAdmit, int physicianIdRefer) {
		this.pDate = pDate;
		this.pTime = pTime;
		this.physicianId = physicianId;
		this.patientId = patientId;
		this.diagnosisId = diagnosisId;
		this.physicianIdAdmit = physicianIdAdmit;
		this.physicianIdRefer = physicianIdRefer;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public Date getpTime() {
		return pTime;
	}

	public void setpTime(Date pTime) {
		this.pTime = pTime;
	}

	public int getPhysicianId() {
		return physicianId;
	}

	public void setPhysicianId(int physicianId) {
		this.physicianId = physicianId;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public int getDiagnosisId() {
		return diagnosisId;
	}

	public void setDiagnosisId(int diagnosisId) {
		this.diagnosisId = diagnosisId;
	}

	public int getPhysicianIdAdmit() {
		return physicianIdAdmit;
	}

	public void setPhysicianIdAdmit(int physicianIdAdmit) {
		this.physicianIdAdmit = physicianIdAdmit;
	}

	public int getPhysicianIdRefer() {
		return physicianIdRefer;
	}

	public void setPhysicianIdRefer(int physicianIdRefer) {
		this.physicianIdRefer = physicianIdRefer;
	}	

}