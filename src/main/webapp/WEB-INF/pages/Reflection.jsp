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
        	<h2>Reflection</h2>
			<p>Classes, interfaces, and objects that are present in the current Java Virtual Machine, and one is able 
			to examine it. If all these not loaded in JVM it won't be reflected in code. In other worlds it is a 
			reverse way of coding, when you don't know about class and want to examine and use it's methods.</p>
			<p>Let us dig into one example to see how class can be loaded and it's Constructor, method, field and 
			modifier can be examine.</p>
<pre class="pres">package com;
public class HelloWorld extends Hello{
	HelloWorld(){}
	HelloWorld(int a){
		super();
		public_int_variable = a;
	}
	HelloWorld(float b){
		protected_float_varibale = b;
	}
	double default_variable;
	public int public_int_variable ;
	@SuppressWarnings("unused")
	private long private_long_variable;
	protected float protected_float_varibale ;
	static String static_string_variable;
	final String final_String_variable="";
	public String hello(String str){
		return "Hello "+ str + "!!!";
	}
	protected int increment(int variable){
		return variable + 20;
	}
	@SuppressWarnings("unused")
	private String increment(String variable){
		return variable + 10;
	}
}
class Hello{
	protected int super_int_variable;
	public long increment(long variable){
		return variable + 20;
	}
}</pre>
<p>The above class we are going to examine using our following main program.</p>
<pre class="pres">
package com;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class TestClass {
	Class&lt;?&gt; cls ;
	TestClass(Class&lt;?&gt; cls){
		this.cls = cls; 
	}
	@SuppressWarnings("rawtypes")
	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		
		TestClass obj2 = new TestClass(HelloWorld.class);
		TestClass obj3 = new TestClass(Class.forName("com.HelloWorld"));
		
		TestClass[] clsArr =  {obj2}; //{obj2,obj3};
		
		for(TestClass obj : clsArr){
			System.out.println("-------------------Declared Fields-------------------");
			Field[] field = obj.cls.getDeclaredFields();
			for(Field temp_constructor :field){
				System.out.println(temp_constructor.getName());
				
			}
		}
		for(TestClass obj : clsArr){
			System.out.println("-------------------Fields----------------------------");
			Field[] ff = obj.cls.getFields();
			for(Field field :ff){
				System.out.println(field.getName());
				
			}
		}
		
		for(TestClass obj : clsArr){
			System.out.println("-------------------Declared Fields and Type----------");
			Field[] ff = obj.cls.getDeclaredFields();
			for(Field field :ff){
				System.out.println("Modifier :" + field.getModifiers() + 
				" for variable "+ field.getName());
				
			}
		}

		
		for(TestClass obj : clsArr){
			System.out.println("-------------------Constructor-----------------------");
			Constructor[] ff = obj.cls.getDeclaredConstructors();
			for(Constructor&lt;?&gt; field :ff){
				System.out.println("Constructor :" + field.getName());
				
			}
		}
		for(TestClass obj : clsArr){
			System.out.println("-------------------All methods-----------------------");
			Method[] ff = obj.cls.getMethods();
			for(Method field :ff){
				System.out.println("Method :" + field.getReturnType() +" " +field.getName());
				
			}
		}
		
		for(TestClass obj : clsArr){
			System.out.println("-------------------Class methods---------------------");
			Method[] ff = obj.cls.getDeclaredMethods();
			for(Method field :ff){
				System.out.println("Method :" + field.getReturnType() +" " +field.getName());
				
			}
		}
		for(TestClass obj : clsArr){
			System.out.println("-------------------Super Class-----------------------");
			Class&lt;?&gt; ff = obj.cls.getSuperclass();
			System.out.println("Modifier :" + ff.getModifiers() + " Class Name :" + ff.getName() );
		}
		for(TestClass obj : clsArr){
			System.out.println("-------------------Super Class Constructor-------------");
			Constructor[] ff = obj.cls.getSuperclass().getDeclaredConstructors();
			for(Constructor&lt;?&gt; field :ff){
				System.out.println("Constructor :" + field.getName());
				
			}
		}
		
		for(TestClass obj : clsArr){
			System.out.println("-------------------Class methods---------------------");
			Method[] ff = obj.cls.getSuperclass().getDeclaredMethods();
			for(Method field :ff){
				System.out.println("Method :" + field.getReturnType() +" " +field.getName());
				
			}
		}
		
		Class&lt;?&gt; modifiers_varaibe = Class.forName("java.lang.reflect.Modifier");
		System.out.println("-------Declared Fields of Modifier Class-------------------");
		Field[] field =modifiers_varaibe.getDeclaredFields();
		for(Field temp :field){
			System.out.println("Modifier sum = " + temp.getModifiers()  + " : " + temp.getName() );
		}
		
		Class&lt;?&gt; set = Class.forName("java.util.HashSet");
		System.out.println("-------Implemented Interface of HashSet--------------------");
		Class[] hashset = set.getInterfaces();
		for(Class&lt;?&gt; temp :hashset){
			System.out.println("Implemented Interface = " + temp.getName() );
		}
	}
}</pre>
<p>Output on console will be</p>
<pre class="pres">
-------------------Declared Fields-------------------
default_variable
public_int_variable
private_long_variable
protected_float_varibale
static_string_variable
final_String_variable
-------------------Fields----------------------------
public_int_variable
-------------------Declared Fields and Type----------
Modifier :0 for variable default_variable
Modifier :1 for variable public_int_variable
Modifier :2 for variable private_long_variable
Modifier :4 for variable protected_float_varibale
Modifier :8 for variable static_string_variable
Modifier :16 for variable final_String_variable
-------------------Constructor-----------------------
Constructor :com.HelloWorld
Constructor :com.HelloWorld
Constructor :com.HelloWorld
-------------------All methods-----------------------
Method :long increment
Method :class java.lang.String hello
Method :void wait
Method :void wait
Method :void wait
Method :boolean equals
Method :class java.lang.String toString
Method :int hashCode
Method :class java.lang.Class getClass
Method :void notify
Method :void notifyAll
-------------------Class methods---------------------
Method :int increment
Method :class java.lang.String increment
Method :long increment
Method :class java.lang.String hello
-------------------Super Class-----------------------
Modifier :0 Class Name :com.Hello
-------------------Super Class Constructor-------------
Constructor :com.Hello
-------------------Class methods---------------------
Method :long increment
-------Declared Fields of Modifier Class-------------------
Modifier sum = 25 : PUBLIC
Modifier sum = 25 : PRIVATE
Modifier sum = 25 : PROTECTED
Modifier sum = 25 : STATIC
Modifier sum = 25 : FINAL
Modifier sum = 25 : SYNCHRONIZED
Modifier sum = 25 : VOLATILE
Modifier sum = 25 : TRANSIENT
Modifier sum = 25 : NATIVE
Modifier sum = 25 : INTERFACE
Modifier sum = 25 : ABSTRACT
Modifier sum = 25 : STRICT
Modifier sum = 24 : BRIDGE
Modifier sum = 24 : VARARGS
Modifier sum = 24 : SYNTHETIC
Modifier sum = 24 : ANNOTATION
Modifier sum = 24 : ENUM
Modifier sum = 26 : CLASS_MODIFIERS
Modifier sum = 26 : INTERFACE_MODIFIERS
Modifier sum = 26 : CONSTRUCTOR_MODIFIERS
Modifier sum = 26 : METHOD_MODIFIERS
Modifier sum = 26 : FIELD_MODIFIERS
-------Implemented Interface of HashSet--------------------
Implemented Interface = java.util.Set
Implemented Interface = java.lang.Cloneable
Implemented Interface = java.io.Serializable
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