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
<h2>Transaction</h2>
<p>Transaction is piece of work which operates in ALL-OR-NOTHING mode on database and follow a database transaction 
property acid(atomic, consistent, isolated, durable). Transaction topic is very vast. We will try to cover many things.</p>
<p>Did you ever notice when you run update command it commit the changes to databases and don't leave any option to get it 
rollback OR give option to commit. Update means perform write operation even if execute partially. It happens because 
autocommit session varaible is set to enable.</p>
<p>Let us write amount withdraw transaction code. When Transaction is start autocommit variable is set to disable and all changes to the 
database is possible by commit only or in case restore is required one can rollback. Once transaction is over varaibale 
is set to it's previous state.</p>

<pre class="pres">
SELECT * FROM emp;
START TRANSACTION;
UPDATE emp SET salary=(salary-18000) where EmpId=1000;</pre>
<p>Multiple updates are possible in Transaction block.Just check the EmpId 1000 salary in emp table.</p>
<pre class="pres">SELECT * FROM emp;</pre>
<p>Rollback the command and check the salary of same employee.</p>
<pre class="pres">ROLLBACK;
SELECT * FROM emp;</pre>
<p>I think what Rollback does is clear. Then, What is the role of commit? Follow all steps and replace ROLLBACK with COMMIT and 
observe the emp table.</p>

<p>Before we proceed further we will see what is lock.</p>
<p><b>Lock : </b> is like any other lock which doesn't allow any other to operate. START TRANSACTION obtain the intrinsic lock on row 
on which update operation is performed. However we will obtain lock explicitly. For this we need two different Session we 
named them Session-A and Session-B</p>
<p>On Session-A</p>
<pre class="pres">LOCK TABLES emp WRITE;</pre>
<p>On Session-B</p>
<pre class="pres">UPDATE emp SET salary=(salary-150) WHERE EmpId=1000;</pre>
<p>This operation will be in waiting state for lock to be released on table. Now unlock the table.</p>
<p>On Session-A</p>
<pre class="pres">UNLOCK TABLES;</pre>
<p>So what about <b>Read Lock</b>? when Read lock is obtain on table it does not allow update/insert operation on same transaction 
and put on hold the other session operation until lock is released.</p>
<p><b>START TRANSACTION</b> is SQL standard and can also be replaced with mysql <b>BEGIN [WORK]</b>.</p>
<pre class="pres">
BEGIN
UPDATE emp SET salary=(salary-15000) WHERE EmpId=1000;
ROLLBACK;</pre>
<p><b>CHAIN AND RELEASE </b>: provides transaction complete control. Let us see one simple rollback example. Again we 
will play with two sessions.</p>
<p>At Session-A</p>
<pre class="pres">
START TRANSACTION;
UPDATE emp SET salary=(salary-15000) WHERE EmpId=1000;</pre>
<p>At Session-B</p>
<pre class="pres">
START TRANSACTION;
UPDATE emp SET salary=(salary-15000) WHERE EmpId=1000;</pre>
<p>At Session-A</p>
<pre class="pres">
ROLLBACK AND CHAIN;</pre>
<p>A new transaction starts immediately with the same isolation level as the just-terminated transaction.</p>
<pre class="pres">
ROLLBACK AND RELEASE;</pre>
<p><b>RELEASE : </b> will disconnect the server with current client connection after termination the transaction.
New transaction will start with default variable value.</p>
<p>Similarly we have <b>NO CHAIN</b> and <b>NO RELEASE</b> which is default values.</p>
<pre class="pres">
ROLLBACK AND NO CHAIN;
COMMIT AND NO CHAIN;</pre>
<p><b>Savepoint : </b>One of the interesting thing with rollback transaction is it can be be rollback to some save point, 
no need to rollback the whole transaction. To rollback the transaction wot certain point one has to defined savepoint.</p>
<pre class="pres">
START TRANSACTION;
UPDATE emp SET salary=(salary-1000) WHERE EmpId=1000;
SAVEPOINT firstPoint;
UPDATE emp SET salary=(salary-1000) WHERE EmpId=1000;
SAVEPOINT secondPoint;
UPDATE emp SET salary=(salary-1000) WHERE EmpId=1000;
SAVEPOINT thirdPoint;
UPDATE emp SET salary=(salary-1000) WHERE EmpId=1000;
ROLLBACK TO SAVEPOINT secondPoint;
</pre>
<p>Similarly MySQL have <b>RELEASE SAVEPOINT</b> which delete specified savepoint from list of savepoints. Below piece of 
code will give error at the end.</p>
<pre class="pres">
START TRANSACTION;
UPDATE emp SET salary=(salary-1000) WHERE EmpId=1000;
SAVEPOINT firstPoint;
UPDATE emp SET salary=(salary-1000) WHERE EmpId=1000;
SAVEPOINT secondPoint;
UPDATE emp SET salary=(salary-1000) WHERE EmpId=1000;
SAVEPOINT thirdPoint;
UPDATE emp SET salary=(salary-1000) WHERE EmpId=1000;
RELEASE SAVEPOINT secondPoint;
ROLLBACK TO SAVEPOINT secondPoint;
</pre>
<p><b>WITH CONSISTENT SNAPSHOT : </b>modifier starts a consistent read for storage engines that are capable of it. This applies 
only to InnoDB. The consistent read operation that uses snapshot information to present query results based on a point in time, regardless of 
changes performed by other transactions running at the same time. If queried data has been changed by another transaction, the 
original data is reconstructed based on the contents of the undo log.  </p>


        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>