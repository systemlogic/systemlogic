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
        	<h2>Error</h2>
        	<p>Errors are abnormal conditions that should never occur.In Java, Error are unchecked by default and therefore need not to catch using 
        	try/catch and throws statement, but it doesn't mean you can not handle it. Since it is Unchecked the compiler is going to take responsibility 
        	for below code if you are not handling which will compile fine and executed. 
        	</p>
        	<h3>MyError.java</h3>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
public class MyError {
	public static void main(String[] args) {
		throw new Error("This Error is thrown and need not handler");
	}
}</pre>

		<p>Let System to throw some error by its own and don't handle it in code. Thread always terminate when error is thrown and not handle. The output 
			of below code is priniting error with line nuber where error is thrown. </p>
<h3>MyError.java</h3>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
public class MyError {
	public static void main(String[] args) {
		main(args);
		System.out.println("I will never be executed");
	}
}</pre>
<p>Let's catch error in try/catch.</p>
<h3>MyError.java</h3>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
public class MyError {
	public static void main(String[] args) {
		try{
			main(args);
		}catch(Throwable e){
			System.out.println(e.getMessage());	
			System.out.print(e.toString());
			
		}
		System.out.println("I get chance to execute");
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