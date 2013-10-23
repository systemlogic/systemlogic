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
        	<h2>Ant</h2>
        	<p>Install Ant on ubuntu</p>
        	<pre class="pres">
sudo apt-get install ant</pre>
<p>Test whether ant is installed?</p>
        	<pre class="pres">
ant -version</pre> 
<p>Now days maximum eclipse tools comes with ant how evner if it is not there then install it from eclipse market. For Ant installation on Eclipse. Help > Eclipse Market Place</p>
<img  src="/images/ant.png">
<p>Netbean latest version comes with ant integration.</p>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>