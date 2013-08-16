package com.database.finalproject.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.database.finalproject.dao.PatientDao;
import com.database.finalproject.model.Patient;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="/patient")
public class PatientController {
	private final int BEDIDFOROUT = 1;
	private final int ROOMIDFOROUT = 1;
	private final int FACILITYIDFOROUT = 11;
	
	@Autowired
	private PatientDao patientDao;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String listPatient(){
		return "patient";
	}
	
	
	@RequestMapping(value= "/patientId/", method = RequestMethod.GET)
	public  @ResponseBody String getAllPatients(){
		Gson g = new Gson();
		List<Patient> list = patientDao.getPatients(); 
		return g.toJson(list);
	}
	
	
	@RequestMapping(value= "/patientId/{id}", method = RequestMethod.GET)
	public  @ResponseBody String getPetientById(@PathVariable int id){
		Gson g = new Gson();
		Patient p = patientDao.getPatient(id);
		return g.toJson(p);
	}
	
	@RequestMapping(value = "/patientName/{name}", method = RequestMethod.GET)
	public @ResponseBody String getPetientByName(@PathVariable String name){
		List<Patient> list = patientDao.getPatient(name);
		Gson g = new Gson();
		return g.toJson(list);
	}
	
	@RequestMapping(value = "/delete/{patientId}", method = RequestMethod.GET)
	public @ResponseBody String deletePatientById(@PathVariable int patientId){
		 patientDao.deletePatient(patientId);
		 Gson g = new Gson();
			List<Patient> list = patientDao.getPatients(); 
			return g.toJson(list);
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public  String createPatient(){
		
		return "addPatient";
	}
	
	@RequestMapping(value = "/count", method = RequestMethod.GET)
	public  @ResponseBody String getPatientCount(){
		
		return Integer.toString(patientDao.getMaxPatientId()+1);
	}
	
	
	
	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	public @ResponseBody void updateById(
			@PathVariable int id, 
			@RequestParam String pType, 
			@RequestParam int pBedNo, 
			@RequestParam int pRoomNo,
			@RequestParam int pFacilityNo)
	{
		
		if(pType.contentEquals("Resident")){
			patientDao.updatePatient(id, pType, pBedNo, pRoomNo, pFacilityNo);
		} else {
			patientDao.updatePatient(id, pType, BEDIDFOROUT, ROOMIDFOROUT, FACILITYIDFOROUT);
		}
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody void createPatient(
			@RequestParam int patientID,
			@RequestParam int admittingPhysician,
			@RequestParam int bedNo, 
			@RequestParam int roomNo, 
			@RequestParam int facilityNo,
			@RequestParam String fName,
			@RequestParam String lName,
			@RequestParam String type,
			@RequestParam String city,
			@RequestParam String address,
			@RequestParam String state,
			@RequestParam String phone,
			@RequestParam String zip)
			
			
	{
		
		
		patientDao.addPatient(fName, lName, patientID, type, admittingPhysician, admittingPhysician, bedNo, roomNo, facilityNo, phone, city, zip, state, address);
	}
	
	
	


}