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
        	<h2>Unmarshell</h2>
        	<p>Until now we have xml that contains the data, xsd which is defining xml structure and Classes which are created using xsd. In actual big suite of xml is used to communicate.
        	Let us work on real time scenario. Banker may fire the query for account holder and its account balance and got the result in xml that we are going to parse.</p>
<pre class="pres">
import java.io.File;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

public class xjcTest {
	public static void main(String[] args) {
		try {
			File file = new File("/home/arorah1/xsd/bbc/account.xml");
			JAXBContext jaxbContext = JAXBContext.newInstance(com.bank.account.Details.class);
	 
			Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
			com.bank.account.Details customer = (com.bank.account.Details) jaxbUnmarshaller.unmarshal(file);
			System.out.println("Name=" + customer.getPerson().getName().getFirstName().getTitile() + " " +
			customer.getPerson().getName().getFirstName().getValue());
			System.out.println("Account Type=" +customer.getAccounts().getAccount().get(0).getType() + 
			"Balance=" + customer.getAccounts().getAccount().get(0).getBalance());
	 
		  } catch (JAXBException e) {
			e.printStackTrace();
		  }
	}
}</pre>
<p>Before you right above code make sure classes that has been generated using xjc at proper path and account.xml file at proper place.</p>
	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>