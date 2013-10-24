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
        	<h2>Web service(using Axis)</h2>
        	<p>Let us write webservice using pure java code. </p>
<pre class="pres">
package com.webservice;
public class Hello{

	public String hi(String str){
		System.out.println("Hi " + str + " !!" );
		return "Hi " + str + " !!" ;
	}
	
	public int sum(int a, int b){
		int sum = a + b ;
		System.out.println("Sum="+sum);
		return sum;
	}
}</pre>

<p>Compile the code and place the class file into the axis/WEB-INF/classes folder or place it under class folder of attached
project OR if you are using eclipse write normal code into the src folder.</p>
<p>Extra thing we need over the jws is we need to have one wsdd file for deploying the class file to web service. The content of 
wsdd file is as follows.</p>
<pre class="pres">
&lt;deployment xmlns="http://xml.apache.org/axis/wsdd/" 
		xmlns:java="http://xml.apache.org/axis/wsdd/providers/java"&gt;
	&lt;service name="WebServiceName" provider="java:RPC"&gt;
	&lt;parameter name="allowedMethods" value="*"/&gt;
	&lt;parameter name="className" value="com.webservice.Hello"/&gt;
	&lt;/service&gt;
&lt;/deployment&gt;</pre>
<p>Say this file name is deploy.wsdd and is placed under home folder.</p>
<p>Set the jar into classpath.</p>
<pre class="pres">
export CLASSPATH="$CLASSPATH:axis-ant.jar:axis.jar:commons-discovery-0.2.jar:commons-logging-1.0.4.jar:
jaxrpc.jar:log4j-1.2.8.jar:saaj.jar:wsdl4j-1.5.1.jar"</pre>
<p>If axis is deployed and running on port 8080 then run the following command from home folder where wsdd file is placed.</p>
<pre class="pres">java org.apache.axis.client.AdminClient deploy.wsdd</pre>
<p>In case applicatoin name is other then axis and port number is also different then one has to run following command.</p>
<pre class="pres">java org.apache.axis.client.AdminClient -l http://localhost:8090/javaWebService/servlet/AxisServlet
 deploy.wsdd</pre>
 <p>Observe carefully one file with name <b>server-config.wsdd</b> will be created under WEB-INF folder. In case tomcat is 
 running from eclipse one has to dig into relative location {workspace-location}/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/javaWebService/WEB-INF . 
 The file will have service name and class mapped. Other things can be ignored.</p>
 <p>Hit the url http://localhost:8090/javaWebService/services/ . One could be able to see the service available.</p>

<p><a href='https://github.com/systemlogic/javaWebService/archive/master.zip'><span>Download Server code</span></a></p>

<p>Client code will be generated same way like in jws example.</p>

	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>