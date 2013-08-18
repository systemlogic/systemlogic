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
        	<h2>JUnit Suite</h2>
        	<p>Writing suite is much easier the JUnit Test case.</p>
<pre class="pres">
package JUnitTest;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
@RunWith(Suite.class)
@SuiteClasses({ ObserveClassTest.class,ObserveTest.class})
public class AllTests {

}</pre>
<p>Test classes included twice to show Test classes should be marked with Suitclasses annotation and should be commo separated.</p>
<p>Testing it from terminal is same.</p>
<pre class="pres">
java -cp /media/Harsh/HeliosSDK/work/StackImp/bin:
/home/arorah1/.m2/repository/junit/junit/4.8.2/junit-4.8.2.jar org.junit.runner.JUnitCore JUnitTest.AllTests</pre>
	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>