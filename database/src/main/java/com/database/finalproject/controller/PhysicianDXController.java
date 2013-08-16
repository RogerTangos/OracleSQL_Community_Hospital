package com.database.finalproject.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.database.finalproject.dao.PatientDao;
import com.database.finalproject.dao.PhysicianDXDao;
import com.database.finalproject.model.Patient;


@Controller
@RequestMapping(value="/physicianDX")
public class PhysicianDXController {

	@Autowired
	PhysicianDXDao physicianDXDao;
	
	@Autowired
	PatientDao patientDao;
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public @ResponseBody String addDiagnoseToPatient(
			@RequestParam int patientId,
			@RequestParam int diagnoseId,
			@RequestParam int physicianId)
	{
		Patient patient = patientDao.getPatient(patientId);
		physicianDXDao.addPhysicianDX(new Date(), new Date(), physicianId, patientId, diagnoseId, patient.getPhysicianIdAdmit(), patient.getReferringPhysician());
		
		return "success";
	}
	
	
}
