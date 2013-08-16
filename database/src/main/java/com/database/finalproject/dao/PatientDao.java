package com.database.finalproject.dao;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.database.finalproject.model.Patient;
import com.database.finalproject.model.PatientRowMapper;





@Repository("patientDao")
public class PatientDao {
	
	private final Calendar calendar = Calendar.getInstance();

    @Inject private NamedParameterJdbcOperations jdbcTemplate;
    @Inject private PatientRowMapper patientRowMapper;
    @Inject private JdbcTemplate _jdbJdbcTemplate;
	
	public List<Patient> getPatients() {
		String sql = "SELECT PERSONPHONE, PATIENTID, PHYSICIANIDADMIT, PHYSICIANIDREFER, BEDID, ROOMID, FACILITYID,"+
				"PERSONFNAME, PERSONLNAME, PERSONADDRESS, PERSONZIP, PATIENTTYPE, DATEADMITTED, PERSONCITY, PERSONSTATE, FACILITYID FROM PATIENT ";
        return jdbcTemplate.query(sql, new HashMap<String, Object>(), patientRowMapper);
	}
	
	public int getMaxPatientId(){
		
        return _jdbJdbcTemplate.queryForInt("SELECT MAX(PatientId) from PATIENT");
	}
	
	public Patient getPatient(int patientId) {
		String sql = "SELECT PERSONPHONE, PATIENTID, PHYSICIANIDADMIT, PHYSICIANIDREFER, BEDID, ROOMID, FACILITYID,"+
				"PERSONFNAME, PERSONLNAME, PERSONADDRESS, PERSONZIP, PATIENTTYPE, DATEADMITTED, PERSONCITY, PERSONSTATE, FACILITYID FROM PATIENT WHERE PATIENTID = :patientId";
		SqlParameterSource params = new MapSqlParameterSource().addValue("patientId", patientId);
        List<Patient> patients = jdbcTemplate.query(sql, params, patientRowMapper);
        return patients.isEmpty()? null : patients.get(0);

	}
	
	public List<Patient> getPatient(String name) {
		String sql = "SELECT PATIENTID, PHYSICIANIDADMIT, PHYSICIANIDREFER, BEDID, ROOMID, FACILITYID, PatientType " +
                "FROM PATIENT WHERE PERSONNAME = :name";		
		SqlParameterSource params = new MapSqlParameterSource().addValue("name", name);
        List<Patient> patients = jdbcTemplate.query(sql, params, patientRowMapper);
        return patients;
	}
	
	public void updatePatient(int patientId, String type) {
		String sql = "update Patient set PatientType = :type where PatientId = :patientId";
		SqlParameterSource params = new MapSqlParameterSource()
		.addValue("type", type)
		.addValue("patientId", patientId);
		jdbcTemplate.update(sql, params);
	}
	
	public void updatePatient(int patientId, String type, int bedId, int roomId, int facilityId) {
		String sql = "update Patient set PatientType = :type, BedId = :bedId, RoomId = :roomId, FacilityId = :facilityId where PatientId = :patientId";
		SqlParameterSource params = new MapSqlParameterSource()
		.addValue("bedId", bedId)
		.addValue("roomId", roomId)
		.addValue("facilityId", facilityId)
		.addValue("type", type)
		.addValue("patientId", patientId);
		jdbcTemplate.update(sql, params);
	}
	
	public void deletePatient(int patientId){
		_jdbJdbcTemplate.update("DELETE FROM PHYSICIANDX WHERE PATIENTID = "+patientId);
		_jdbJdbcTemplate.update("DELETE FROM PATIENT WHERE PATIENTID = "+patientId);
	}
	
	public void addPatient(String patientLName, String patientFName, int patientId, String patientType, int physicianIdAdmit, int physicianIdRefer,
			int bedId, int roomId, int facilityId, String personPhone, String personCity, String personZip, String personState, String personAddress) {
//		String sql = "insert into PATIENT " +
//				"(PATIENTID, PHYSICIANIDADMIT, PHYSICIANIDREFER, BEDID, ROOMID, FACILITYID, PATIENTTYPE) " +
//				"values ( :patientId, :physicianIdAdmit,:physicianIdRefer, :bedId, :roomId, :facilityId, :status)";
//		String sql = "insert into Patient" +
//				"(PATIENTID, PATIENTTYPE, physicianidadmit, physicianIdRefer, BedId, RoomId, FacilityId, PersonPhone, PersonCity, PersonZip, PersonState, PersonAddress, DateAdmitted)"+
//				"values (:patientId, :patientType, :physicianIdAdmit, :physicianIdRefer, :bedId, :roomId, :facilityId, :personPhone, :personCity, :personZip, :personState, :personAddress, to_date(':dateAdmitted', 'mm/dd/yyyy'))";
//		
		calendar.setTime(new Date());
		
		String dateAdmitted =(calendar.get(Calendar.MONTH) + 1) + 
				"/" + calendar.get(Calendar.DAY_OF_MONTH) + "/" +  calendar.get(Calendar.YEAR);

		String timeAdmitted = calendar.get(Calendar.HOUR_OF_DAY) + ":" + calendar.get(Calendar.MINUTE) + ":" + 
				calendar.get(Calendar.SECOND);
		
		String date = dateAdmitted + ":" + timeAdmitted;
		
		String sql = "insert into Patient"+
					"(PERSONFNAME, PERSONLNAME, PATIENTID, PATIENTTYPE, PHYSICIANIDADMIT,PHYSICIANIDREFER, BEDID, ROOMID, FACILITYID, PERSONPHONE, PERSONCITY, PERSONZIP, PERSONSTATE, PERSONADDRESS, DATEADMITTED)"+
					"values (:patientFName, :patientLName, :patientId, :patientType, :physicianIdAdmit, :physicianIdRefer, :bedId, :roomId, :facilityId, :personPhone, :personCity, :personZip, :personState, :personAddress, to_date(:dateAdmitted, 'mm/dd/yyyy:HH24:MI:SS'))";
		
		SqlParameterSource params = new MapSqlParameterSource()
		.addValue("patientId", patientId)
		.addValue("patientFName", patientFName)
		.addValue("patientLName", patientLName)
		.addValue("patientType", patientType)
		.addValue("physicianIdAdmit", physicianIdAdmit)
		.addValue("physicianIdRefer", physicianIdRefer)
		.addValue("bedId", bedId)
		.addValue("roomId", roomId)
		.addValue("facilityId", facilityId)
		.addValue("personPhone", personPhone)
		.addValue("personCity", personCity)
		.addValue("personZip", personZip)
		.addValue("personState", personState)
		.addValue("personAddress", personAddress)
		.addValue("dateAdmitted", date);
		jdbcTemplate.update(sql, params);

	}


}
