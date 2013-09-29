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
	}@RequestMapping(value = "/objectPool", method = RequestMethod.GET)
	public String getobjectPool(ModelMap model) {
		return "objectPool";
	}@RequestMapping(value = "/adaptor", method = RequestMethod.GET)
	public String getadaptor(ModelMap model) {
		return "adaptor";
	}@RequestMapping(value = "/bridge", method = RequestMethod.GET)
	public String getbridge(ModelMap model) {
		return "bridge";
	}@RequestMapping(value = "/FactoryMethod", method = RequestMethod.GET)
	public String getFactoryMethod(ModelMap model) {
		return "FactoryMethod";
	}@RequestMapping(value = "/AbstractFactoryMethod", method = RequestMethod.GET)
	public String getAbstractFactoryMethod(ModelMap model) {
		return "AbstractFactoryMethod";
	}@RequestMapping(value = "/builderDP", method = RequestMethod.GET)
	public String getbuilderDP(ModelMap model) {
		return "builderDP";
	}@RequestMapping(value = "/proxy", method = RequestMethod.GET)
	public String getproxy(ModelMap model) {
		return "proxy";
	}	
}
