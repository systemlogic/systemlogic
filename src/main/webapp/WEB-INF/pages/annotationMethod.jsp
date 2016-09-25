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
        	<h2>Annotation</h2>
        	<p>Annotation is a metadata that provides information/data about program that are not part of program itself. we will try 
        	to understand same with few examples.</p>
			<h3>Method Annotation</h3>
<p>It is believe you don't know about mvc component of Spring frame work. Well here is small introduction: Methods 
are defined in class are annotated with type of method(GET,POST,PUT,DELETE) and URL(url string) where service is available. This 
whole this is done with the help of component-scan utility which generally scan all the classes, abstract all annotated method 
and put them in some sort of map. We will try to simulate the same with the help of annotation.</p>
<p>Let us first define some custome Annotation that we are going to use later in the program.</p>
<pre class="pres">
package com.systemlogic;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Documented
@Target(ElementType.METHOD)
@Inherited
@Retention(RetentionPolicy.RUNTIME)
public @interface CAnnotation {
	String CMetohod() default "GET";
    String Request() default "URL";
}</pre>
<p>Now let them map to some method like it is done in Spring mvc.</p>
<pre class="pres">
package com.systemlogic;

public class CAnnotationMaping {
	@CAnnotation(Request="URL" , CMetohod="GET")
	public String testGet(){
		System.out.println("Return GET Test");
		return "Return GET Test";
	}
	@CAnnotation(Request="URL" , CMetohod="POST")
	public String testPOST(){
		System.out.println("Return POST Test");
		return "Return POST Test";
	}
	public String toString(){
		String str = "This is test String to return";
		System.out.println(str);
		return str;
	}
}</pre>

<p>Let us create a client, in our case it is just a main program, however in Spring mvc we use webbrowser to send the request.</p>
<pre class=pres>
package com.systemlogic;
import java.lang.reflect.Method;
import java.util.HashMap;

public class CAnnotationTesting {
	public static void main(String...strings) throws Exception{
		HashMap&lt;String, Method&gt; hm= new HashMap&lt;String, Method&gt;();
		Method[] method = CAnnotationMaping.class.getMethods();
		for(Method annotation : method){
			CAnnotation annos = annotation.getAnnotation(CAnnotation.class);
		    if(annos != null){
		    	hm.put(annos.CMetohod(), annotation);
		    }
		}
		
		hm.get("POST").invoke(Class.forName("com.systemlogic.CAnnotationMaping").newInstance());
		//This will invoke method marked with CMethod type as POST
		
		hm.get("GET").invoke(Class.forName("com.systemlogic.CAnnotationMaping").newInstance());
		//This will invoke method marked with CMethod type as GET
		
	}
}
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