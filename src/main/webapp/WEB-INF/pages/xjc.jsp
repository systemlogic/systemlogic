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
            <%@ include file="xjcMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>xml and xsd</h2>
        	<p>Now days developers prefer to communicate in form of xml from one layer to another which provide them approtunity to change the implementation 
        	and change in the client technology. Before we proceed let us create one understandable xml.</p>
        	<pre class="pres">
&lt;?xml version="1.0"?&gt;
&lt;Details&gt;
	&lt;person&gt;
		&lt;Name&gt;
		&lt;firstName titile="Mr"&gt;John&lt;/firstName&gt;
		&lt;lastName&gt;Rambo&lt;/lastName&gt;
		&lt;/Name&gt;		
		&lt;contact&gt;		
		&lt;phone mobile="9988776655" office="22334477"&gt;y&lt;/phone&gt;
		&lt;email&gt;harsh.k.arora@gmail.com&lt;/email&gt;
				&lt;/contact&gt;
		&lt;Address&gt;
			&lt;Location door="960"&gt;Anand vihar&lt;/Location&gt;
			&lt;State district="Gurgoan" &gt;Haryana&lt;/State&gt;
			&lt;Country Pin="110095" &gt;India&lt;/Country&gt;
		&lt;/Address&gt;
	&lt;/person&gt;
&lt;accounts&gt;
 &lt;account type="Saving"&gt;
  &lt;balance&gt;149432.99&lt;/balance&gt;
 &lt;/account&gt;
 &lt;account type="Credit"&gt;
  &lt;balance&gt;-34149.99&lt;/balance&gt;
 &lt;/account&gt;
 &lt;account type="Pf"&gt;
  &lt;balance&gt;4149.99&lt;/balance&gt;
 &lt;/account&gt;
&lt;/accounts&gt;
&lt;/Details&gt;        	
</pre>
<p>Good job. Name it account.xml Now we will create xsd file for it. Use some online utility to convert xml to xsd. </p>
<pre class="pres">
&lt;xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema"&gt;
  &lt;xs:element name="Details"&gt;
    &lt;xs:complexType&gt;
      &lt;xs:sequence&gt;
        &lt;xs:element name="person"&gt;
          &lt;xs:complexType&gt;
            &lt;xs:sequence&gt;
              &lt;xs:element name="Name"&gt;
                &lt;xs:complexType&gt;
                  &lt;xs:sequence&gt;
                    &lt;xs:element name="firstName"&gt;
                      &lt;xs:complexType&gt;
                        &lt;xs:simpleContent&gt;
                          &lt;xs:extension base="xs:string"&gt;
                            &lt;xs:attribute type="xs:string" name="titile"/&gt;
                          &lt;/xs:extension&gt;
                        &lt;/xs:simpleContent&gt;
                      &lt;/xs:complexType&gt;
                    &lt;/xs:element&gt;
                    &lt;xs:element type="xs:string" name="lastName"/&gt;
                  &lt;/xs:sequence&gt;
                &lt;/xs:complexType&gt;
              &lt;/xs:element&gt;
              &lt;xs:element name="contact"&gt;
                &lt;xs:complexType&gt;
                  &lt;xs:sequence&gt;
                    &lt;xs:element name="phone"&gt;
                      &lt;xs:complexType&gt;
                        &lt;xs:simpleContent&gt;
                          &lt;xs:extension base="xs:string"&gt;
                            &lt;xs:attribute type="xs:long" name="mobile"/&gt;
                            &lt;xs:attribute type="xs:int" name="office"/&gt;
                          &lt;/xs:extension&gt;
                        &lt;/xs:simpleContent&gt;
                      &lt;/xs:complexType&gt;
                    &lt;/xs:element&gt;
                    &lt;xs:element type="xs:string" name="email"/&gt;
                  &lt;/xs:sequence&gt;
                &lt;/xs:complexType&gt;
              &lt;/xs:element&gt;
              &lt;xs:element name="Address"&gt;
                &lt;xs:complexType&gt;
                  &lt;xs:sequence&gt;
                    &lt;xs:element name="Location"&gt;
                      &lt;xs:complexType&gt;
                        &lt;xs:simpleContent&gt;
                          &lt;xs:extension base="xs:string"&gt;
                            &lt;xs:attribute type="xs:short" name="door"/&gt;
                          &lt;/xs:extension&gt;
                        &lt;/xs:simpleContent&gt;
                      &lt;/xs:complexType&gt;
                    &lt;/xs:element&gt;
                    &lt;xs:element name="State"&gt;
                      &lt;xs:complexType&gt;
                        &lt;xs:simpleContent&gt;
                          &lt;xs:extension base="xs:string"&gt;
                            &lt;xs:attribute type="xs:string" name="district"/&gt;
                          &lt;/xs:extension&gt;
                        &lt;/xs:simpleContent&gt;
                      &lt;/xs:complexType&gt;
                    &lt;/xs:element&gt;
                    &lt;xs:element name="Country"&gt;
                      &lt;xs:complexType&gt;
                        &lt;xs:simpleContent&gt;
                          &lt;xs:extension base="xs:string"&gt;
                            &lt;xs:attribute type="xs:int" name="Pin"/&gt;
                          &lt;/xs:extension&gt;
                        &lt;/xs:simpleContent&gt;
                      &lt;/xs:complexType&gt;
                    &lt;/xs:element&gt;
                  &lt;/xs:sequence&gt;
                &lt;/xs:complexType&gt;
              &lt;/xs:element&gt;
            &lt;/xs:sequence&gt;
          &lt;/xs:complexType&gt;
        &lt;/xs:element&gt;
        &lt;xs:element name="accounts"&gt;
          &lt;xs:complexType&gt;
            &lt;xs:sequence&gt;
              &lt;xs:element name="account" maxOccurs="unbounded" minOccurs="0"&gt;
                &lt;xs:complexType&gt;
                  &lt;xs:sequence&gt;
                    &lt;xs:element type="xs:float" name="balance"/&gt;
                  &lt;/xs:sequence&gt;
                  &lt;xs:attribute type="xs:string" name="type" use="optional"/&gt;
                &lt;/xs:complexType&gt;
              &lt;/xs:element&gt;
            &lt;/xs:sequence&gt;
          &lt;/xs:complexType&gt;
        &lt;/xs:element&gt;
      &lt;/xs:sequence&gt;
    &lt;/xs:complexType&gt;
  &lt;/xs:element&gt;
&lt;/xs:schema&gt;</pre>
<p>Name above file as account.xsd. At this point one will have xsd and respective xml let us write it's classes.</p>
<pre class="pres">
xjc -p com.bank.account -d account.xsd
</pre>
<p>xjc is utility provided by JDK at javac level and it should be in path before executing. So, is this piece of code enough to write the classes? <b>Yes</b>. 
Please dig into the folder, some java classes might be created with proper package structure if no error is thrown. Explore the java class file.</p>

<p><a href='https://github.com/systemlogic/xjc/archive/master.zip'><span>Download this Example</span></a></p>


	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>