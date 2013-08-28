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
<h2>Delete</h2>
<p>Delete rows from table is simple. If no condition will be specified all rows will be kicked form the table.</p>
<pre class="pres">delete from emp;</pre>
<p>How ever if some rows are only part of show we can specify the condition.</p>
<pre class="pres">delete from emp where department = 10;</pre>

<h2>Drop</h2>
<p>Drop table will remove entire table form database including rows and table structure.</p>
<pre class="pres">drop table emp;</pre>
<h2>Truncate</h2>
<p>Truncate will remove all the rows from table leave table structure intact. It also reset the auto increment counter to 
initial value.</p>
<pre class="pres">truncate table emp;</pre>
<p><b>P.S.</b>DROP and TRUNCATE are DDL commands, whereas DELETE is a DML command. As such, DELETE operations can be rolled 
back (undone), while DROP and TRUNCATE operations cannot be rolled back. Roll back is applicable for Transaction only. We 
will see transaction later.</p>

        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>