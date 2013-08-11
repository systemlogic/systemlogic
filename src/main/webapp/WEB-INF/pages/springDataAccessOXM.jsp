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
        	<p>Hope you have already thru with xjc topic, here we will see one simplest example of Marshell using Castor open source XML binding framework.</p>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:oxm="http://www.springframework.org/schema/oxm"
	xsi:schemaLocation="http://www.springframework.org/schema/oxm 
	http://www.springframework.org/schema/oxm/spring-oxm-3.2.xsd
	http://www.springframework.org/schema/beans 
	http://www.springframework.org/schema/beans/spring-beans-3.0.xsd"&gt;

	&lt;!-- services --&gt;

	&lt;bean id="XML" class="com.App"&gt;
		&lt;property name="marshaller" ref="castorMarshaller" /&gt;
		&lt;property name="unmarshaller" ref="castorMarshaller" /&gt;
	&lt;/bean&gt;
	&lt;bean id="castorMarshaller" class="org.springframework.oxm.castor.CastorMarshaller" /&gt;

&lt;/beans&gt;</pre>

<p>Place where marshalling and unmarshalling will happen</p>
  	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;"> 
 package com;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Vector;

import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.oxm.Marshaller;
import org.springframework.oxm.Unmarshaller;

import com.bean.ClientData;
import com.bean.Item;
import com.bean.MyOrder;
public class App {
	private static final String FILE_NAME = "order.xml";
    private MyOrder settings = new MyOrder();
    private Marshaller marshaller;
    private Unmarshaller unmarshaller;

    public void setMarshaller(Marshaller marshaller) {
        this.marshaller = marshaller;
    }

    public void setUnmarshaller(Unmarshaller unmarshaller) {
        this.unmarshaller = unmarshaller;
    }

    public void saveSettings() throws IOException {
        FileOutputStream os = null;
        try {
            os = new FileOutputStream(FILE_NAME);
            this.marshaller.marshal(settings, new StreamResult(os));
        } finally {
            if (os != null) {
                os.close();
            }
        }
    }

    public MyOrder loadSettings() throws IOException {
        FileInputStream is = null;
        try {
            is = new FileInputStream(FILE_NAME);
            this.settings = (MyOrder) this.unmarshaller.unmarshal(new StreamSource(is));
            return this.settings;
        } finally {
            if (is != null) {
                is.close();
            }
        }
    }

    public static void main(String[] args) throws IOException {
        ApplicationContext appContext =
            new ClassPathXmlApplicationContext("services.xml");
        App application = (App) appContext.getBean("XML");
        application.settings.setTotal(100);
        application.settings.setReference("hello");
        ClientData client = new ClientData();
        client.setName("Pranshi Dhingra");
        client.setAddress("Bangalore");
        application.settings.setClientData(client);
        Vector&lt;Item&gt; items = new Vector&lt;Item&gt;();
        Item item = new Item();
        item._description = "Bread";
        item._quantity = 1 ;
        item._reference = "ITEM_CODE-209";
        item._unitPrice = 29;
        items.add(item);
        item = new Item();
        item._description = "Milk";
        item._quantity = 2 ;
        item._reference = "ITEM_CODE-293";
        item._unitPrice = 16;
        items.add(item);
        application.settings.setItemsList(items);
        application.settings.getTotal();
        System.out.println(application.settings.getTotalPrice());
        application.saveSettings();
        MyOrder order = application.loadSettings();
        System.out.println(order.getTotal());
    }
}
 </pre>
 <p>To understand the class structure please download the source code from below.</p>
 <p><a href='https://github.com/systemlogic/MarshellUnMarshell.git'><span>Download this Example</span></a></p>
        </td>
        
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>