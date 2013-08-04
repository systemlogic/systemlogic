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
            <%@ include file="ioserializationMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Console</h2>
        	<p>So far we have seen program flow with hardcoded values. What if there is requirement user to input value thru console?</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
import java.util.Scanner;
public class consoleTest {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Enter first number");
		Scanner in = new Scanner(System.in);
		float f1 = Float.parseFloat(in.next());
		System.out.println("Enter second number");
		in = new Scanner(System.in);
		float f2 = Float.parseFloat(in.next());
		System.out.println("Result sum=" + (f1+f2));
	}
}</pre>
<p>There are many way to read the input from console. Depending upon the requirement console input can be type cast to some appropriate. There is also Console class which 
take care of username and password(showing **) input.</p>
<p>Let us see one more program to see Username and password utility.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
import java.io.Console;
public class loginUtilty {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Console c = System.console();
		char[] pw;
		String usr;
		String pwd="";
		usr = c.readLine("%s", "usr: ");
		pw = c.readPassword("%s", "pwd: ");
		for(char ch: pw)
			pwd += ch ;
		c.format("\n");
		if(usr.equals("user") && pwd.equals("pwd")){
			System.out.println("Login successful");
		}else{
			System.out.println("Login failed expected user/password is user pwd");
		}
	}
}
</pre>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>