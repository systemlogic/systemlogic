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
        	<h2>Ant Tags</h2>
        	<p>Generally we are firing only ant on terminal. What if we don't want every thing from ant action and want only certain piece to compile.
        	All tag that has been defined can be used with ant to perform specific functionality. For example clean tag has been defined to deleted 
        	the output directory.</p>
        	<pre class="pres">
ant clean</pre>
<p>In case one is interested in JARCreation and it's dependent processing</p>
<pre class="pres">
ant JARCreation
</pre>
        
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>