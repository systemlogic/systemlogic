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
        	<h2>Security(Using Weblogic Server)</h2>
        	<p>No Example web service we have seen to which implements over https a secure protocol. Here we will see</p>
        	one such example using weblogic server. Secure port in this case is 7002. The web service code is as follows.
<pre class="pres">
package com.emc.Security;

import javax.jws.WebMethod;
import javax.jws.WebService;
import weblogic.jws.Policies;
import weblogic.jws.Policy;

@WebService
@Policies({ @Policy(uri = "policy:Https-policy.xml") })
public class WeblogicSecurity {
	@WebMethod
	public String sayHai(String x)
	{  System.out.println(" in server "+x);
		return " hai "+x;
	}
}</pre>

<p>And policy file Https-policy.xml content is as follows</p>
<pre class="pres">
&lt;?xml version="1.0"?&gt;
&lt;wsp:Policy 
  xmlns:wsp="http://schemas.xmlsoap.org/ws/2004/09/policy"
  xmlns:sp="http://docs.oasis-open.org/ws-sx/ws-securitypolicy/200512"
  &gt;
  &lt;sp:TransportBinding&gt;
    &lt;wsp:Policy&gt;
      &lt;sp:TransportToken&gt;
        &lt;wsp:Policy&gt;
          &lt;sp:HttpsToken /&gt;
        &lt;/wsp:Policy&gt;
      &lt;/sp:TransportToken&gt;
      &lt;sp:AlgorithmSuite&gt;
        &lt;wsp:Policy&gt;
          &lt;sp:Basic256/&gt;
        &lt;/wsp:Policy&gt;
      &lt;/sp:AlgorithmSuite&gt;
      &lt;sp:Layout&gt;
        &lt;wsp:Policy&gt;
          &lt;sp:Lax/&gt;
        &lt;/wsp:Policy&gt;
      &lt;/sp:Layout&gt;
      &lt;sp:IncludeTimestamp/&gt;
    &lt;/wsp:Policy&gt;
  &lt;/sp:TransportBinding&gt;
&lt;/wsp:Policy&gt;</pre>

<p><b>Include weblogic.jar in project classpath from it's server location. DO NOT COPY THE JAR TO PROJECT FOLDER.</b></p>

<p>Also place weblogic.xml into the WEB-INF folder.</p>
<pre class="pres">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;wls:weblogic-web-app xmlns:wls="http://xmlns.oracle.com/weblogic/weblogic-web-app" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xsi:schemaLocation="http://java.sun.com/xml/ns/javaee 
http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd 
http://xmlns.oracle.com/weblogic/weblogic-web-app 
http://xmlns.oracle.com/weblogic/weblogic-web-app/1.2/weblogic-web-app.xsd"&gt;
    &lt;wls:weblogic-version&gt;10.3.5&lt;/wls:weblogic-version&gt;
    &lt;wls:context-root&gt;WeblogicSecurity&lt;/wls:context-root&gt;
&lt;/wls:weblogic-web-app&gt;</pre>

<p><a href='https://github.com/systemlogic/WeblogicSecurity/archive/master.zip'><span>Download Server code</span></a></p>

<p>Once coding part is done Open the terminal and run the wlsserver\server\bin\sh setWLSenc.sh . This will set 
the environment . Web service can be access on browser using sucure and non secure port however artifacts can be 
generated using non secure web access.</p>

<pre class="pres">wsimport -d . -p com.systemlogic -keep http://127.0.0.1:7001/WeblogicSecurity/WeblogicSecurityService?WSDL</pre>

<p>Copy the artifact and paste into the src folder. Also set the class path to weblogic.jar for client project.</p>
<pre class="pres">
public static void main(String[] args) {
	System.setProperty("javax.net.ssl.trustStore", 
	"/media/Harsh/webservice/wls/wlserver_10.3/server/lib/DemoTrust.jks");
	System.setProperty("javax.net.ssl.trustStorePassword", "DemoTrustKeyStorePassPhrase");

	WeblogicSecurityService wss = new WeblogicSecurityService();
	WeblogicSecurity ws = wss.getWeblogicSecurityPort();
	
	System.out.println(" sending ");
	System.out.println(ws.sayHai("Pranshi"));
}</pre>

<p><b>Include weblogic.jar in project classpath from it's server location. DO NOT COPY THE JAR TO PROJECT FOLDER.</b></p>
<p><a href='https://github.com/systemlogic/WeblogicSecurityClient/archive/master.zip'><span>Download Client code</span></a></p>
<p><b>P.S. Host name used in above example is localhost:7001 and https://localhost:7002 for secure protocol.</b></p>
	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>