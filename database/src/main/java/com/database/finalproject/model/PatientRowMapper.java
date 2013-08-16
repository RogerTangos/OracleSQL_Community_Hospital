package com.database.finalproject.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;


@Component
public class PatientRowMapper implements RowMapper<Patient>{

	@Override
	public Patient mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		return new Patient(
				rs.getInt("PATIENTID"), 
				rs.getInt("PHYSICIANIDADMIT"), 
				rs.getInt("PHYSICIANIDREFER"), 
				rs.getInt("BEDID"), 
				rs.getInt("ROOMID"), 
				rs.getInt("FACILITYID"),
				rs.getString("PERSONFNAME"),
				rs.getString("PERSONLNAME"),
				rs.getString("PERSONADDRESS"),
				rs.getString("PERSONZIP"),
				rs.getString("PATIENTTYPE"),
				rs.getString("DATEADMITTED"),
				rs.getString("PERSONCITY"),
				rs.getString("PERSONSTATE"),
				rs.getString("PERSONPHONE"),
				rs.getInt("FACILITYID"));
	}
}
