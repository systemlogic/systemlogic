package com.systemlogic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Build{
	
	@RequestMapping(value = "/maven", method = RequestMethod.GET)
	public String getmaven(ModelMap model) {
		return "maven";
	}
	@RequestMapping(value = "/terminalMavenHW", method = RequestMethod.GET)
	public String getterminalMavenHW(ModelMap model) {
		return "terminalMavenHW";
	}
	@RequestMapping(value = "/eclipseMavenHW", method = RequestMethod.GET)
	public String geteclipseMavenHW(ModelMap model) {
		return "eclipseMavenHW";
	}
	@RequestMapping(value = "/pom", method = RequestMethod.GET)
	public String getpom(ModelMap model) {
		return "pom";
	}
	@RequestMapping(value = "/externalJAR", method = RequestMethod.GET)
	public String getexternalJAR(ModelMap model) {
		return "externalJAR";
	}
	@RequestMapping(value = "/toolSupport", method = RequestMethod.GET)
	public String gettoolSupport(ModelMap model) {
		return "toolSupport";
	}
	@RequestMapping(value = "/ant", method = RequestMethod.GET)
	public String getant(ModelMap model) {
		return "ant";
	}
	@RequestMapping(value = "/antHW", method = RequestMethod.GET)
	public String getantHW(ModelMap model) {
		return "antHW";
	}@RequestMapping(value = "/antclassPathNProperty", method = RequestMethod.GET)
	public String getantclassPathNProperty(ModelMap model) {
		return "antclassPathNProperty";
	}
	@RequestMapping(value = "/antJarNScp", method = RequestMethod.GET)
	public String getantJarNScp(ModelMap model) {
		return "antJarNScp";
	}
	@RequestMapping(value = "/antTags", method = RequestMethod.GET)
	public String getantTags(ModelMap model) {
		return "antTags";
	}
}
