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
        	<h2>Synthetic</h2>
			<p>Anything that is synthesis by compiler JVM is called synthetic. When there is a 
			field, method or class introduced by the compiler and we can not find the primary declaration 
			in the source file, it is marked as synthetic. Such synthetic field, method or class uses $ sign in their name.</p>
			
			<pre class="pres">import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import static java.lang.System.out;

public class MethodSpy {
	private void test(){}
	class Inner1
    {
		private String str="Test str";
	}
	private static final class Inner2 {
		private String aPrivateVariable = "A Private Variable!";

		private String getaPrivateVariable() {
			return aPrivateVariable;
		}
	}
	public static void main(String args[]) throws Exception{
		for (Field field : Inner1.class.getDeclaredFields())
        {
            System.out.println(field.getName() + ": " + field.isSynthetic() + "  ---- " + field.getType());
        }
		Inner2 nestObj = new Inner2();
		System.out.println("Nested Variable:" + nestObj.aPrivateVariable); //Comment me and then rerun
		Class c = nestObj.getClass();
		Method[] methods = c.getDeclaredMethods();
		for (Method m : methods) {
			System.out.println("isSynthetic: " + m.isSynthetic() + " ----method : " + m  );
		}
	}
}</pre>
<p>Observe the output carefully. Also take a look into class output folder.</p>
	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>