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
            <%@ include file="annotationMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
			<h3>BuiltIn Annotation</h3>
<p>Some annotation are built into the java which gives direction to java compiler. Each of this annotation tell the compiler how to 
interpreate it. </p>
<h3>@Deprecated</h3>
<p>Improvement in library class is an continuous process. The functionality which was not implemented earlier due to lack of understanding
of problem domain OR a new feature is required. In such a case new functions are defined and along with what are present already. To make 
client to use new function earlier methods are marked with @Depricated  </p>

<pre class="pres">
public class DepricateClass {
	@Deprecated
	public void method1(){}
	
	@Deprecated
	public void method2(){}
	
	public void method3(){}
}
</pre>

<p>Use of methods in library. Notice the warnings in program.</p>
<pre class="pres">
public class DepricateTest {
	public static void main(String...strings){
		DepricateClass dc =new DepricateClass();
		dc.method1();
		dc.method2();
		dc.method3();
	}
}</pre>

<h3>@Override</h3>
<p>In case program is depend on 3rd party library where some of the method from super class is removed which are override by client 
program and also marked with @override with thrown an compile time error.</p>
<pre class="pres">
public class OverrideClass extends DepricateClass{
	@Override
	public void method3(){}
}</pre>
<p>Delete the method3 from super class and try to compile with and without @Override</p>

<h3>@SuppressWarnings</h3>
<p>It direct the compiler to suppress this particular warning. In our case we are going to mark the main method with suppress annotation.</p>
<pre class="pres">
public class DepricateTest {
	@SuppressWarnings("deprecation")
	public static void main(String...strings){
		DepricateClass dc =new DepricateClass();
		dc.method1();
		dc.method2();
		dc.method3();
	}
}</pre>
<p>Other annotation includes SafeVarargs and FunctionalInterface used in same way.</p>
	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>