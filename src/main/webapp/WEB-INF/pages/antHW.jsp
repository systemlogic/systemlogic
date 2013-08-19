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
        	<h2>Hello World Compile</h2>
        	<p>At this point we are not going to discuss how to write java code. What we are interesting in is ant build tool. Now onwards we are going to place 
        	our java code in src folder. One such file say Hello.java we have placed in src folder. Let see how ant works </p>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
public class hello{
	public static void main(String...str){
		System.out.println("Hello World");
	}
}</pre>
<p>Nothing new at this point. Now we are going to create one build.xml file at src level with following code.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;?xml version="1.0" ?&gt;
&lt;project name="makefile" default="EntryPoint"&gt;
	&lt;target name="EntryPoint"&gt;
		&lt;javac srcdir="./src" /&gt;
	&lt;/target&gt;
&lt;/project&gt;</pre> 
<p>Type in ant command on terminal where build.xml file has been created and observe the output. Will it be compiling fine? Most probably yes.</p>
<p>Is something wrong here? All class files are created into src folder. Let us separate them and put them into different folder. </p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;?xml version="1.0" ?&gt;
&lt;project name="makefile" default="EntryPoint"&gt;
&lt;property name="TARGET.FOLDER"          location="./target" /&gt;
&lt;target name="EntryPoint"&gt;
	&lt;mkdir  dir="$ {TARGET.FOLDER}"/&gt;
		&lt;javac srcdir="./src" destdir="$ {TARGET.FOLDER}" &gt;
		&lt;/javac&gt;
&lt;/target&gt;
&lt;/project&gt;
</pre>
<p>Type in ant command again and check the output. I believe it is always good practice to clean the destination directory first and then make 
the project.</p>
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
&lt;/project&gt;</pre>

<p>In aforementioned snippet before java code will compile, clean tag will get into first, delete the directory. What you always get is fresh compiled 
classes each time.</p>

        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>