package com.systemlogic;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DesignPattern {
	@RequestMapping(value = "/designPattern", method = RequestMethod.GET)
	public String getDesignPattern(ModelMap model) {
		return "designPattern";
	}
	@RequestMapping(value = "/creational", method = RequestMethod.GET)
	public String getCreational(ModelMap model) {
		return "creational";
	}
	@RequestMapping(value = "/prototype", method = RequestMethod.GET)
	public String getPrototype(ModelMap model) {
		return "prototype";
	}
}
