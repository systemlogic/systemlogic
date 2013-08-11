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
            <%@ include file="springDataAccessMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Data Access</h2>
        	<p>Spring offers JDBC, ORM, OXM, JMS and Transaction modules to play with persistent data. We will see each one 
        	with some example.</p>
        	<p><b>JDBC : </b> Using jdbc template for all database operation.</p>
        	<p><b>Object Relational Mapping aka ORM : </b> best for JPA, Hibernate.</p>
        	<p><b>Object/XML mapping aka OXM :</b> jaxb2-marshaller, xmlbeans-marshaller, jibx-marshaller</p>
        	<p><b>Java Messanging Service :</b></p>
        	<p><b>Transaction :</b></p>
        	</td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>