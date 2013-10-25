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
        	<h2>Asynchronous Webservice</h2>
        	<p>When you execute something synchronously, you wait for it to finish before moving on to another task. 
        	When you execute something asynchronously, you can move on to another task before it finishes. Let us see 
        	one such example. To understand run the server and client code in debug mode.</p>
<pre class="pres">
package com.systemlogic;

import javax.jws.WebService;

@WebService
public class Async {

	public int asyncAdd(int a,int b){
		
		try{
			Thread.sleep(5000);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		System.out.println("Thread was put on sleep for client program to proceed. ");
		return a+b;
	}
}</pre>

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
    &lt;url-pattern&gt;/async&lt;/url-pattern&gt;
  &lt;/servlet-mapping&gt;
  &lt;session-config&gt;/Hello
    &lt;session-timeout&gt;60&lt;/session-timeout&gt;
  &lt;/session-config&gt;
&lt;/web-app&gt;</pre>
  
<p>and sun-jaxws.xml will be</p>
<pre class="pres">&lt;endpoints xmlns='http://java.sun.com/xml/ns/jax-ws/ri/runtime' version='2.0'&gt;
    &lt;endpoint
        name='hellopoint'
        implementation='com.systemlogic.Async'
        url-pattern='/async'/&gt;
&lt;/endpoints&gt;</pre>

<p><a href='https://github.com/systemlogic/Async/archive/master.zip'><span>Download Server code</span></a></p>
<p>Once you are able to see the WSDL on browser, client code can be generated using wsimport command</p>
<pre class="pres">wsimport -d . -b custom-client.xml -keep http://localhost:8090/Async/async?wsdl</pre>
Where custom-client.xml is
<pre class="pres">
&lt;?xml version="1.0" encoding="UTF-8" standalone="yes"?&gt;

&lt;bindings 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
    wsdlLocation="<b>http://localhost:8090/Async/async?wsdl</b>"
    xmlns="http://java.sun.com/xml/ns/jaxws"&gt;    
    &lt;bindings node="wsdl:definitions"&gt;
        &lt;enableAsyncMapping&gt;true&lt;/enableAsyncMapping&gt;
    &lt;/bindings&gt;    
&lt;/bindings&gt;</pre>
<p>Client code OR artifact can be found in com.systemlogic folder. Copy the whole com folder and placed it in the 
src folder of client project. </p>
<p>There are two variant of client code.</p>
<pre class="pres">
public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		AsyncService as = new AsyncService();
		Async async = as.getAsyncPort();
		Response<AsyncAddResponse> response = async.asyncAddAsync(10, 20);
		AsyncAddResponse asyncResponse = response.get();
		System.out.println(asyncResponse.getReturn());
}</pre>

<p>And other one requires Handler.</p>
<pre class="pres">
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import com.handler.MyHandler;
import com.systemlogic.Async;
import com.systemlogic.AsyncService;
import javax.xml.ws.AsyncHandler;
import javax.xml.ws.Response;
import com.systemlogic.AsyncAddResponse;

public class MyHandler implements AsyncHandler&lt;AsyncAddResponse&gt;{
	private AsyncAddResponse output;
	public AsyncAddResponse getResponse(){
		return output;
	}
	public void handleResponse(Response&lt;AsyncAddResponse&gt; res) {
		// TODO Auto-generated method stub
		try{
			output = res.get();
			}catch (Exception e) {
				// TODO: handle exception
			}
	}

}
class MyRunnable implements Runnable{

	public void run() {
		// TODO Auto-generated method stub
		AsyncService as = new AsyncService();
		Async async = as.getAsyncPort();

		MyHandler handler = new MyHandler();
		Future resp = async.asyncAddAsync(10, 20,handler);
		try{
		//resp.get(2L, TimeUnit.SECONDS);  //Server Timer &gt; Client Timer
		resp.get(7L, TimeUnit.SECONDS);    //Server Timer &lt; Client Timer
		}catch(Exception e){
			
		}
		int result = handler.getResponse().getReturn();
		System.out.println("Summation of 10+20=" +result);
	}
}

public class AsyncHandler {
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Thread thread = new Thread(new MyRunnable());
		thread.start();
		System.out.println("Main Thread done with its execution");
	}
}</pre>

<p><a href='https://github.com/systemlogic/AsyncClient/archive/master.zip'><span>Download Client code</span></a></p>
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