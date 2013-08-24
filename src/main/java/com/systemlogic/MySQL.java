package com.systemlogic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MySQL{
	
	@RequestMapping(value = "/mySQL", method = RequestMethod.GET)
	public String getmySQL(ModelMap model) {
		return "mySQL";
	}@RequestMapping(value = "/mySQLCreateTable", method = RequestMethod.GET)
	public String getmySQLCreateTable(ModelMap model) {
		return "mySQLCreateTable";
	}
	
}
