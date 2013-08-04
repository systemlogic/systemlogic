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
        	<h2>Hello World</h2>
        	<p>Open terminal and run the following command.</p>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
mvn archetype:generate -DgroupId=com.packagename -DartifactId=HelloWorld 
-DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
</pre>
<p>It will create project HelloWorld with package structure com.packagename of project type as maven-archetype-quickstart. If -DarchetypeArtifactId won't
be given while creating project it will show all project type that can be made, based on choice selection can be made for type of project.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
mvn archetype:generate -DgroupId=com.packagename 
</pre>
<p>Let us complile and run default src file that has been created. Before that get into the project directory(for bignners).</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
mvn compile
</pre>
<p>Check out the project directory. Folder with name target is created into it which contains same folder structure as source and compile code. Let us run it now.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
java -cp target/classes com.packageStructure.App
</pre>
<p>No Rocket Science, Only knowing your tool and utility.</p>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>