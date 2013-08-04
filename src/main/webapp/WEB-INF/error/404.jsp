<%@ page isErrorPage="true" %>
<html>
<head>
<link href="/menu_assets/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="../pages/Header.jsp" %>
<%@ include file="../pages/Menu.jsp" %>
<table>
 <tr >
        <td valign="top" height="10px" width="222">
           <p><H1>Error 404</H1></p>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        <img src="/images/Error.png" align="right">
        </td>
        <%@ include file="../pages/rightPane.jsp" %>
    </tr>
</table>
<%@ include file="../pages/FooterLink.jsp" %>
<%@ include file="../pages/Footer.jsp" %>
</html>
<Response>
<error>
</error>

</Response>