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
        	<h2>Packaging</h2>
        	<p>Every project Need to pack to some appropriate jar/War or some some other type  of suite. Let us pack class in earlier example.</p>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;?xml version="1.0" ?&gt;
&lt;project name="makefile" default="EntryPoint"&gt;
&lt;property file="build.properties" /&gt;
&lt;target name="java" depends="clean"&gt;
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

&lt;target name="EntryPoint" depends="java"&gt;
		&lt;jar destfile="./$ {TARGET.FOLDER}/Project.jar" basedir="$ {TARGET.FOLDER}" /&gt;
&lt;/target&gt;

&lt;/project&gt;
</pre>
<p>In aforementioned code EntryPoint has been change and depends on Java, Which means java tag will compile first. Once it completes it will executes jar 
command to pack the classes.</p>

<h2>Copy</h2>
<p>Copying the files into jar package to ship with it is leaving for your practice. Here we will see how to copy packed jar file to destination server.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;?xml version="1.0" ?&gt;
&lt;project name="makefile" default="EntryPoint"&gt;
&lt;property file="build.properties" /&gt;
&lt;target name="java" depends="clean"&gt;
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

&lt;target name="JARCreation" depends="java"&gt;
		&lt;jar destfile="./$ {TARGET.FOLDER}/Project.jar" basedir="$ {TARGET.FOLDER}" /&gt;
&lt;/target&gt;

&lt;target name="EntryPoint" depends="JARCreation" &gt;
		&lt;scp  file="./$ {TARGET.FOLDER}/Project.jar" remoteTofile="USERNAME:PASSWORD@SERVER:/LOCATION/"&gt;&lt;/scp&gt;
&lt;/target&gt;

&lt;/project&gt;</pre>
<p>For above code to compile fine one has to download and place scp related jar file into ant class path.</p>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>