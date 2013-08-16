package com.database.finalproject.dao;

import java.util.Calendar;
import java.util.Date;

import javax.inject.Inject;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

@Repository("physicianDXDao")
public class PhysicianDXDao {
	
    @Inject private NamedParameterJdbcOperations jdbcTemplate;
	private static final Calendar calendar = Calendar.getInstance();

	public void addPhysicianDX(Date pDate, Date pTime, int physicianId, int patientId,
			int diagnosisId, int physicianIdAdmit, int physicianIdRefer) {
		
		calendar.setTime(pDate);
		String pDateString =(calendar.get(Calendar.MONTH) + 1) + 
				"/" + calendar.get(Calendar.DAY_OF_MONTH) + "/" +  calendar.get(Calendar.YEAR);
		
		
		
		String sql = "INSERT INTO PhysicianDX values (" +
				"to_date(:dateString, 'mm/dd/yyyy'), " + 
				"to_date(:dateString, 'mm/dd/yyyy')" + 
				", :physicianId, :patientId, :diagnosisId, :physicianIdAdmit, :physicianIdRefer)";
		
		SqlParameterSource params = new MapSqlParameterSource()
		.addValue("dateString", pDateString)
		.addValue("timeString", pDateString)
		.addValue("physicianId", physicianId)
		.addValue("patientId", patientId)
		.addValue("diagnosisId", diagnosisId)
		.addValue("physicianIdAdmit", physicianIdAdmit)
		.addValue("physicianIdRefer", physicianIdRefer);

		jdbcTemplate.update(sql, params);

	}

}
