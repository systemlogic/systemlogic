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
        	<h2>Eclipse/RAD Support</h2>
        	<p>For those who are comfertable with terminal command and want to switch over to GUI development. 
        	Easy for them to add Eclipse/RAD support to java project created using maven. Just get into the project directory and run the command.</p>
<pre class="pres">
mvn eclipse:eclipse
mvn eclipse:rad
</pre>
<p>At this point project can be imported to elipse.</p>        	    
<p>To remove the java support.</p>
<pre class="pres">
mvn eclipse:clean
mvn eclipse:rad:clean
</pre>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>