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
        	<h2>Web service</h2>
        	<p>Any request that can be serve over the web using http and SOAP protocol. There are few terms need 
        	to know 1).Provider :  One who create service (Service Provider). 2). Consumer :  One who consume 
        	the servie (Consumer)</p>
        	<p>Let us understand it with some example.</p>
<pre class="pres">
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
<p>Is that all? Yes. Now let us place it at appropriate place. The above code need to save as <b>Hello.jws</b> under 
webapp folder of axis type web project. Axis web project can be downloaded from axis.apache.com project OR 
simply download the attached code.
</p>  
<p><a href='https://github.com/systemlogic/FirstWebservice/archive/master.zip'><span>Download Server code</span></a></p>      	
<p>check the URL wheather you are able to see WSDL file on web browser. Navigate to http://localhost:8090/FirstWebservice/Hello.jws?wsdl 
and could be able to see xml like shown below.</p>
<pre class="pres">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;wsdl:definitions targetNamespace="http://localhost:8090/FirstWebservice/Hello.jws" 
xmlns:apachesoap="http://xml.apache.org/xml-soap" 
xmlns:impl="http://localhost:8090/FirstWebservice/Hello.jws" 
xmlns:intf="http://localhost:8090/FirstWebservice/Hello.jws" 
xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" 
xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" 
xmlns:wsdlsoap="http://schemas.xmlsoap.org/wsdl/soap/" 
xmlns:xsd="http://www.w3.org/2001/XMLSchema"&gt;
&lt;!--WSDL created by Apache Axis version: 1.4
Built on Apr 22, 2006 (06:55:48 PDT)--&gt;

   &lt;wsdl:message name="sumResponse"&gt;

      &lt;wsdl:part name="sumReturn" type="xsd:int"/&gt;

   &lt;/wsdl:message&gt;

   &lt;wsdl:message name="hiResponse"&gt;

      &lt;wsdl:part name="hiReturn" type="xsd:string"/&gt;

   &lt;/wsdl:message&gt;

   &lt;wsdl:message name="hiRequest"&gt;

      &lt;wsdl:part name="str" type="xsd:string"/&gt;

   &lt;/wsdl:message&gt;

   &lt;wsdl:message name="sumRequest"&gt;

      &lt;wsdl:part name="a" type="xsd:int"/&gt;

      &lt;wsdl:part name="b" type="xsd:int"/&gt;

   &lt;/wsdl:message&gt;

   &lt;wsdl:portType name="Hello"&gt;

      &lt;wsdl:operation name="hi" parameterOrder="str"&gt;

         &lt;wsdl:input message="impl:hiRequest" name="hiRequest"/&gt;

         &lt;wsdl:output message="impl:hiResponse" name="hiResponse"/&gt;

      &lt;/wsdl:operation&gt;

      &lt;wsdl:operation name="sum" parameterOrder="a b"&gt;

         &lt;wsdl:input message="impl:sumRequest" name="sumRequest"/&gt;

         &lt;wsdl:output message="impl:sumResponse" name="sumResponse"/&gt;

      &lt;/wsdl:operation&gt;

   &lt;/wsdl:portType&gt;

   &lt;wsdl:binding name="HelloSoapBinding" type="impl:Hello"&gt;

      &lt;wsdlsoap:binding style="rpc" transport="http://schemas.xmlsoap.org/soap/http"/&gt;

      &lt;wsdl:operation name="hi"&gt;

         &lt;wsdlsoap:operation soapAction=""/&gt;

         &lt;wsdl:input name="hiRequest"&gt;

            &lt;wsdlsoap:body encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" 
            namespace="http://DefaultNamespace" use="encoded"/&gt;

         &lt;/wsdl:input&gt;

         &lt;wsdl:output name="hiResponse"&gt;

            &lt;wsdlsoap:body encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" 
            namespace="http://localhost:8090/FirstWebservice/Hello.jws" use="encoded"/&gt;

         &lt;/wsdl:output&gt;

      &lt;/wsdl:operation&gt;

      &lt;wsdl:operation name="sum"&gt;

         &lt;wsdlsoap:operation soapAction=""/&gt;

         &lt;wsdl:input name="sumRequest"&gt;

            &lt;wsdlsoap:body encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" 
            namespace="http://DefaultNamespace" use="encoded"/&gt;

         &lt;/wsdl:input&gt;

         &lt;wsdl:output name="sumResponse"&gt;

            &lt;wsdlsoap:body encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" 
            namespace="http://localhost:8090/FirstWebservice/Hello.jws" use="encoded"/&gt;

         &lt;/wsdl:output&gt;

      &lt;/wsdl:operation&gt;

   &lt;/wsdl:binding&gt;

   &lt;wsdl:service name="HelloService"&gt;

      &lt;wsdl:port binding="impl:HelloSoapBinding" name="Hello"&gt;

         &lt;wsdlsoap:address location="http://localhost:8090/FirstWebservice/Hello.jws"/&gt;

      &lt;/wsdl:port&gt;

   &lt;/wsdl:service&gt;

&lt;/wsdl:definitions&gt;</pre>

<p>But that's not all what about client code. Save the WSDL file say <B>Hello.wsdl</B> on filesystem and set the following jars into 
classpath axis-ant.jar, axis.jar, commons-discovery-0.2.jar, commons-logging-1.0.4.jar, jaxrpc.jar, 
log4j-1.2.8.jar, saaj.jar, wsdl4j-1.5.1.jar. Classpath could be something like below.</p>
<pre class="pres">
export CLASSPATH="$CLASSPATH:axis-ant.jar:axis.jar:commons-discovery-0.2.jar:commons-logging-1.0.4.jar:
jaxrpc.jar:log4j-1.2.8.jar:saaj.jar:wsdl4j-1.5.1.jar"</pre>
<p>Now let us create client code</p>
<pre class="pres">
java  org.apache.axis.wsdl.WSDL2Java -p com.webservice Hello.wsdl</pre>
<p>Above command generate client code that sends request to server, before that we need something extra, copy the 
code to the project folder and invoke client code using below.</p>
<pre class="pres">
import localhost.FirstWebservice.Hello_jws.Hello;
import localhost.FirstWebservice.Hello_jws.HelloService;
import localhost.FirstWebservice.Hello_jws.HelloServiceLocator;

public class client {

	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		HelloServiceLocator hsl = new HelloServiceLocator();
		Hello hello = hsl.getHello();
		String str = hello.hi("Sonia");
		int a = 10;
		int b = 15;
		int sum = hello.sum(a, b);
		System.out.println("Sum of a + b = " + sum);
	}

}</pre>

<p><a href='https://github.com/systemlogic/FirstWebserviceClient/archive/master.zip'><span>Download Client code</span></a></p>



	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>