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
<h2>View</h2>
<p>A database view is a virtual table or logical table which is defined as a SQL SELECT query with 	/out joins.</p>
<img src="/menu_assets/ddmenu/Table-wide.jpg">
<p>Picture is very beautiful, isn't? Let me create a wall with some window and see how the view looks like from window, 
to make one understand what view really means.</p>
<img src="/menu_assets/ddmenu/View-wide.jpg">
<p>Here Window view doesn't have it's own nature definition what it is doing is showing others beauty which is subset of 
original.</p>
<p>Let us jump into database now. Let me rewrite select query.</p>
<pre class="pres">SELECT  * FROM emp ;</pre>
<p>This will show all table column with all rows. Let us create view over it with some condition.</p>
<pre class="pres">
CREATE VIEW empMaleView as SELECT * FROM emp WHERE Sex LIKE 'Male'; 
</pre>
<p>Query like insert, update and delete can be fired as normal way on view however action will happen only on Original 
table and data provided view is created on single table and database is allowing the operation. View defined on multiple 
table will not allow insert, update and delete.</p>
<pre class="pres">DELETE FROM empMaleView WHERE EmpId=1007;</pre>
<p>Let widen the view and fetch data from multiple tables.</p>
<pre class="pres">
SELECT * FROM emp NATURAL JOIN dept;
</pre>
<p>But someone is not interested in all the column and data from Natural join. What s/he is interested is What department 
employee belong </p>
<pre class="pres">CREATE VIEW detailview as SELECT CONCAT(lastName,', ',firstName) as Name, Salary,Sex, description 
from emp NATURAL JOIN dept; </pre>
<p>Delete query that can not delete data from view and throw error.</p>
<pre class="pres">DELETE FROM detailview WHERE Sex like 'Male';</pre>
<h2>Materialized views</h2>
<p>MySql Doesn't have Materialized views, We will see it in Oracle database.</p>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>