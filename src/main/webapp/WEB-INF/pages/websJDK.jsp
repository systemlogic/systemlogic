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
        	<h2>Web service(using JDK 1.5)</h2>
        	<p>With JDK 1.5 One doesn't need to set the class path of jar axis-ant,axis.jar,saaj,jaxrpc and other 
        	related jars. JDK 1.5 is coming with wsimport utility which serve the same purpose like java 
        	org.apache.axis.wsdl.WSDL2Java does. Also Webservice Annotation tag can be used in java class. Class 
        	file can be modified to</p>
<pre class="pres">
package com.webservice;

import javax.jws.WebMethod;
import javax.jws.WebService;


@WebService
public class Hello{
	@WebMethod
	public String hi(String str){
		System.out.println("Hi " + str + " !!" );
		return "Hi " + str + " !!" ;
	}
	@WebMethod
	public int sum(int a, int b){
		int sum = a + b ;
		System.out.println("Sum="+sum);
		return sum;
	}
}
</pre>

<p>And entry for the same need to place in web.xml and sun-jaxws.xml file. Observer these two file carefully. In this 
web.xml is refering to WSServletContextListener servlet. Entry in web.xml is</p>
<pre class="pres">
&lt;web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xmlns="http://java.sun.com/xml/ns/j2ee" xmlns:javaee="http://java.sun.com/xml/ns/javaee" 
xmlns:web="http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd" 
xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee 
http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd" version="2.4"&gt;
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
    &lt;url-pattern&gt;/Hello&lt;/url-pattern&gt;
  &lt;/servlet-mapping&gt;
  &lt;session-config&gt;
    &lt;session-timeout&gt;60&lt;/session-timeout&gt;
  &lt;/session-config&gt;
&lt;/web-app&gt;</pre>
  
<p>and sun-jaxws.xml will be</p>
<pre class="pres">&lt;endpoints xmlns='http://java.sun.com/xml/ns/jax-ws/ri/runtime' version='2.0'&gt;
    &lt;endpoint
        name='hellopoint'
        implementation='com.webservice.Hello'
        url-pattern='/Hello'/&gt;
&lt;/endpoints&gt;</pre>

<p><a href='https://github.com/systemlogic/wsimportWS/archive/master.zip'><span>Server Side code</span></a></p>
<p>Once you are able to see the WSDL on browser, client code can be generated using wsimport command</p>
<pre class="pres">wsimport -d . -p com.systemlogic -keep http://localhost:8090/wsimportWS/Hello?wsdl</pre>
<p>Client code OR artifact can be found in com.systemlogic folder. Copy the whole com folder and placed it in the 
src folder of client project. </p>

<p><a href='https://github.com/systemlogic/wsimportWSClient/archive/master.zip'><span>Download Client code</span></a></p>
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