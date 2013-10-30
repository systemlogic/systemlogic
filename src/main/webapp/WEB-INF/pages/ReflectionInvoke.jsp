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
            <%@ include file="ReflectionMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Call Constructor and Invoke Method</h2>
			<p>Here we will see how memory is created and method will be invoked. HelloWorld class will be same.</p>
<pre class="pres">package com;
public class HelloWorld extends Hello{
	double default_variable;
	public int public_int_variable ;
	@SuppressWarnings("unused")
	private long private_long_variable;
	protected float protected_float_varibale ;
	static String static_string_variable;
	final String final_String_variable="";
	
	HelloWorld(){
		super();
	}
	public HelloWorld(int a){
		super(a);
		public_int_variable = a;
	}
	HelloWorld(float b){
		protected_float_varibale = b;
	}
	public String hello(String str){
		return "Hello "+ str + "!!!";
	}
	protected int increment(int variable){
		return public_int_variable + variable;
	}
	@SuppressWarnings("unused")
	private String increment(String variable){
		return variable + 10;
	}
}
class Hello{
	protected int super_int_variable;
	public Hello(){
		super_int_variable = 0;
	}
	public Hello(int value){
		super_int_variable = value;
	}
	public long increment(long variable){
		return variable + super_int_variable;
	}
}</pre>
<p>The above class we are going to use in our following main program to create object and making call to method.</p>
<pre class="pres">
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

public class Invokation {
		Class cls ;
		Object obj;
		Method method ;
		public Invokation() {
			// TODO Auto-generated constructor stub
		}
		public Invokation(String str) throws Exception{
			this();
			cls = Class.forName(str);
		}
		public void createMemory() throws Exception{
			obj = cls.newInstance();
		}
		public void setMethod(String name,Class[] argTypes) throws Exception{
			method = cls.getMethod(name,argTypes);
		}
		public Object invokeMethod(){
			return null;
		}
		public static void main(String...strings) throws Exception{
			Invokation invokation = new Invokation("com.HelloWorld");
			invokation.createMemory();
			System.out.println("--------------hello(String) invocation--------");
			Class[] argTypes = new Class[] { String.class };
			invokation.setMethod("hello", argTypes);
			Object temp = invokation.method.invoke(invokation.obj,"Pranshi");
			System.out.println(temp);
			
			
			try{
			System.out.println("--------------increment(int) invocation--------");
			argTypes = new Class[] { int.class };
			invokation.setMethod("increment",argTypes); //this will throw Exception 
			temp = invokation.method.invoke(invokation.obj,10);//protected method not visible
			System.out.println(temp);
			}catch(Exception e){
				System.out.println("Try to access protected method " +e.getMessage());
			}
			
			System.out.println("--------------constructor + method call---------");
			Constructor constructor = invokation.cls.getConstructor( new Class[] { int.class });
			invokation.obj = constructor.newInstance(20);
			argTypes = new Class[] { long.class };
			invokation.setMethod("increment",argTypes);
			temp = invokation.method.invoke(invokation.obj,10);
			System.out.println(temp);
		}
}</pre>
<p>Output on console will be</p>
<pre class="pres">
--------------hello(String) invocation--------
Hello Pranshi!!!
--------------increment(int) invocation--------
Try to access protected method com.HelloWorld.increment(int)
--------------constructor + method call---------
30
</pre>
	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>