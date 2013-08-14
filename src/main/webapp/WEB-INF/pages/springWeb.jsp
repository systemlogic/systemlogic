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
            <%@ include file="springWebMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Web</h2>
        	<p>Spring Web offers Web-Servlet module, Web-Struts module, Web-Portlet. We will also see some more examples 
        	to depict it's span.</p>
        	<p><b>Web-Servlet module : </b> contains Spring's model-view-controller (MVC) implementation.</p>
        	<p><b>Web-Struts module : </b> It has been depricated with 2.0 and no need to learn here.</p>
        	<p><b>Web-Portlet :</b>  provides the MVC implementation to be used in a portlet environment 
        	and mirrors the functionality of Web-Servlet module.</p>
        	</td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>