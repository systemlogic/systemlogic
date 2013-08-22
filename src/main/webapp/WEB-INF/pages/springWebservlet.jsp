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
<pre class="pres">
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

<pre class="pres">
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
<pre class="pres">
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

    &lt;context:component-scan 
    base-package="com.common.controller com.common.connection com.common.mapper com.common.model" /&gt;

&lt;/beans&gt;</pre>
and in class
<pre class="pres">
@Controller
public class CompanyHandler {}</pre>
<p>Is this suffice? No we have to put entry into the class(@RequestMapping) to define URL mapping.</p>
<pre class="pres">
@Controller
@RequestMapping("/dept")
public class CompanyHandler {}</pre>
<p>Above mapping will make sure all request prefix with /dept. So how the class should look like.</p>
<pre class="pres">
package com.common.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import com.common.connection.DeptConnection;
import com.common.model.Dept;
import com.common.model.DeptList;
import com.common.model.Message;

@Controller
@RequestMapping(value="/dept")
public class CompanyHandler {

	@Autowired
	DeptConnection connection;

	@ResponseBody @RequestMapping(method=RequestMethod.GET)
	public Object getDepts(@RequestParam(value="petId", required=false) Integer petId,
			HttpServletRequest   request,
			HttpServletResponse  response) throws Exception{
		DeptList result = null;
		
		try{
			result = connection.getDepts();
		}catch(Exception e){
			Message msg = new Message();
			msg.setMsg(e.getMessage());
			return msg;
		}
		
		return result;	

	}
	
	@ResponseBody @RequestMapping(value="/{id}",method=RequestMethod.GET)
	public Object getDept(@PathVariable String id, HttpServletRequest   request,
			HttpServletResponse  response, ModelMap model) throws Exception{
		Dept result =null;
		try{
			result = connection.getDept(id);
		}catch(Exception e){
			Message msg = new Message();
			msg.setMsg(e.getMessage());
			return msg;	
		}
		return result;

	}
	@ResponseBody @RequestMapping(value="/{deptid}/{deptDesc}",method=RequestMethod.POST)
	@Transactional
	public Message postDept(@PathVariable("deptid") String deptID, @PathVariable String deptDesc,
			HttpServletRequest   request,
			HttpServletResponse  response, ModelMap model) throws Exception{
		Message result = new Message();
		try{
			result.setMsg(connection.postDept(deptID, deptDesc));
		}catch(Exception e){
			result.setMsg(e.getMessage());	
		}
		return result;

	}
	@ResponseBody @RequestMapping(value="/{deptid}/{deptDesc}",method=RequestMethod.PUT)
	@Transactional
	public Message putDept(@PathVariable("deptid") String deptID, @PathVariable String deptDesc,
			HttpServletRequest   request,
			HttpServletResponse  response, ModelMap model) throws Exception{
		Message result = new Message();
		try{
			result.setMsg(connection.putDept(deptID, deptDesc));
		}catch(Exception e){
			result.setMsg(e.getMessage());	
		}
		return result;

	}
	@ResponseBody @RequestMapping(value="/{id}",method=RequestMethod.DELETE)
	@Transactional
	public Message deleteDept(@PathVariable String id, HttpServletRequest   request,
			HttpServletResponse  response, ModelMap model) throws Exception{
		Message result = new Message();
		try{
			result.setMsg(connection.deleteDept(id));
		}catch(Exception e){
			result.setMsg(e.getMessage());	
		}
		return result;

	}
}</pre>
<p>Also it demonstrate all REST method with PathVariable. getDepts function tag with @RequestParam. These are those part of url that 
represent variable value pair. URL would by like ?varible=value and request can be send as /dept or /dept/?petId=23</p>
<p>How about getting result in JSON? Above code already taking care of json output. Try baseURL/dept with header as json.</p>
<pre class="pres">
curl -X GET http://restapp.systemlogic.cloudbees.net/dept -H "Accept: application/xml"
OR 
curl -X GET http://restapp.systemlogic.cloudbees.net/dept -H "Accept: application/json"
</pre>
<p>What about returning control to certain view where variable value can be  menupulate.</p>
<pre class="pres">
package com.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.common.connection.DeptConnection;
import com.common.connection.EmpConnection;

@Controller
public class EmployeeController {

	@Autowired
	EmpConnection connection;
	
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	public ModelAndView getEmp(@PathVariable String id, HttpServletRequest   request,
			HttpServletResponse  response, ModelAndView model) throws Exception{
		String result ;
		model.setViewName("result");
		try{
			result = connection.getEmp(id);
		}catch(Exception e){
			model.addObject("message", e.getMessage());
			return model;	
		}
		model.addObject("message",result);
		return model;

	}
	
	@RequestMapping(value="/empList/{id}",method=RequestMethod.GET)
	public String getEmpList(@PathVariable String id, HttpServletRequest   request,
			HttpServletResponse  response, ModelMap model) throws Exception{
		String result ;
		try{
			result = connection.getEmpList(id);
		}catch(Exception e){
			model.addAttribute("message", e.getMessage());
			return "error";	
		}
		model.addAttribute("message",result);
		return "result";

	}
	
	
	@RequestMapping(value="/emp/{id}/{firstName}/{lastName}/{dept}",method=RequestMethod.POST)
	@Transactional
	public String postEmp(@PathVariable int id,@PathVariable String firstName,
			@PathVariable String lastName,@PathVariable String dept,
			HttpServletRequest   request,
			HttpServletResponse  response, ModelMap model) throws Exception{
		String result ;
		try{
			result = connection.postEmp(id, firstName, lastName, dept);
		}catch(Exception e){
			model.addAttribute("message", e.getMessage());
			return "error";
		}
		model.addAttribute("message", result);
		return "result";
	}
	@RequestMapping(value="/emp/{id}/{firstName}/{lastName}/{dept}",method=RequestMethod.PUT)
	@Transactional
	public String putEmp(@PathVariable int id,@PathVariable String firstName,
			@PathVariable String lastName,@PathVariable String dept,
			HttpServletRequest   request,
			HttpServletResponse  response, ModelMap model) throws Exception{
		String result ;
		try{
			result = connection.putEmp(id, firstName, lastName, dept);
		}catch(Exception e){
			model.addAttribute("message", e.getMessage());
			return "error";
		}
		model.addAttribute("message", result);
		return "result";

	}
	@RequestMapping(value="/emp/{id}",method=RequestMethod.DELETE)
	@Transactional 
	public String deleteEmp(@PathVariable String id, HttpServletRequest   request,
			HttpServletResponse  response, ModelMap model) throws Exception{
		String result ;
		try{
			result = connection.deleteEmp(id);
		}catch(Exception e){
			model.addAttribute("message", e.getMessage());
			return "error";	
		}
		model.addAttribute("message", result);
		return "result";

	}
	
}</pre>
<p>Observer return type of getEmp and getEmpList, both are different and returning control to the result vies(jsp).</p>
<p> <b>Base URL :</b> <a href='http://restapp.systemlogic.cloudbees.net'><span>http://restapp.systemlogic.cloudbees.net</span></a></p>
<p><a href='https://github.com/systemlogic/RestApp/archive/master.zip'><span>Download this Example</span></a></p>
			</td>
			<%@ include file="rightPane.jsp"%>
		</tr>
	</table>
	<%@ include file="FooterLink.jsp"%>
	<%@ include file="Footer.jsp"%>
</body>
</html>