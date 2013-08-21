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
        	<h2>try catch finally</h2>
        	<p>Any Object of Throwable or any of its subclass that is thrown can be catch in <b>catch</b> block. We can write resource deallocation 
        	code in finally. For any piece of code that throw an object at least need catch or finally(if finally only then all Exception in function throws 
        	statement) to compile it fine. </p>
        	<h3>tryCatch.java</h3>
        	<pre class="pres">
public class tryCatch {
	public static void main(String[] args) {
		LibraryClass imp = new LibraryClass();
		try{
			imp.printing();
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			System.out.println("In main finally");
		}
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
		try{
			throw new testException("System.out.println");
		}finally{
			System.out.println("In lib main");
		}
	}
}</pre>
		<p>Try output sequence yourself</p>
		<h3>Exception in java 7.0</h3>
		<p>In java 7 try is overloaded with extra implementation. try(Object instantiation) which mean try with resource. The object class should implements
		Closeable or AutoCloseable interface.Because the BufferedReader instance is declared in a try-with-resource statement, it will be closed regardless 
		of whether the try statement completes normally or abruptly (as a result of the method BufferedReader.readLine throwing an IOException).</p>
        	<h3>Exception7.java</h3>
        	<pre class="pres">
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
public class Exception7{
	public static void main(String[] args) throws IOException{
		System.out.println(readFirstLineFromFile("/home/arorah1/gs"));
		
	}
	static String readFirstLineFromFile(String path) throws IOException {
		try (BufferedReader br = new BufferedReader(new FileReader(path))) {
			return br.readLine();
		}
	}
}</pre>
    <p>Lets see one more example to check how try(with resource ) works. Try your own to check output.</p>
    <pre class="pres">
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
public class testTry{
	public static void main(String[] args) throws Exception  {
		try(MyClass obj=new MyClass()){
			obj.printing();
		}
	}
}
class MyException extends Exception {
	private static final long serialVersionUID = -3076788776543246285L;
	MyException(String s){
		super(s);
	}
}

class MyClass implements AutoCloseable{
	public void printing() throws MyException{
		System.out.println("Priniting Data");
	}
	public void close() throws Exception{
		System.out.println("Cleanup code");	
	}
}
    </pre>   	
<p>Let's  write some recursive code which throw an error, handle it and again make recursive call.</p>
<h3>Recursive.java</h3>
<pre class="pres">
public class Recursive {
	static int i = 0;
	public static void main(String ... arg){
		try{
			System.out.println("Push item="+ ++i);
			main(arg);
		}catch(StackOverflowError e){
			System.out.println();
			System.out.println("This Item can not be push=" + i);
		}finally{
			System.out.println("pop items="+ --i);
			main(arg);
		}		
	
	}
}
</pre>    
<p>Output for above program is different on different machine. However behaviour can be discuss. Method calls are maintain in stack. 
When recursive calls are made to main it will throw StackOverflowError and at the same time it will stop pushing further call to main.
So once catch part is done the control will be transfer to finally block to free up some the resource and start unwinding the call and start
poping up the items. When Garbage collector will free enough resource control will again reaches to main method and then again it push 
couple of main method call and this will continue.Output could be something like below.</p>

<h3>Output</h3>
<pre class="pres">
pop items=9704
Push item=9705
This Item can not be push=9705pop items=9704
This Item can not be push=9704
pop items=9703
Push item=9704
Push item=9705
This Item can not be push=9705pop items=9704
This Item can not be push=9704
pop items=9703
Push item=9704
This Item can not be push=9704pop items=9703
This Item can not be push=9703
pop items=9702
Push item=9703
Push item=9704
Push item=9705
This Item can not be push=9705pop items=9704
This Item can not be push=9704
pop items=9703
Push item=9704
This Item can not be push=9704pop items=9703
This Item can not be push=9703
pop items=9702
Push item=9703
Push item=9704
This Item can not be push=9704pop items=9703
This Item can not be push=9703
pop items=9702
Push item=9703
This Item can not be push=9703pop items=9702
This Item can not be push=9702
pop items=9701
Push item=9702
Push item=9703
Push item=9704
Push item=9705
This Item can not be push=9705pop items=9704
This Item can not be push=9704
pop items=9703
Push item=9704
This Item can not be push=9704pop items=9703
This Item can not be push=9703
pop items=9702
Push item=9703
Push item=9704
This Item can not be push=9704pop items=9703
This Item can not be push=9703
pop items=9702
Push item=9703
This Item can not be push=9703pop items=9702
This Item can not be push=9702
pop items=9701
Push item=9702
Push item=9703
</pre>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>