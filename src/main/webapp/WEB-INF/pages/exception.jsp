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
            <%@ include file="exceptionNerrorMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Exception</h2>
        	<p>Java has categorized Exception in Checked and Unchecked. RuntimeException and all it's subclass are fall in Unchecked Exception where all other
        	subclass are categorized as Checked Exception.</p>
        	<p>Why use of some of library function complains Checked Exception. Let us simulate one such scenario.</p>
        		<h3>MyException.java</h3>
        	<pre class="pres">
public class MyException {
	public static void main(String[] args) {
		LibraryClass imp = new LibraryClass();
		imp.printing();
	}
}
class testException extends Exception{
	testException(){
	}
	testException(String s){
		super(s);
	}
}

class LibraryClass{
	public void printing() throws testException{
		System.out.println("In LibraryClass");
	}
}</pre>
		<p>Above code will throw Checked Exception, try to fix it using try/catch block or throws statement.</p>
        	
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>