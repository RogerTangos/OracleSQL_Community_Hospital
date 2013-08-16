package com.database.finalproject.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class DiagnosisRowMapper implements RowMapper<Diagnosis>{

	@Override
	public Diagnosis mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		return new Diagnosis(rs.getInt("DIAGNOSISID"), rs.getString("DIAGNOSISNAME"));
	}
}
