package com.database.finalproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("accountDao")
public class AccountDao {

	@Inject
	private DataSource dataSource;

	public int verify(String username, String password) throws SQLException{
		Connection conn = null;
		
		conn = dataSource.getConnection();
		String sql = "SELECT PHYSICIANID FROM ACCOUNT WHERE PHYSICIANID='"+username+"' AND PASSWORD = '"+ password+"'";
		PreparedStatement preStatement = conn.prepareStatement(sql);
		ResultSet result = preStatement.executeQuery();
		if(result.next())
			return result.getInt("PHYSICIANID");
		else
			return -1;
		
	}
	
}
