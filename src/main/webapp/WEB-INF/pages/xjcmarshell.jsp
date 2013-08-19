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
        	<h2>Marshell</h2>
        	<p>You have values/Object and you want data in xml format to communicate with server. In such case one has to set all variables to desired values.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
package xjc;

import java.io.FileOutputStream;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.Marshaller;

import com.bank.account.Details;
import com.bank.account.ObjectFactory;

public class xjcMarshell {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		Details details = new Details();
		Details.Person person = new Details.Person();
		Details.Person.Name name = new Details.Person.Name();
		Details.Person.Name.FirstName fname = new Details.Person.Name.FirstName();

		Details.Person.Address address = new Details.Person.Address();
		Details.Person.Address.Location location = new Details.Person.Address.Location();
		Details.Person.Address.State state = new Details.Person.Address.State();
		Details.Person.Address.Country country = new Details.Person.Address.Country();

		Details.Person.Contact contact = new Details.Person.Contact();
		Details.Person.Contact.Phone phone = new Details.Person.Contact.Phone();
		contact.setEmail("anjlina.jolly@gmail.com");
		phone.setMobile(9898121200L);
		phone.setOffice(22447755);
		phone.setValue("y");
		contact.setPhone(phone);

		fname.setTitile("Ms");fname.setValue("Anjlina");
		name.setLastName("Joly");name.setFirstName(fname);


		location.setDoor(new Short("23"));location.setValue("south Avenue");
		state.setDistrict("LA");state.setValue("MA");
		country.setPin(110022);country.setValue("USA");
		address.setState(state);
		address.setLocation(location);
		address.setCountry(country);

		person.setName(name);
		person.setAddress(address);
		person.setContact(contact);


		List<Details.Accounts> accountList = new ArrayList<Details.Accounts>();
		Details.Accounts accounts = new Details.Accounts ();
		Details.Accounts.Account acc = new Details.Accounts.Account(); 
		
		acc.setType("Credit");
		acc.setBalance(-2000000);
		accounts.getAccount().add(acc);
		acc.setType("PF");
		acc.setBalance(25353453);
		accounts.getAccount().add(acc);
		
		details.setPerson(person);
		details.setAccounts(accounts);

		JAXBContext jc = JAXBContext.newInstance(Details.class);
		Marshaller marshaller = jc.createMarshaller();
		marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		marshaller.marshal(details,  new FileOutputStream("/home/arorah1/output.xml"));
	}

}
</pre>
<p>Before you right above code make sure classes that has been generated using xjc at proper path. Go to the location that has been specified in FileOutputStream 
and check whether file has been created or not. Is in it a magic to create full xml using last four line of code? </p>
	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>