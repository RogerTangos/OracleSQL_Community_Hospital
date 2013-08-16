package com.database.finalproject.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.database.finalproject.model.Diagnosis;
import com.database.finalproject.model.DiagnosisRowMapper;
import com.database.finalproject.model.Patient;

@Repository("diagnosisDao")
public class DiagnosisDao {

    @Inject private NamedParameterJdbcOperations jdbcTemplate;
    @Inject private DiagnosisRowMapper diagnosisRowMapper;
    
    public List<Diagnosis> getDiagnosises(){
    	String sql = "SELECT * FROM Diagnosis";
        return jdbcTemplate.query(sql, new HashMap<String, Object>(), diagnosisRowMapper);
    }
    
    public Diagnosis getDiagnosisById(int diagnosisId){
    	String sql = "SELECT * FROM Diagnosis WHERE DiagnosisId = :diagnosisId";
		SqlParameterSource params = new MapSqlParameterSource().addValue("diagnosisId", diagnosisId);
        List<Diagnosis> list = jdbcTemplate.query(sql, params, diagnosisRowMapper);
        return list.isEmpty()? null : list.get(0);
    }
    
    public Diagnosis getDiagnosisByPatient(int patientId){
    	String sql = "SELECT DIAGNOSISID, DIAGNOSISNAME FROM PHYSICIANDX,DIAGNOSIS WHERE PHYSICIANDX.DIAGNOSISID = DIAGNOSIS.DIAGNOSISID AND PHYSICIANDX.patientId = :patientId";
		SqlParameterSource params = new MapSqlParameterSource().addValue("patientId", patientId);
        List<Diagnosis> list = jdbcTemplate.query(sql, params, diagnosisRowMapper);
        return list.isEmpty()? null : list.get(0);
    	
    }
}
