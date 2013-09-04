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
            <%@ include file="mySQLMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
<h2>Triggers</h2>
<p>Trigger is an activity which cause by some event and fired some other event. Here pressing a gun trigger is cause event 
and bullet firing in an other caused event.</p>
<img src="/menu_assets/ddmenu/triggers.jpg">
<p>In database, triggers are stored procedure which got fired for insert, update and delete type of operation.</p>
<pre class="pres"></pre>

        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>