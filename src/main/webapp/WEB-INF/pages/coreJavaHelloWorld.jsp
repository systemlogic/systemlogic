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
            <%@ include file="coreJavaMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Hello World </h2>
        	<p>The biggest challenge to learn any language is to print Hello world. It is so simple to print it on console. One has to open the desire editor and type in the following code</p>
        	<h3>hello.java</h3>
        	<pre class="pres">
public class hello{
	public static void main(String[] str){
		System.out.println("Hello World");
	}
}</pre>
        	
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>