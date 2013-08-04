package com.systemlogic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CoreJava {
	
	@RequestMapping(value = "/helloWorld", method = RequestMethod.GET)
	public String getCoreJava(ModelMap model) {
		return "helloWorld";
	}
	
	@RequestMapping(value = "/coreJavaHelloWorld", method = RequestMethod.GET)
	public String getCoreJavaHelloWorld(ModelMap model) {
		return "coreJavaHelloWorld";
	}
	
	@RequestMapping(value = "/coreJavaStack", method = RequestMethod.GET)
	public String getstack(ModelMap model) {
		return "coreJavaStack";
	}
	
	@RequestMapping(value = "/coreJavaQueue", method = RequestMethod.GET)
	public String getQueue(ModelMap model) {
		return "coreJavaQueue";
	}
	
	@RequestMapping(value = "/coreJavaList", method = RequestMethod.GET)
	public String getList(ModelMap model) {
		return "coreJavaList";
	}
	
	@RequestMapping(value = "/throwable", method = RequestMethod.GET)
	public String getexceptionNerror(ModelMap model) {
		return "throwable";
	}
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String geterror(ModelMap model) {
		return "error";
	}
	@RequestMapping(value = "/exception", method = RequestMethod.GET)
	public String getexception(ModelMap model) {
		return "exception";
	}
	
	@RequestMapping(value = "/tryCatchFinally", method = RequestMethod.GET)
	public String getTryCatch(ModelMap model) {
		return "tryCatchFinally";
	}
	@RequestMapping(value = "/collection", method = RequestMethod.GET)
	public String getcollection(ModelMap model) {
		return "collection";
	}
	
	@RequestMapping(value = "/objectClass", method = RequestMethod.GET)
	public String getobjClass(ModelMap model) {
		return "objectClass";
	}
	@RequestMapping(value = "/collectionList", method = RequestMethod.GET)
	public String getCollectionList(ModelMap model) {
		return "collectionList";
	}
	
	@RequestMapping(value = "/collectionQueue", method = RequestMethod.GET)
	public String getCollectionQueue(ModelMap model) {
		return "collectionQueue";
	}
	@RequestMapping(value = "/collectionSet", method = RequestMethod.GET)
	public String getCollectionSet(ModelMap model) {
		return "collectionSet";
	}
	@RequestMapping(value = "/collectionMap", method = RequestMethod.GET)
	public String getCollectionMap(ModelMap model) {
		return "collectionMap";
	}
	@RequestMapping(value = "/threadMain", method = RequestMethod.GET)
	public String getthreadMain(ModelMap model) {
		return "threadMain";
	}
	@RequestMapping(value = "/createThread", method = RequestMethod.GET)
	public String getcreateThread(ModelMap model) {
		return "createThread";
	}
	@RequestMapping(value = "/threadState", method = RequestMethod.GET)
	public String getthreadState(ModelMap model) {
		return "threadState";
	}
	@RequestMapping(value = "/threadSleepYieldJoin", method = RequestMethod.GET)
	public String getthreadSleepYieldJoin(ModelMap model) {
		return "threadSleepYieldJoin";
	}
	@RequestMapping(value = "/threadSynchronize", method = RequestMethod.GET)
	public String getthreadSynchronize(ModelMap model) {
		return "threadSynchronize";
	}
	@RequestMapping(value = "/threadWaitNotify", method = RequestMethod.GET)
	public String getthreadWaitNotify(ModelMap model) {
		return "threadWaitNotify";
	}
	@RequestMapping(value = "/threadDeadlock", method = RequestMethod.GET)
	public String getthreadDeadlock(ModelMap model) {
		return "threadDeadlock";
	}
	@RequestMapping(value = "/jUnit", method = RequestMethod.GET)
	public String getjUnit(ModelMap model) {
		return "jUnit";
	}
	@RequestMapping(value = "/writeJUnit", method = RequestMethod.GET)
	public String getwritejUnit(ModelMap model) {
		return "writeJUnit";
	}
	@RequestMapping(value = "/writeJUnitSuite", method = RequestMethod.GET)
	public String getwriteJUnitSuite(ModelMap model) {
		return "writeJUnitSuite";
	}
	@RequestMapping(value = "/ioserialization", method = RequestMethod.GET)
	public String getioserialization(ModelMap model) {
		return "ioserialization";
	}
	@RequestMapping(value = "/ioconsole", method = RequestMethod.GET)
	public String getioconsole(ModelMap model) {
		return "ioconsole";
	}
	@RequestMapping(value = "/iofile", method = RequestMethod.GET)
	public String getiofile(ModelMap model) {
		return "iofile";
	}
	@RequestMapping(value = "/xjc", method = RequestMethod.GET)
	public String getxjc(ModelMap model) {
		return "xjc";
	}
	@RequestMapping(value = "/xjcmarshell", method = RequestMethod.GET)
	public String getxjcmarshell(ModelMap model) {
		return "xjcmarshell";
	}@RequestMapping(value = "/xjcunmarshell", method = RequestMethod.GET)
	public String getxjcunmarshell(ModelMap model) {
		return "xjcunmarshell";
	}@RequestMapping(value = "/xjcOthers", method = RequestMethod.GET)
	public String getxjcOthers(ModelMap model) {
		return "xjcOthers";
	}
	
}
