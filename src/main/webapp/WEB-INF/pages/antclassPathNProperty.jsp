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
            <%@ include file="antMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Class Path</h2>
        	<p>Ant is meant to compile complex projects which could use multiple jars. Such Jars should be in classpath. Setting up class path in OS path/classpath 
        	is not a good practice. Ant provides us an facility to set the class path when ant runs provides Jar should be on filesystem.</p>
        	<p>Some such programs is shown below which requires some jar.</p>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
package JUnitTest;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;

public class ObserveTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testToString() {
		assertTrue(true);
	}

}</pre>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
package JUnitTest;

import org.junit.Rule;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
@Rule

@RunWith(Suite.class)
@SuiteClasses({ ObserveClassTest.class,ObserveTest.class})
public class AllTests {

}</pre>
<p>Try to compile it with build.xml defined as defined below.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;?xml version="1.0" ?&gt;
&lt;project name="makefile" default="EntryPoint"&gt;
&lt;property name="TARGET.FOLDER"          location="./target" /&gt;
&lt;target name="EntryPoint" depends="clean"&gt;
&lt;mkdir  dir="$ {TARGET.FOLDER}"/&gt;
	&lt;javac srcdir="./src" destdir="$ {TARGET.FOLDER}" &gt;

&lt;/javac&gt;
&lt;/target&gt;
&lt;target name="clean"&gt;
&lt;echo message="Delete $ {TARGET.FOLDER}" /&gt;
	&lt;delete dir="$ {TARGET.FOLDER}"/&gt;
&lt;/target&gt;
&lt;/project&gt;
</pre>
<p>Caught an error? <b>YES.</b> Let us modify ant script little bit and specify where is JUnit jar that code is looking for.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;?xml version="1.0" ?&gt;
&lt;project name="makefile" default="EntryPoint"&gt;
&lt;property name="TARGET.FOLDER"          location="./target" /&gt;
&lt;target name="EntryPoint" depends="clean"&gt;
&lt;mkdir  dir="$ {TARGET.FOLDER}"/&gt;
	&lt;javac srcdir="./src" destdir="$ {TARGET.FOLDER}" &gt;
&lt;classpath&gt;
				&lt;pathelement location="/home/arorah1/.m2/repository/junit/junit/4.9/junit-4.9.jar" /&gt;
&lt;/classpath&gt;
&lt;/javac&gt;
&lt;/target&gt;
&lt;target name="clean"&gt;
&lt;echo message="Delete $ {TARGET.FOLDER}" /&gt;
	&lt;delete dir="$ {TARGET.FOLDER}"/&gt;
&lt;/target&gt;
&lt;/project&gt;
</pre>
<p>Don't you think eclipse is having one such setup which creates class files in bin folder.</p>
	<h2>Property File</h2>
	<p>In case when project is setup among different team member and each of them have different location for dependent jar. What one need to change is 
	the location in property file and things will go fine. Also one can have mix and match combination for putting properties into build.xml and property file.</p>
<h3>build.xml</h3>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;?xml version="1.0" ?&gt;
&lt;project name="makefile" default="EntryPoint"&gt;
&lt;property file="build.properties" /&gt;
&lt;target name="EntryPoint" depends="clean"&gt;
&lt;mkdir  dir="$ {TARGET.FOLDER}"/&gt;
	&lt;javac srcdir="./src" destdir="$ {TARGET.FOLDER}" &gt;
&lt;classpath&gt;
				&lt;pathelement location="$ {REPOSITORY.PATH}/junit/junit/4.9/junit-4.9.jar" /&gt;
&lt;/classpath&gt;
&lt;/javac&gt;
&lt;/target&gt;
&lt;target name="clean"&gt;
&lt;echo message="Delete $ {TARGET.FOLDER}" /&gt;
	&lt;delete dir="$ {TARGET.FOLDER}"/&gt;
&lt;/target&gt;
&lt;/project&gt;</pre>
<h3>build.properties</h3>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
REPOSITORY.PATH=/home/arorah1/.m2/repository
TARGET.FOLDER=./target</pre>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>