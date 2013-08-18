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
        	<h2>pom</h2>
        	<p>Every maven project is associated with pom.xml which is also heart of the Project. pom file
        	contain entries that we defined at the time of project creation and dependent jars. Each jar that we want
        	to use should be marked under dependencies tag with following format. By default Maven add JUnit jar to 
        	Maven-archetype-quickstart type of project.</p>
<pre class="pres">
< dependencies >
    < dependency >
      < groupId >junit< /groupId >
      < artifactId >junit< /artifactId >
      < version >3.8.1< /version >
      < scope >test< /scope >
    < /dependency >
< /dependencies >
</pre>        	    
	<p>Above detail will download the junit file with specified version and specified location under .m2 folder of home directory.
	<pre class="pres">
ls ~/.m2/repository
	</pre>
	<p>Let us add some dependency to pom and see what really happen. At this point local repository doesn't contain jar file that we are going to use.
	Please check the following directory ls ~/.m2/repository/org/springframework/spring-core. Add the dependency to the pom. pom.xml should look like as shown below.</p>
	<pre class="pres">
&lt;project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd"&gt;
  &lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
  &lt;groupId&gt;com.packageStructure&lt;/groupId&gt;
  &lt;artifactId&gt;ProjectName&lt;/artifactId&gt;
  &lt;packaging&gt;jar&lt;/packaging&gt;
  &lt;version&gt;1.0-SNAPSHOT&lt;/version&gt;
  &lt;name&gt;ProjectName&lt;/name&gt;
  &lt;url&gt;http://maven.apache.org&lt;/url&gt;
        &lt;properties&gt;
                &lt;spring.version&gt;3.0.5.RELEASE&lt;/spring.version&gt;
        &lt;/properties&gt;
  &lt;dependencies&gt;
                &lt;dependency&gt;
                        &lt;groupId&gt;org.springframework&lt;/groupId&gt;
                        &lt;artifactId&gt;spring-core&lt;/artifactId&gt;
                        &lt;version&gt;${spring.version}&lt;/version&gt;
                &lt;/dependency&gt;

                &lt;dependency&gt;
                        &lt;groupId&gt;org.springframework&lt;/groupId&gt;
                        &lt;artifactId&gt;spring-context&lt;/artifactId&gt;
                        &lt;version&gt;${spring.version}&lt;/version&gt;
                &lt;/dependency&gt;
                &lt;dependency&gt;
                        &lt;groupId&gt;junit&lt;/groupId&gt;
                        &lt;artifactId&gt;junit&lt;/artifactId&gt;
                        &lt;version&gt;3.8.1&lt;/version&gt;
                &lt;/dependency&gt;
  &lt;/dependencies&gt;
&lt;/project&gt;
</pre>   	
<p>Run the mvn compile and see the repository folder. Also observe the console output which is showing downloading status of different jar file.</p>
<pre class="pres">
[INFO] Scanning for projects...
[INFO]                                                                         
[INFO] ------------------------------------------------------------------------
[INFO] Building ProjectName 1.0-SNAPSHOT
[INFO] ------------------------------------------------------------------------
Downloading: http://repo.maven.apache.org/maven2/org/springframework/spring-core
/3.0.5.RELEASE/spring-core-3.0.5.RELEASE.pom
Downloaded: http://repo.maven.apache.org/maven2/org/springframework/spring-core/
3.0.5.RELEASE/spring-core-3.0.5.RELEASE.pom (3 KB at 0.1 KB/sec)
Downloading: http://repo.maven.apache.org/maven2/org/springframework/spring-core
/3.0.5.RELEASE/spring-core-3.0.5.RELEASE.jar
Downloaded: http://repo.maven.apache.org/maven2/org/springframework/spring-core/
3.0.5.RELEASE/spring-core-3.0.5.RELEASE.jar (374 KB at 3.1 KB/sec)
[INFO] 
[INFO] --- maven-resources-plugin:2.3:resources (default-resources) @ ProjectName ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory /home/arorah1/maven/ProjectName/src/main/resources
[INFO] 
[INFO] --- maven-compiler-plugin:2.0.2:compile (default-compile) @ ProjectName ---
[INFO] Nothing to compile - all classes are up to date
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 2:18.242s
[INFO] Finished at: Sat Jul 20 10:31:33 IST 2013
[INFO] Final Memory: 7M/103M
[INFO] ------------------------------------------------------------------------</pre>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>