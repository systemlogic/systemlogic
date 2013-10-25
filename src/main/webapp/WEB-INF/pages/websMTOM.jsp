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
        	<h2>Message Transmission Optimization Mechanism</h2>
        	<p>MTOM is the W3C Message Transmission Optimization Mechanism, a method of efficiently 
        	sending binary data to and from Web services(Copied from Wiki). To understand it we will take file transfer
        	program using and without using MTOM.</p>
        	<p>File upload using MTOM</p>
        	
<pre class="pres">
@WebService(name="MTOMfileUploadService" ,targetNamespace="MTOMfileupload.com" , portName="MTOMfileuploadPort")
@MTOM
public class FileUploadMTOM {
	@WebMethod
	public void uploadMTOMWay(@XmlMimeType("application/octet-stream") DataHandler dh) {
		DataSource ds = dh.getDataSource();
		try{
		InputStream is = ds.getInputStream();
		FileOutputStream fos = new FileOutputStream("/home/arorah1/File.txt");
		int data = 0;
		while((data=is.read())!=-1) fos.write(data);
		fos.close();
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
}
</pre>

<p>File upload without using MTOM</p>
<pre class="pres">
@WebService(name="fileUploadService" ,targetNamespace="fileupload.com" , portName="fileuploadPort")
public class FileUpload {

	@WebMethod
	public void upload(DataHandler dh) {
		DataSource ds = dh.getDataSource();
		try{
		InputStream is = ds.getInputStream();
		FileOutputStream fos = new FileOutputStream("/home/arorah1/File.txt");
		int data = 0;
		while((data=is.read())!=-1) fos.write(data);
		fos.close();
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
}</pre>

<p>And entries for the same need to place in web.xml and sun-jaxws.xml file. Observer these two file carefully. In this 
web.xml is refering to WSServletContextListener servlet. Entry in web.xml is</p>
<pre class="pres">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://java.sun.com/xml/ns/j2ee" 
xmlns:javaee="http://java.sun.com/xml/ns/javaee" xmlns:web="http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd" 
xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd" 
version="2.4"&gt;
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
    &lt;url-pattern&gt;/fileUpload&lt;/url-pattern&gt;
  &lt;/servlet-mapping&gt;
  &lt;servlet-mapping&gt;
    &lt;servlet-name&gt;fromjava&lt;/servlet-name&gt;
    &lt;url-pattern&gt;/MTOMfileUpload&lt;/url-pattern&gt;
  &lt;/servlet-mapping&gt;
  &lt;session-config&gt;
    &lt;session-timeout&gt;60&lt;/session-timeout&gt;
  &lt;/session-config&gt;
&lt;/web-app&gt;</pre>
  
<p>and sun-jaxws.xml will be</p>
<pre class="pres">
&lt;endpoints xmlns='http://java.sun.com/xml/ns/jax-ws/ri/runtime' version='2.0'&gt;
    &lt;endpoint
        name='fileUploadpoint'
        implementation='com.fileupload.FileUpload'
        url-pattern='/fileUpload'/&gt;
        &lt;endpoint
        name='fileUploadpoint'
        implementation='com.MTOMfileupload.FileUploadMTOM'
        url-pattern='/MTOMfileUpload'/&gt;
       
&lt;/endpoints&gt;</pre>

<p><a href='https://github.com/systemlogic/MTOM/archive/master.zip'><span>Download Server code</span></a></p>
<p>Once you are able to see the WSDL on browser, client code can be generated using wsimport command</p>
<pre class="pres">wsimport -d . -p com.systemlogic -keep http://localhost:8090/MTOM/fileUpload?wsdl
wsimport -d . -p com.systemlogic -keep http://localhost:8090/MTOM/MTOMfileUpload?wsdl

</pre>
<p>Client code OR artifact can be copied and placed it in the src folder of client project.</p>
<p>Client program using MTOM.</p>
<pre class="pres">
public static void main( String[] args ){
 	System.out.println("Please select file of size 500MB");
	MTOMFeature featue = new MTOMFeature();
	FileUploadMTOMService fums = new FileUploadMTOMService();
	MTOMfileUploadService momfus= fums.getMTOMfileuploadPort(featue);
	
	Map<String, Object> ctxt = ((BindingProvider)momfus).getRequestContext();
	ctxt.put("size",1023);
	
	File f = new File("/media/Harsh/VMware-Player-4.0.0-471780.x86_64.bundle");
	FileDataSource fds = new FileDataSource(f);
	DataHandler dh = new DataHandler(fds);
	 momfus.uploadMTOMWay(dh);
	//byte[] data = new byte[(int)f.length()];
}</pre>
	    
<p>Client program without using MTOM.</p>
<pre class="pres">
public static void main(String[] args) throws Exception{
	// TODO Auto-generated method stub
	System.out.println("Please select file of size 500MB");
	File f = new File("/media/Harsh/VMware-Player-4.0.0-471780.x86_64.bundle");
	byte[] data = new byte[(int)f.length()];
	FileInputStream fis = new FileInputStream(f);
	fis.read(data);
	FileUploadService_Service fuss = new FileUploadService_Service();
	FileUploadService fus = fuss.getFileuploadPort();
	fus.upload(data);
	
}</pre>	    

<p><a href='https://github.com/systemlogic/MTOMClient/archive/master.zip'><span>Download Client code</span></a></p>
<p><b>P.S. Host name used in above example is localhost:8090.</b>
<b>P.S.S. Try both file upload utility with same file with file size > 100MB</b></p>



	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>