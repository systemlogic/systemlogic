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
        	<h2>Private Field and Method</h2>
			<p>Here we will see how private field can be access and updated. HelloWorld class will be same.</p>
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
<pre class="pres">TODO Auto-generated method stub
			AccessibleObject ao ;
			Class cls = Class.forName("com.HelloWorld");
			Field privateField = cls.getDeclaredField("private_long_variable");
			
			privateField.setAccessible(true);
			
			Object obj = cls.newInstance();
			System.out.println("-------------------Private field original value--------------");
			System.out.println("private_long_variable="+privateField.get(obj));
			privateField.set(obj , 10);
			System.out.println("-------------------Private field updated value---------------");
			System.out.println("private_long_variable="+privateField.get(obj));
			Class[] argTypes = new Class[] { String.class };
			Method method = cls.getDeclaredMethod("increment", argTypes);
			
			method.setAccessible(true);
			
			Object temp = method.invoke(obj, "20");
			System.out.println("-------------------Private Method access---------------------");
			System.out.println("private method return value=" + temp);</pre>
<p>Output on console will be</p>
<pre class="pres">-------------------Private field original value--------------
private_long_variable=0
-------------------Private field updated value---------------
private_long_variable=10
-------------------Private Method access---------------------
private method return value=2010</pre>
	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>