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
        	<h2>Throwable </h2>
        	<p>The Throwable is the superclass of Error and Exception in the Java language. Only objects that are instances of 
        	this class (or one of its subclasses) are thrown by the Java Virtual Machine or can be thrown by the Java throw statement. 
        	Similarly, only this class or one of its subclasses can be the argument type in a catch clause.</p>
        		<p>Let us understand by example to see what can be thrown and catch and what is the significance of Error and Exception.</p>
        	<h3>MyThrowable.java</h3>
        	<pre class="pres">
package excep;
public class MyThrowable extends Throwable {
	private static final long serialVersionUID = -3076788776543246285L;
	MyThrowable(String s){
		super(s);
	}
}</pre>
<h3>MyClass.java</h3>
        	<pre class="pres">
package excep;
public class MyClass {
	public void printingThrowable() throws MyThrowable{
		System.out.println("Priniting Throwable Data");
	}
	public void printingNonThrowable() {
		System.out.println("Priniting Non Throwable Data");
	}
}
</pre>

<h3>ThrowableTest.java</h3>
        	<pre class="pres">
package excep;

public class ThrowableTest {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
			MyClass obj = new MyClass();
			//obj.printingThrowable(); 
			obj.printingNonThrowable(); 
			try{
				obj.printingThrowable();
			}catch(MyThrowable t){
				t.getMessage();
			}
	}

}</pre>
      <p>obj.printingThrowable();   When uncommented it says compile time check 
      and won't let code to compile. The above line of code complains because we 
      already said printingThrowable() method could throw MyThrowable object 
      which need to be handle using try/catch block or throws statement in method 
      signature. In short if  it is not handle it will pass control to next method 
      in stack until call reaches to appropriate try/catch or system thread.</p>
	  <p>obj.printingNonThrowable(); This code won't complain since we are not telling compiler this could throw anything.</p>
	  
	  <p>At this point we don't have any code which can throw MyThrowable object. Let us throw it manually and observe the result.</p> 
	<h3>ThrowableTest.java</h3>
        	<pre class="pres">
package excep;
public class ThrowableTest {
	public static void main(String[] args) {
			try{
				throw new MyThrowable("This is thrown");
			}catch(MyThrowable t){
				System.out.println(t.getMessage());
			}
	}

}</pre>  
	  
	    <h2>Checked and Unchecked </h2>
        	<p>Any peice of code which compiler complain user to handle in the code by surrounding try/catch block or defining 
        	in method, are know as checked. Whereas if compiler doesn't complain for any piece of code are known as Unchecked.
        			Throwable is type of checked. Any class which throws Throwable or it's subclass need to be handle.</p>
	  	
        	
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>