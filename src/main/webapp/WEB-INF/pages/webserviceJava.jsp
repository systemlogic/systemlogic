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
        	<h2>Web service(using Java)</h2>
        	<p>You don't need Axis based project all the time to generate WSDL file. WSDL is the way to know how 
        	client will communicate with the server. However it could happen Sever won't give WSDL exposed on server and 
        	gives only Interface that describes the method on the server and at the same time Server has specified the 
        	URL where web service can be access. This time we will use java interface.</p>
<pre class="pres">
package com.webservice;
public interface Hello{

	public String hi(String str);
	
	public int sum(int a, int b);
}</pre>

<p>Set the class path to following</p>
<pre class="pres">export CLASSPATH="$CLASSPATH:axis-ant.jar:axis.jar:commons-discovery-0.2.jar:commons-logging-1.0.4.jar:
jaxrpc.jar:log4j-1.2.8.jar:saaj.jar:wsdl4j-1.5.1.jar"</pre>
<p>Run the following command to obtain the WSDL file from interface class file.</p>
<pre class="pres">
java org.apache.axis.wsdl.Java2WSDL -o Hello.wsdl -l 
"http://localhost:8080/javaWebService/services/HelloWebservice?wsdl" 
-n "http://systemlogic.com" -p"com.systemlogic.webservice" "http://tns" 
com.webservice.Hello</pre>
<p>A file with Hello.wsdl will be created. Location <b>http://localhost:8080</b> can be replaced with actual interface 
provider host machine. </p>
<p>Generate the client code from WSDL file. Use the following command.</p>
<pre class="pres">java org.apache.axis.wsdl.WSDL2Java -o . -s -S true -Nhttp://mytns mcome2.jp. Hello.wsdl</pre>
<p>Observe the generated code care fully. It will have couple of artifact files and deploy.wsdl . The last step 
would be to deploy the deploy.wsdl file .</p>
<pre class="pres">
java org.apache.axis.client.AdminClient deploy.wsdd          //if host name is localhost:8080
OR
java org.apache.axis.client.AdminClient -l http://HostServerName/axis/servlet/AxisServlet deploy.wsdd</pre>
<p>Now one has to write main method to access the deployed service and method exposed on the URL.</p>
	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>