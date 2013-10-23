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
        	<pre class="pres">
mvn archetype:generate -DgroupId=com.packagename -DartifactId=HelloWorld 
-DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
</pre>
<p>It will create project HelloWorld with package structure com.packagename of project type as maven-archetype-quickstart. If -DarchetypeArtifactId won't
be given while creating project it will show all project type that can be made, based on choice selection can be made for type of project.</p>
<pre class="pres">
mvn archetype:generate -DgroupId=com.packagename 
</pre>
<p>Let us complile and run default src file that has been created. Before that get into the project directory(for bignners).</p>
<pre class="pres">
mvn compile
</pre>
<p>Check out the project directory. Folder with name target is created into it which contains same folder structure as source and compile code. Let us run it now.</p>
<pre class="pres">
java -cp target/classes com.packageStructure.App
</pre>
<p>No Rocket Science, Only knowing your tool and utility.</p>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>