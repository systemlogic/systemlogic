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
        	<h2>Maven</h2>
        	<p>Install Maven on ubuntu</p>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
sudo apt-get install maven</pre>
<p>Test whether Maven is installed?</p>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
mvn -version</pre> 
<p>Maven installation on Eclipse. Help > Eclipse Market Place</p>
<img  src="/images/Market-Place-Maven.png">
<p>Test Maven is installed on Eclipse</p>
<img  src="/images/Maven-Project.png">
<p>Netbean latest version comes with maven integration.</p>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>