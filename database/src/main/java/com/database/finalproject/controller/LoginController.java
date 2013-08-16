package com.database.finalproject.controller;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.database.finalproject.dao.AccountDao;


@Controller
public class LoginController {
	@Autowired
	AccountDao accountDao;
	
	
	@RequestMapping(value = "/patient/", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam String physicianId, @RequestParam String password, HttpServletRequest request) throws SQLException{
		int result = accountDao.verify(physicianId, password);
		request.getSession().setAttribute("physician", result);
		
		
		if(result != -1)
			return new ModelAndView("patient");
		else
		
			return new ModelAndView(new RedirectView("../"), "message","Fail to login");

		
	}
}
