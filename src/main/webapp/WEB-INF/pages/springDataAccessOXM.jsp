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
            <%@ include file="springDataAccessMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Marshall and Unmarshall</h2>
        	<p>Spring OXM have implementation of Castor-Marshallar, jaxb2-marshaller, jibx-marshaller and xmlbeans-marshaller</p>
        	<h3>Castor-Marshallar</h3>
        	<p>Hope you have already thru with xjc topic, here we will see one simplest example of Marshell using Castor an open source XML binding framework.</p>
        	<pre class="pres">
&lt;beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:oxm="http://www.springframework.org/schema/oxm"
	xsi:schemaLocation="http://www.springframework.org/schema/oxm 
	http://www.springframework.org/schema/oxm/spring-oxm-3.2.xsd
	http://www.springframework.org/schema/beans 
	http://www.springframework.org/schema/beans/spring-beans-3.0.xsd"&gt;

&lt;bean id="CASTOR" class="com.App"&gt;
		&lt;property name="marshaller" ref="castorMarshaller" /&gt;
		&lt;property name="unmarshaller" ref="castorMarshaller" /&gt;
	&lt;/bean&gt;
	&lt;bean id="castorMarshaller" class="org.springframework.oxm.castor.CastorMarshaller"&gt;
	&lt;/bean&gt;

&lt;/beans&gt;</pre>

<h3>Jaxb2Marshaller</h3>
  	<pre class="pres"> 
 &lt;beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:oxm="http://www.springframework.org/schema/oxm"
	xsi:schemaLocation="http://www.springframework.org/schema/oxm 
	http://www.springframework.org/schema/oxm/spring-oxm-3.2.xsd
	http://www.springframework.org/schema/beans 
	http://www.springframework.org/schema/beans/spring-beans-3.0.xsd"&gt;

	&lt;bean id="jaxb2Marshaller" class="org.springframework.oxm.jaxb.Jaxb2Marshaller"&gt;
		&lt;property name="classesToBeBound"&gt;
			&lt;list&gt;
				&lt;value&gt;com.bank.account.Details&lt;/value&gt;
				&lt;value&gt;com.bank.account.ObjectFactory&lt;/value&gt;
			&lt;/list&gt;
		&lt;/property&gt;
		&lt;property name="schema" value="classpath:com/bank/account/Details.xsd" /&gt;
	&lt;/bean&gt;

&lt;/beans&gt;</pre>

<h3>XmlBeansMarshaller</h3>
  	<pre class="pres"> 
 &lt;beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:oxm="http://www.springframework.org/schema/oxm"
	xsi:schemaLocation="http://www.springframework.org/schema/oxm 
	http://www.springframework.org/schema/oxm/spring-oxm-3.2.xsd
	http://www.springframework.org/schema/beans 
	http://www.springframework.org/schema/beans/spring-beans-3.0.xsd"&gt;

&lt;!-- 	&lt;oxm:xmlbeans-marshaller id="xmlBean"/&gt; --&gt;
	
	&lt;bean id="xmlBean2" class="org.springframework.oxm.xmlbeans.XmlBeansMarshaller"&gt;&lt;/bean&gt;
&lt;/beans&gt;</pre>

<h3>jibx-marshaller</h3>
<p>It is almost same, please try yourself.</p>

 <p>To understand the class structure please download the source code from below.</p>
 <p><a href='https://github.com/systemlogic/MarshellUnMarshell/archive/master.zip'><span>Download this Example</span></a></p>
        </td>
        
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>