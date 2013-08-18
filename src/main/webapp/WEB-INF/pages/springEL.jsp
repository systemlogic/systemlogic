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
					file="springCoreContainerMenu.jsp"%></td>
			<td></td>
			<td align="left" bordercolor="c41200">
						<h2>Spring Expression Language (SpEL)</h2>
				<p>
					<b>Spring Expression Language (SpEL) : </b> The Spring Expression Language (SpEL for short) is a 
					powerful expression language that supports querying and manipulating an object graph at runtime.</p>
<p>Bean That going to use in xml based Expression Language  and reference bean.
<pre class="pres">
package com.bean;

public class Address {
	Integer DoorNumber;
	String SocityName;
	String Locality;
	String District;
	String State;
	Integer Pin;
	Address(){
		
	}
	public Address(int dn, String sn, String lo, String di, String st, int pi){
		this.DoorNumber = dn;
		this.SocityName = sn;
		this.Locality = lo;
		this.District = di;
		this.State = st;
		this.Pin = pi;
	}
	public Integer getDoorNumber() {
		return DoorNumber;
	}
	public void setDoorNumber(Integer doorNumber) {
		DoorNumber = doorNumber;
	}
	public String getSocityName() {
		return SocityName;
	}
	public void setSocityName(String socityName) {
		SocityName = socityName;
	}
	public String getLocality() {
		return Locality;
	}
	public void setLocality(String locality) {
		Locality = locality;
	}
	public String getDistrict() {
		return District;
	}
	public void setDistrict(String district) {
		District = district;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public Integer getPin() {
		return Pin;
	}
	public void setPin(Integer pin) {
		Pin = pin;
	}
	public String toString(){
		return "Address-\nDoor# "+ this.getDoorNumber() +
				"\nSociety " + this.getSocityName()+
				"\nLocality " + this.getLocality()+
				"\nDistrict " + this.getDistrict()+
				"\nState " + this.getState()+
				"\nPin# "+ this.getPin();
				
	}
}</pre>
<p>Bean that going to be us with Annotation Expression Language.</p>
<pre class="pres">
package com.bean;

import org.springframework.stereotype.Component;

@Component("OfficeBean")
public class OfficeAddress {
	Integer DoorNumber;
	String SocityName;
	String Locality;
	String District;
	String State;
	Integer Pin;
	OfficeAddress(){
		this.DoorNumber = 600;
		this.SocityName = "Pavani";
		this.Locality = "Indira Nagar";
		this.District = "Bombay";
		this.State = "Maharashtra";
		this.Pin = 220033;
	}
	public OfficeAddress(int dn, String sn, String lo, String di, String st, int pi){
		
	}
	public Integer getDoorNumber() {
		return DoorNumber;
	}
	public void setDoorNumber(Integer doorNumber) {
		DoorNumber = doorNumber;
	}
	public String getSocityName() {
		return SocityName;
	}
	public void setSocityName(String socityName) {
		SocityName = socityName;
	}
	public String getLocality() {
		return Locality;
	}
	public void setLocality(String locality) {
		Locality = locality;
	}
	public String getDistrict() {
		return District;
	}
	public void setDistrict(String district) {
		District = district;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public Integer getPin() {
		return Pin;
	}
	public void setPin(Integer pin) {
		Pin = pin;
	}
	public String toString(){
		return "Address-\nDoor# "+ this.getDoorNumber() +
				"\nSociety " + this.getSocityName()+
				"\nLocality " + this.getLocality()+
				"\nDistrict " + this.getDistrict()+
				"\nState " + this.getState()+
				"\nPin# "+ this.getPin();
				
	}
}</pre>

<p>UID Bean which will server for both.</p>
<pre class="pres">
package com.bean;

import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
@Component("uidBean")
public class UID {
	Double uid;
	String firstName;
	String lastName;
	Date dob;
	Address address;
	
	@Value("#{OfficeBean}")
	OfficeAddress OfficeAddress;
	
	public OfficeAddress getOfficeAddress() {
		return OfficeAddress;
	}
	public void setOfficeAddress(OfficeAddress officeAddress) {
		this.OfficeAddress = officeAddress;
	}
	public Double getUid() {
		return uid;
	}
	public void setUid(Double uid) {
		this.uid = uid;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}

	
}</pre>

<pre class="pres">
&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
	http://www.springframework.org/schema/context
	http://www.springframework.org/schema/context/spring-context-3.0.xsd"&gt;

	&lt;context:component-scan base-package="com.bean" /&gt;
	&lt;!-- services --&gt;

	&lt;bean id="xmlUID" class="com.bean.UID"&gt;
		&lt;property name="firstName" value="Ananya" /&gt;
		&lt;property name="lastName" value="Dhingra" /&gt;
		&lt;property name="dob" value="#{date}" /&gt;
		&lt;property name="address" value="#{xmlAddress}" /&gt;
		&lt;property name="uid" value="1212143" /&gt;
	&lt;/bean&gt;

	&lt;bean name="xmlAddress" class="com.bean.Address"&gt;
		&lt;property name="doorNumber" value="100" /&gt;
		&lt;property name="socityName" value="Jal Vayu Vihar" /&gt;
		&lt;property name="locality" value="Noida" /&gt;
		&lt;property name="district" value="Gautam Budha Nagar" /&gt;
		&lt;property name="state" value="Uttar Pradesh" /&gt;
		&lt;property name="pin" value="124002" /&gt;
	&lt;/bean&gt;
	&lt;bean name="date" class="java.util.Date"&gt;
		&lt;property name="year" value="#{2011 -1900}" /&gt;
		&lt;property name="month" value="10" /&gt;
		&lt;property name="date" value="15" /&gt;
	&lt;/bean&gt;

	&lt;bean id="xmlUIDTest-2" class="com.bean.UID"&gt;
		&lt;property name="firstName" value="Ananya" /&gt;
		&lt;property name="lastName" value="Dhingra" /&gt;
		&lt;property name="dob" ref="date-2" /&gt;
		&lt;property name="address" ref="xmlAddressTest-2" /&gt;
		&lt;property name="uid" value="1212143" /&gt;
	&lt;/bean&gt;

	&lt;bean name="xmlAddressTest-2" class="com.bean.Address"&gt;
		&lt;property name="doorNumber" value="200" /&gt;
		&lt;property name="socityName" value="Vayu Jal Vihar" /&gt;
		&lt;property name="locality" value="Greater Noida" /&gt;
		&lt;property name="district" value="Gautam Budha Nagar" /&gt;
		&lt;property name="state" value="Uttar Pradesh" /&gt;
		&lt;property name="pin" value="124020" /&gt;
	&lt;/bean&gt;
	&lt;!-- more bean definitions for services go here --&gt;
	&lt;bean name="date-2" class="java.util.Date"&gt;
		&lt;property name="year" value="#{2011 -1900}" /&gt;
		&lt;property name="month" value="10" /&gt;
		&lt;property name="date" value="15" /&gt;
	&lt;/bean&gt;



&lt;/beans&gt;</pre>

<p>SpringTest will explain Expression Language for basic type and complex type.</p>
<pre class="pres">
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.expression.Expression;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;

import com.bean.Address;
import com.bean.UID;

public class SpELTest {

	public static void main(String[] args) {
		ExpressionParser parser = new SpelExpressionParser();
		Expression expHello = parser.parseExpression("'Hello World'");
		System.out.println("Literal Example= " +(String) expHello.getValue());

		Expression expSubString = parser.parseExpression("'Hello World'.substring(4, 7)");
		System.out.println("Literal SubString Example= " +(String) expSubString.getValue());

		Expression expBooExpression = parser.parseExpression("'Hello'.equals('World')");
		System.out.println("Relational Example= " +expBooExpression.getValue());

		UID uid = new UID();
		uid.setFirstName("Pranshi");
		uid.setLastName("Dhingra");
		uid.setDob(new Date(2011 -1900, 10, 03)); // 1900 is for date adjustment
		System.out.println(uid.getDob());
		Address personAddress = new Address(947, "Pavani Enclave", "Marathahalli", 
		"Bangalore", "Karnataka", 560037);
		StandardEvaluationContext uidContext = new StandardEvaluationContext(uid);
		parser.parseExpression("address").setValue(uidContext, personAddress);
		System.out.println("Assignment Test =" + uid.getAddress()); // equal to uid.setAddress( personAddress);
		uidContext.setVariable("newDOB", new Date(2011 -1900,10,15));
		uidContext.setVariable("randomUID", Math.ceil((Math.random()*100000)));
		parser.parseExpression("dob = #newDOB").getValue(uidContext);
		parser.parseExpression("uid = #randomUID").getValue(uidContext);
		System.out.println(uid.getDob());
		
		ApplicationContext context =
			    new ClassPathXmlApplicationContext(new String[] {"services.xml"});
			UID uidBean = (UID)context.getBean("xmlUID");
			System.out.println(uidBean.getDob());
			
			System.out.println("Expression Language Test = " + uidBean.getAddress());
			uidBean = (UID)context.getBean("xmlUIDTest-2");
			System.out.println("xmlUIDTest-2 Ref Test = " + uidBean.getAddress());
			
			uidBean = (UID)context.getBean("uidBean");
			System.out.println("Office Address be Annotation Test = " + uidBean.getOfficeAddress());
		
	}

}</pre>

				<p><a href='https://github.com/systemlogic/SpEL/archive/master.zip'><span>Download this Example</span></a></p>
			</td>
			<%@ include file="rightPane.jsp" %>
		</tr>
	</table>
	<%@ include file="FooterLink.jsp"%>
	<%@ include file="Footer.jsp"%>
</body>
</html>