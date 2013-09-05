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
<p>Trigger is an activity which cause by some event and fired some other event. Here pressing a gun trigger is cause 
event and bullet firing in an other caused event.</p>
<img src="/menu_assets/ddmenu/triggers.jpg">
<p>In database, triggers are stored procedure which got fired for insert, update and delete type of operation. These 
triggers are as follows.</p>
<pre>BEFORE INSERT - activated before data is inserted into the table.
AFTER INSERT - activated after data is inserted into the table.
BEFORE UPDATE - activated before data in the table is updated.
AFTER UPDATE - activated after data in the table is updated.
BEFORE DELETE - activated before data is removed from the table.
AFTER DELETE - activated after data is removed from the table.</pre>

<p>Let us see trigger structure</p>
<pre class="pres">
CREATE TRIGGER trigger_name trigger_time trigger_event
 ON table_name
 FOR EACH ROW
 BEGIN
 ...
 END</pre>
<p>But this won't be suffice to understand. Let's dig into real problem.</p>
<p>Suppose One has to deletet the department 10 from dept table. Since forign key constraint has defined in emp table and 
departmetn 10 is used in emp one can not delete it from dept table. The only way to delete any department is to delete
all employee belongs to this particular department.</p>

<pre class="pres">
DELIMITER //
CREATE TRIGGER before_delete
BEFORE DELETE ON dept 
FOR EACH ROW
BEGIN 
UPDATE emp SET department = 11 where department = 10 ; 
END//
DELIMITER ;


DELETE FROM dept WHERE department=10;

SELECT * FROM dept;

SELECT * FROM emp;</pre>

<p>What about enlisting all triggers pertaining to any particular database.</p>
<pre class="pres">
SHOW TRIGGERS FROM comp;</pre>
<p>and deleting</p>
<pre class="pres">
DROP TRIGGER before_delete;</pre>
<p>Other Triggers will operate in same way.</p>

        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>