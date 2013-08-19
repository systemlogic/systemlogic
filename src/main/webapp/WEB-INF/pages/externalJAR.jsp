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
            <%@ include file="MavenMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>External Jar</h2>
        	<p>Not all jars can be found in maven repository. So how to add jar to local repository. First create project </p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
 mvn archetype:generate -DgroupId=com.jtest -DartifactId=JARTest 
 -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
</pre>        	    
<p>Then jar</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
mvn package
</pre>
<p>Let us place jar in local repository.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
mvn install:install-file -Dfile=./target/TargetFileName 
-DgroupId=TargetPackage -DartifactId=TargetArtifeact -Dversion=TargetVersion -Dpackaging=jar
</pre>
<p>which is equivalent to</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
mvn install:install-file -Dfile=./target/JARTest-1.0-SNAPSHOT.jar 
-DgroupId=com.JTest -DartifactId=JTest -Dversion=1.0 -Dpackaging=jar
</pre>
<p>Any Idea what is the location of this jar? Whenever we define any jar dependency into pom.xml, the respective jar goes into the ~/.m2/repository/GroupId.
Same way when we want to place third party jar into the maven local repository we define the groupId as location artifectId as file name and 
version as version folder and package type as what type of  packaging is required like jar, war, ejb and so on. In current case, jar can be found at
</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
~/.m2/repository/com/JTest/JTest/1.0
</pre>

        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>