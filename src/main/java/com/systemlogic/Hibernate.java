package com.systemlogic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Hibernate {
	
	@RequestMapping(value = "/hibernateFirstAnnotation", method = RequestMethod.GET)
	public String getHibernateFirstAnnotation(ModelMap model) {
		return "hibernateFirstAnnotation";
	}
	@RequestMapping(value = "/hibernateFirstXML", method = RequestMethod.GET)
	public String getHibernateFirstXML(ModelMap model) {
		return "hibernateFirstXML";
	}
	
}
