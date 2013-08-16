<html>
<head>
<link href="/menu_assets/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="Header.jsp"%>
	<%@ include file="Menu.jsp"%>
	<table>
		<tr>
			<td valign="top" height="10px" width="222"><%@ include
					file="springWebMenu.jsp"%></td>
			<td></td>
			<td align="left" bordercolor="c41200">
				<h2>Web Servlet</h2>
				<p><b>DispatcherServlet : </b> is the Servlet inherits from the HttpServlet and declared in the web.xml 
				One need to map requests that DispatcherServlet need to handle, by using a URL mapping web.xml file.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;servlet&gt;
	&lt;servlet-name&gt;<b>mvc-dispatcher</b>&lt;/servlet-name&gt;
	&lt;servlet-class&gt;org.springframework.web.servlet.DispatcherServlet&lt;/servlet-class&gt;
	&lt;load-on-startup&gt;1&lt;/load-on-startup&gt;
&lt;/servlet&gt;

&lt;servlet-mapping&gt;
	&lt;servlet-name&gt;<b>mvc-dispatcher</b>&lt;/servlet-name&gt;
	&lt;url-pattern&gt;/pattern/*&lt;/url-pattern&gt;
&lt;/servlet-mapping&gt;				
</pre>
<p>After this it will look for file with name <b>mvc-dispatcher</b>-servlet.xml in WEB-INF directory.</p>

<p>Wait a minute. For some reason you want to use different filename other then used in servlet name and also you want 
to split the bean defination among different xml files. </p>

<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;servlet&gt;
	&lt;servlet-name&gt;mvc-dispatcher&lt;/servlet-name&gt;
	&lt;servlet-class&gt;
               org.springframework.web.servlet.DispatcherServlet
        &lt;/servlet-class&gt;
        &lt;init-param&gt;
        	&lt;param-name&gt;namespace&lt;/param-name&gt;
				&lt;param-value&gt;web-servlet&lt;/param-value&gt;
        &lt;/init-param&gt;
	&lt;load-on-startup&gt;1&lt;/load-on-startup&gt;
&lt;/servlet&gt;

&lt;servlet-mapping&gt;
	&lt;servlet-name&gt;mvc-dispatcher&lt;/servlet-name&gt;
	&lt;url-pattern&gt;/&lt;/url-pattern&gt;
&lt;/servlet-mapping&gt;

&lt;context-param&gt;
	&lt;param-name&gt;contextConfigLocation&lt;/param-name&gt;
	&lt;param-value&gt;/WEB-INF/web-servlet.xml, /WEB-INF/datasource-servlet.xml&lt;/param-value&gt;
&lt;/context-param&gt;</pre>

<p>@Controller annotation in the class tells this class will serves as controller. So what we need to use @Controller? We need to define location to scan for 
classes.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:p="http://www.springframework.org/schema/p" 
    xmlns:context="http://www.springframework.org/schema/context"
    xsi:schemaLocation="
        http://www.springframework.org/schema/beans 
        http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
        http://www.springframework.org/schema/context 
        http://www.springframework.org/schema/context/spring-context-3.0.xsd"&gt;

    &lt;context:component-scan base-package="com.common.controller com.common.connection com.common.mapper com.common.model" /&gt;

&lt;/beans&gt;</pre>
and in class
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
@Controller
public class CompanyHandler {}</pre>
<p>Is this suffice? No we have to put entry into the class(@RequestMapping) to define URL mapping.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
@Controller
@RequestMapping("/dept")
public class CompanyHandler {}</pre>
<p>Above mapping will make sure all request prefix with /dept. So how the class should look like.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
package com.common.controller;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.common.connection.DeptConnection;
import com.common.model.Dept;

@Controller
@RequestMapping(value="/dept")
public class CompanyHandler {

	@Autowired
	DeptConnection connection;

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getDepts(@RequestParam(value="petId", required=false) Integer petId,
			HttpServletRequest   request,
			HttpServletResponse  response) throws Exception{
		String result ;
		ModelAndView mv = new ModelAndView();
		
		try{
			result = connection.getDepts();
		}catch(Exception e){
			mv.addObject("message", e.getMessage());
			mv.setViewName("error");
			return mv;	
		}
		mv.addObject("message",result);
		mv.setViewName("result");
		return mv;	

	}
	
	@RequestMapping(value="/{id}",method=RequestMethod.GET)
	public String getDept(@PathVariable String id, HttpServletRequest   request,
			HttpServletResponse  response, ModelMap model) throws Exception{
		String result ;
		try{
			result = connection.getDept(id);
		}catch(Exception e){
			model.addAttribute("message", e.getMessage());
			return "error";	
		}
		model.addAttribute("message",result);
		return "result";

	}
	@RequestMapping(value="/{deptid}/{deptDesc}",method=RequestMethod.POST)
	@Transactional
	public String postDept(@PathVariable("deptid") String deptID, @PathVariable String deptDesc,
			HttpServletRequest   request,
			HttpServletResponse  response, ModelMap model) throws Exception{
		String result ;
		try{
			result = connection.postDept(deptID, deptDesc);
		}catch(Exception e){
			model.addAttribute("message", e.getMessage());
			return "error";
		}
		model.addAttribute("message", result);
		return "result";

	}
	@RequestMapping(value="/{deptid}/{deptDesc}",method=RequestMethod.PUT)
	@Transactional
	public String putDept(@PathVariable String deptid, @PathVariable String deptDesc,
			HttpServletRequest   request,
			HttpServletResponse  response, ModelMap model) throws Exception{
		String result ;
		try{
			result = connection.putDept(deptid, deptDesc);
		}catch(Exception e){
			model.addAttribute("message", e.getMessage());
			return "error";
		}
		model.addAttribute("message", result);
		return "result";

	}
	@RequestMapping(value="/{id}",method=RequestMethod.DELETE)
	@Transactional
	public String deleteDept(@PathVariable String id, HttpServletRequest   request,
			HttpServletResponse  response, ModelMap model) throws Exception{
		String result ;
		try{
			result = connection.deleteDept(id);
		}catch(Exception e){
			model.addAttribute("message", e.getMessage());
			return "error";	
		}
		model.addAttribute("message", result);
		return "result";

	}
}</pre>
<p>Examine the getDepts return type and getDept return type. One is returning String and other ModelAndView, but both 
transferring control to the view.</p>
<p>Also it demonstrate all REST method with PathVariable. getDepts function tag with @RequestParam. These are those part of url that 
represent variable value pair. URL would by like ?varible=value and request can be send as /dept or /dept/?petId=23</p>
<p>How about getting result in JSON? Need to add following the following bean.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;bean id="jacksonMessageConverter"
	class="org.springframework.http.converter.json.MappingJacksonHttpMessageConverter"&gt;&lt;/bean&gt;
&lt;bean
	class="org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter"&gt;
	&lt;property name="messageConverters"&gt;
		&lt;list&gt;
			&lt;ref bean="jacksonMessageConverter" /&gt;
		&lt;/list&gt;
	&lt;/property&gt;
&lt;/bean&gt;</pre>

final HttpServletResponse httpResponse
			</td>
			<%@ include file="rightPane.jsp"%>
		</tr>
	</table>
	<%@ include file="FooterLink.jsp"%>
	<%@ include file="Footer.jsp"%>
</body>
</html>