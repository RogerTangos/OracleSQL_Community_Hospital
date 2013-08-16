package com.database.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;

import com.database.finalproject.dao.DiagnosisDao;
import com.database.finalproject.dao.PatientDao;
import com.database.finalproject.dao.PhysicianDXDao;
import com.database.finalproject.model.Diagnosis;
import com.database.finalproject.model.Patient;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/diagnose")
public class DiagnosisController {

	@Autowired
	DiagnosisDao diagnosisDao;
	
	@Autowired
	PatientDao patientDao;
	
	@Autowired
	PhysicianDXDao physicianDXDao;
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public  String toDiagnose(@RequestParam int patientId, Model model){
		model.addAttribute("patientId", patientId);
		return "diagnose";
	}
	
	@RequestMapping(value="/patient/{id}", method=RequestMethod.GET)
	public @ResponseBody String getDiagnosisByPatient(@PathVariable int id){
		Gson gson = new Gson();
		Diagnosis diagnosis = diagnosisDao.getDiagnosisByPatient(id);
		return gson.toJson(diagnosis);
	}
	
	@RequestMapping(value="/diagnoseId/{id}", method=RequestMethod.GET)
	public @ResponseBody String getDiagnosisById(@PathVariable int id){
		Gson gson = new Gson();
		Diagnosis diagnosis = diagnosisDao.getDiagnosisById(id);
		return gson.toJson(diagnosis);
	}
	
	@RequestMapping(value="/diagnoseId/",  method=RequestMethod.GET)
	public @ResponseBody String getAllDiagnosises(){
		Gson gson = new Gson();
		List<Diagnosis> list = diagnosisDao.getDiagnosises();
		return gson.toJson(list);
	}
	
	
}
