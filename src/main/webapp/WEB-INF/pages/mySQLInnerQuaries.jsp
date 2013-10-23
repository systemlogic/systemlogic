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
        	<h2>Inner Quaries</h2>
        	<p>When result of one quary(Inner) feed to Other query for some appropriate result. Lets see simple quary.</p>
<pre class="pres">
select * from emp where sex in (select Distinct(Sex) from emp );</pre>
<p>Inner query with two different tables.</p>
<pre class="pres">
select e.EmpId,CONCAT(e.LastName,', ',e.FirstName) as Name, e.Salary as Salary,d.description as Department 
from emp e,dept d 
where e.department=d.department AND e.department in 
(select Distinct(d.department) from dept d );
</pre>
<p>Inner query with Update. Update salary of employee by 50% those who belong to department 10,11</p>
<pre class="pres">
update emp SET Salary=Salary*1.5 where department in 
(Select Distinct(department) from dept where department in (10,11));</pre>

<p>So what need to remember here is if outer query is expecting single values then inner/sub query should return single value and 
in case if outer query is expecting set of value then inner query should return set of values.</p>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>