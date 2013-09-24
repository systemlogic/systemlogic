package com.systemlogic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Adobe{
	
	@RequestMapping(value = "/AdobeFlex", method = RequestMethod.GET)
	public String getAdobeFlex(ModelMap model) {
		return "AdobeFlex";
	}@RequestMapping(value = "/AdobeFlexHttpRest", method = RequestMethod.GET)
	public String getAdobeFlexHttpRest(ModelMap model) {
		return "AdobeFlexHttpRest";
	}@RequestMapping(value = "/AdobeFlexMobile", method = RequestMethod.GET)
	public String getAdobeFlexMobile(ModelMap model) {
		return "AdobeFlexMobile";
	}@RequestMapping(value = "/AdobeLivecycle", method = RequestMethod.GET)
	public String getAdobeLivecycle(ModelMap model) {
		return "AdobeLivecycle";
	}
}
