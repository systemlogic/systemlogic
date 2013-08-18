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
            <%@ include file="jUnitMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>JUnit</h2>
        	<p>JUnit framework is unit test tool for developer to test the cases from his/her end. Suppose a case when developer/s 
        	has build such a big application that need to be tested even for small changes, it just wastege of time to check values 
        	in console output which is also prone to human error. Easiest way is to write JUnit test case for each method in observation 
        	and run it each time for impact changes.</p>
			<h3>Installation</h3>
			<p>If you are programmer comfortable with command line then you have to include the JUnit.jar(version 4.x) in class path.</p>
			<p>Test whether JUnit is in class path or not</p>
<pre class="pres">
arorah1@E6410:~/maven$ java -cp /home/arorah1/.m2/repository/junit/junit/4.8.2/junit-4.8.2.jar org.junit.runner.JUnitCore

Time: 0.001

OK (0 tests)
</pre>
<p>Most of the Eclipse version for java comes with JUnit, in case it doesn't come One can go to Help > Eclipse Market Place > Search for JUnit and install 
one which is appropriate</p> 
<img  src="/images/JUnitInstallation.png">
<p>Test whether Junit is installed on eclipse go to File > New > Other > JUnit(Search for it.)</p>
	    <img  src="/images/JUnitTestInstallation.png">
	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>