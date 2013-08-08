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
					file="springExampleMenu.jsp"%></td>
			<td></td>
			<td align="left" bordercolor="c41200">
				<h2>AutoWire</h2>
				<p><b>AutoWire : </b> is the relationship defined in spring framework to collaborate the beans. It Does have different
				mode which is explain in below Examples.</P>
<h2>Autowire by Name</h2>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
	http://www.springframework.org/schema/context
	http://www.springframework.org/schema/context/spring-context-3.0.xsd"&gt;

  &lt;!-- services --&gt;
  	&lt;context:component-scan base-package="com.xml.bean" /&gt;

  &lt;bean id="uidBEAN" class="com.xml.bean.UID" autowire="byName" &gt;
    &lt;property name="uid" value="11002244"/&gt;
    &lt;property name="name" value="Pranshi Dhingra"/&gt;
  &lt;/bean&gt;
  
   &lt;bean id="address" class="com.xml.bean.Address"&gt;  &lt;!-- check the bean id in UID class varaible which is same --&gt;
  	&lt;property name="locality" value="Pawani oakridge"/&gt;
  	&lt;property name="stete" value="Karanataka"/&gt;
  &lt;/bean&gt;
  
  &lt;bean id="officeAddress" class="com.xml.bean.OfficeAddress" &gt;
  	&lt;property name="locality" value="Saranya enclave"/&gt;
  	&lt;property name="stete" value="Karanataka"/&gt;
  &lt;/bean&gt;
&lt;/beans&gt;</pre>
<h2>Autowire by Name</h2>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
	http://www.springframework.org/schema/context
	http://www.springframework.org/schema/context/spring-context-3.0.xsd"&gt;

  &lt;!-- services --&gt;
  	&lt;context:component-scan base-package="com.xml.bean" /&gt;

  &lt;bean id="uidBEAN" class="com.xml.bean.UID"  autowire="byType"&gt;
    &lt;property name="uid" value="11002244"/&gt;
    &lt;property name="name" value="Pranshi Dhingra"/&gt;
  &lt;/bean&gt;
  &lt;bean id="Address" class="com.xml.bean.Address"&gt;
  	&lt;property name="locality" value="Pawani oakridge"/&gt;
  	&lt;property name="stete" value="Karanataka"/&gt;
  &lt;/bean&gt;
  
  &lt;bean id="OfficeAddress" class="com.xml.bean.OfficeAddress" &gt;
  	&lt;property name="locality" value="Saranya enclave"/&gt;
  	&lt;property name="stete" value="Karanataka"/&gt;
  &lt;/bean&gt;
&lt;/beans&gt;</pre>
<h2>Autowire by Constructor</h2>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
	http://www.springframework.org/schema/context
	http://www.springframework.org/schema/context/spring-context-3.0.xsd"&gt;

  &lt;!-- services --&gt;
  	&lt;context:component-scan base-package="com.xml.bean" /&gt;

 &lt;bean id="uidBEAN" class="com.xml.bean.UID" autowire="constructor" &gt; 
    &lt;property name="uid" value="11002244"/&gt;
    &lt;property name="name" value="Pranshi Dhingra"/&gt;
  &lt;/bean&gt;
  &lt;bean id="Address" class="com.xml.bean.Address"&gt;
  	&lt;property name="locality" value="Pawani oakridge"/&gt;
  	&lt;property name="stete" value="Karanataka"/&gt;
  &lt;/bean&gt;
  
  &lt;bean id="OAddress" class="com.xml.bean.OfficeAddress" &gt;
  	&lt;property name="locality" value="Saranya enclave"/&gt;
  	&lt;property name="stete" value="Karanataka"/&gt;
  &lt;/bean&gt;
&lt;/beans&gt;</pre>
<h2>Autowire by default</h2>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
	http://www.springframework.org/schema/context
	http://www.springframework.org/schema/context/spring-context-3.0.xsd"&gt;

  &lt;!-- services --&gt;
  	&lt;context:component-scan base-package="com.xml.bean" /&gt;

 &lt;bean id="uidBEAN" class="com.xml.bean.UID" autowire="no" &gt; &lt;!--  no and default is same --&gt; 
    &lt;property name="uid" value="11002244"/&gt;
    &lt;property name="name" value="Pranshi Dhingra"/&gt;
    &lt;property name="address" ref="Address"/&gt;
	&lt;property name="officeAddress" ref="OAddress"&gt;&lt;/property&gt;
  &lt;/bean&gt;
  &lt;bean id="Address" class="com.xml.bean.Address"&gt;
  	&lt;property name="locality" value="Pawani oakridge"/&gt;
  	&lt;property name="stete" value="Karanataka"/&gt;
  &lt;/bean&gt;
  
  &lt;bean id="OAddress" class="com.xml.bean.OfficeAddress" &gt;
  	&lt;property name="locality" value="Saranya enclave"/&gt;
  	&lt;property name="stete" value="Karanataka"/&gt;
  &lt;/bean&gt;
&lt;/beans&gt;</pre>
<p>There are other way as well to autowire. Download the example and run the Junit test file.
<p><a href='https://github.com/systemlogic/AutoWire/archive/master.zip'><span>Download this Example</span></a></p>
		</td>
				<%@ include file="rightPane.jsp" %>
		</tr>
	</table>
	<%@ include file="FooterLink.jsp"%>
	<%@ include file="Footer.jsp"%>
</body>
</html>