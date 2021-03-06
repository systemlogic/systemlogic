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
	}@RequestMapping(value = "/mySQLSelectStatement", method = RequestMethod.GET)
	public String getmySQLSelectStatement(ModelMap model) {
		return "mySQLSelectStatement";
	}@RequestMapping(value = "/mySQLInnerQuaries", method = RequestMethod.GET)
	public String getmySQLInnerQuaries(ModelMap model) {
		return "mySQLInnerQuaries";
	}@RequestMapping(value = "/mySQLJoinsMath", method = RequestMethod.GET)
	public String getmySQLJoinsMath(ModelMap model) {
		return "mySQLJoinsMath";
	}@RequestMapping(value = "/mySQLDeleteDropTruncate", method = RequestMethod.GET)
	public String getmySQLDeleteDropTruncate(ModelMap model) {
		return "mySQLDeleteDropTruncate";
	}@RequestMapping(value = "/mySQLProcedureFunction", method = RequestMethod.GET)
	public String getmySQLProcedureFunction(ModelMap model) {
		return "mySQLProcedureFunction";
	}@RequestMapping(value = "/mySQLView", method = RequestMethod.GET)
	public String getmySQLView(ModelMap model) {
		return "mySQLView";
	}@RequestMapping(value = "/oracleView", method = RequestMethod.GET)
	public String getoracleView(ModelMap model) {
		return "oracleView";
	}@RequestMapping(value = "/mySQLTriggers", method = RequestMethod.GET)
	public String getmySQLTriggers(ModelMap model) {
		return "mySQLTriggers";
	}@RequestMapping(value = "/mySQLTransaction", method = RequestMethod.GET)
	public String getmySQLTransaction(ModelMap model) {
		return "mySQLTransaction";
	}
	
}
