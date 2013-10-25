<html>
<head>
<link href="/menu_assets/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="Header.jsp" %>
<%@ include file="Menu.jsp" %>
<table>
 <tr >
        <td valign="top" height="10px" width="222">
            <%@ include file="WebserviceMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Oneway Webservice</h2>
        	<p>Here we will see how one can make oneway call to web service. We will take our classic example for adding 
        	two numbers using oneway annotation then retrieve the result by making normal call.</p>
<pre class="pres">
package com.systemlogic;

import javax.annotation.Resource;
import javax.jws.Oneway;
import javax.jws.WebService;
import javax.servlet.ServletContext;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;

@WebService
public class ONEWAY {
	@Resource
	WebServiceContext context;
	@Oneway
	public void adding(int a, int b){
		int sum = a + b ;
		System.out.print(sum);
		ServletContext ctx = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
		ctx.setAttribute("TempData", sum);
	}	
	public int returnAddResult(int d){
		ServletContext ctx = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
		int sum = (Integer)ctx.getAttribute("TempData");
		sum = sum + d;
		System.out.print(sum);
		return sum ;
	}
}</pre>

<p>And entry for the same need to place in web.xml and sun-jaxws.xml file. Observer these two file carefully. In this 
web.xml is refering to WSServletContextListener servlet. Entry in web.xml is</p>
<pre class="pres">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;

&lt;web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://java.sun.com/xml/ns/j2ee" 
xmlns:javaee="http://java.sun.com/xml/ns/javaee" xmlns:web="http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd" 
xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd" version="2.4"&gt;
  &lt;description&gt;fromjava&lt;/description&gt;
  &lt;display-name&gt;fromjava&lt;/display-name&gt;
  &lt;listener&gt;
    &lt;listener-class&gt;com.sun.xml.ws.transport.http.servlet.WSServletContextListener&lt;/listener-class&gt;
  &lt;/listener&gt;
  &lt;servlet&gt;
    &lt;description&gt;JAX-WS endpoint - fromjava&lt;/description&gt;
    &lt;display-name&gt;fromjava&lt;/display-name&gt;
    &lt;servlet-name&gt;fromjava&lt;/servlet-name&gt;
    &lt;servlet-class&gt;com.sun.xml.ws.transport.http.servlet.WSServlet&lt;/servlet-class&gt;
    &lt;load-on-startup&gt;1&lt;/load-on-startup&gt;
  &lt;/servlet&gt;
  &lt;servlet-mapping&gt;
    &lt;servlet-name&gt;fromjava&lt;/servlet-name&gt;
    &lt;url-pattern&gt;/ONEWAY&lt;/url-pattern&gt;
  &lt;/servlet-mapping&gt;
  &lt;session-config&gt;
    &lt;session-timeout&gt;60&lt;/session-timeout&gt;
  &lt;/session-config&gt;
&lt;/web-app&gt;</pre>
  
<p>and sun-jaxws.xml will be</p>
<pre class="pres">&lt;endpoints xmlns='http://java.sun.com/xml/ns/jax-ws/ri/runtime' version='2.0'&gt;
    &lt;endpoint
        name='addendpoint'
        implementation='com.systemlogic.ONEWAY'
        url-pattern='/ONEWAY'/&gt;
&lt;/endpoints&gt;</pre>

<p><a href='https://github.com/systemlogic/Oneway/archive/master.zip'><span>Download Server code</span></a></p>
<p>Once you are able to see the WSDL on browser, client code can be generated using wsimport command</p>
<pre class="pres">wsimport -d . -keep http://localhost:8090/Oneway/ONEWAY?wsdl</pre>
<p>Client code OR artifact can be found in com.systemlogic folder. Copy the whole com folder and placed it in the 
src folder of client project. </p>
<pre class="pres">
ONEWAYService as = new ONEWAYService();
ONEWAY add = as.getONEWAYPort();
ONEWAY hello = as.getPort(ONEWAY.class);
Map<String, Object> req_ctx = ((BindingProvider)hello).getRequestContext();
req_ctx.put(BindingProvider.ENDPOINT_ADDRESS_PROPERTY, "http://localhost:8888/Oneway/ONEWAY");
System.out.println();

ONEWAY oneway = as.getONEWAYPort();
oneway.adding(12, 13);
int sum = oneway.returnAddResult(15);
System.out.println(sum);</pre>

<p><a href='https://github.com/systemlogic/OnewayClient/archive/master.zip'><span>Download Client code</span></a></p>
<p><b>P.S. Host name used in above example is localhost:8090</b></p>



	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>