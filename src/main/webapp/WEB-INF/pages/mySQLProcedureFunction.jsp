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
<h2>Procedure and Function.</h2>
<p>Before we go in any particular, let us see what is the difference between two.</p>
<p>Function should return a value using return statement where procedure does not need. Which also mean
function only has IN parameter, where procedure can have IN, OUT and INOUT. One more point to note is if
procedures are not returning any value which means they directly operate on value passed procedure call and 
set it back to some appropriate.</p>
<p>Procedure are called using CALL keyword followed my procedure name, where function are being called using 
select. </p>

<P><b>P.S. </b>One thing to be note here is if table is consider as class then columns are like member varibles and function 
are as member functions. Each record/row is like any other object of the table class. Now i guess it will be easy 
to understand the things.</P>

<h2>Procedure</h2>
<p>Let us create one to understand all thing. It is always better to write all procedure on note pad first and then 
do copy and paste stuff.</p>
<pre class="pres">
DELIMITER //
CREATE PROCEDURE sumDiff(IN param1 int, IN param2 int, OUT param3 int,OUT param4 int)
BEGIN
declare temp int;
set temp = param1 + param2;
set param3 = temp;
set temp = param1 - param2;
set param4 = temp;
END//
DELIMITER ;


call sumDiff(77,23,@sum,@diff);


select @sum,@diff;
</pre>
<p>List all procedure pertaining to database.</p>
<pre class="pres">show procedure status;</pre>
<p>Delete procedure to recreate into database.</p>
<pre class="pres">drop procedure procedure_name;</pre>

<p>But database is meant to play with data. Let's add table and manipulate it's data.</p>
<pre class="pres">
DELIMITER //
CREATE PROCEDURE salarySum(OUT param int)
BEGIN
select sum(salary) into param from emp;
END//
DELIMITER ;

call salarySum(@salary);
select @salary;</pre>

<p>Procedure are meant to play with value and doesn't return any value so we can not use procedure in select statement.
Let us use it for insert and update a record.</p>
<pre class="pres">
DELIMITER //
CREATE PROCEDURE addemp(IN id INT, IN fname VARCHAR(20), IN lname VARCHAR(20), IN sal int,
IN dept VARCHAR(20),IN Sx VARCHAR(20))
BEGIN
INSERT INTO emp(EmpId,FirstName,LastName,Salary,department,Sex) values(id,fname,lname,sal,dept,Sx);
END//
DELIMITER;

call addemp(1008,'Pranshi','Dhingra',59000,'10','Female');</pre>
<p>Similarly update statement will do.</p>
<p>What about test condition. Let us see if else block</p>
<pre class='pres'>
DELIMITER //
CREATE PROCEDURE salaryBracket(IN id INT,OUT bracket VARCHAR(20))
BEGIN
declare temp INT;
SELECT salary INTO temp FROM emp WHERE EmpID = id;
IF (temp < 15000) THEN
SET bracket = 'Under paid';
ELSEIF (temp >= 15000 AND temp < 25000) THEN
SET bracket = 'Normal paid';
ELSEIF (temp >= 25000 ) THEN
SET bracket = 'Handsome Salary';
END IF;
END //

DELIMITER ;

call salaryBracket(1008,@salary);
select @salary;

</pre>
<p>CASE will do the same.</p>
<pre class="pres">
DELIMITER //
CREATE PROCEDURE casesalary(IN id INT, OUT bracket VARCHAR(20))
BEGIN
declare temp INT;
SELECT salary INTO temp FROM emp WHERE EmpID = id;
CASE
WHEN temp < 15000 THEN
SET bracket = 'Under Paid';
WHEN temp >= 15000 AND temp < 25000 THEN
SET bracket = 'Normal Paid';
ELSE 
SET bracket = 'Handsome Salary';
END CASE;
END //
DELIMITER;

call casesalary(1008,@salary);
select @salary;
</pre>
<p>No programing language is complete without Looping. MySql supports, LOOP, REPEAT and WHILE. Here we will see only one, 
other would be learning syntax.</p>
<pre class="pres">
DELIMITER //
CREATE PROCEDURE repeatloop(INOUT sum INT)
BEGIN
DECLARE temp INT ;
SET temp = 0;
WHILE temp <= sum DO
SET temp = temp + 1;
END WHILE;
SET sum = temp;
END //

DELIMITER ;

SET @count = 100;
call repeatloop(@count);
select @count;
</pre>
<p><b>Cursor : </b> allow iterate a set of rows returned by a query and process. Cursors are read only, non-scrollable 
and asensitive (asensitive:-actual and insensitive:-temporary copy). Typical cursor structure will be like this.</p>
<pre class="pres">
DECLARE cursor_name CURSOR FOR SELECT_statement;
OPEN cursor_name;
FETCH cursor_name INTO variables list;
CLOSE cursor_name;</pre>
<p>Let's try Salary adjustment example for employees with cursor.</p>
<pre class='pres'>
DELIMITER //
CREATE PROCEDURE updateempsal(IN id INT, IN sal INT)
BEGIN
UPDATE emp SET Salary=sal where EmpID = id;
END//
DELIMITER ;


DROP PROCEDURE IF EXISTS saladjust;
DELIMITER //
CREATE PROCEDURE saladjust()
BEGIN
DECLARE id INT DEFAULT 0;
DECLARE sal INT;
DECLARE fname,lname,dept,sex varchar(20) ;
DECLARE cur CURSOR FOR SELECT * FROM emp;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET id = 0;
OPEN cur;
FETCH cur INTO id,fname,lname,sal,dept,sex;
WHILE id!=0 DO
IF(sal < 10000) THEN
call updateempsal(id,15000);
ELSEIF(sal > 10000 AND sal < 20000) THEN
call updateempsal(id,25000);
ELSEIF(sal > 20000 AND sal < 50000) THEN
call updateempsal(id,50000);
END IF;
FETCH cur INTO id,fname,lname,sal,dept,sex;
END WHILE;
CLOSE cur;
END//

DELIMITER ;
call saladjust();
</pre>
<h2>Function</h2>
<p>Upto this point we are directly playing with value passed, Let us see piece of code which will return value and 
is called function.</p>
<pre class="pres">
CREATE FUNCTION helloWorld(S VARCHAR(10)) RETURNS VARCHAR(20) DETERMINISTIC
RETURN CONCAT('Hello ', S,'!');

select helloWorld('Pranshi') as 'Hello Guys';</pre>
<p>Lets see some table example which uses helloWorld function.</p>
<pre class="pres">
 select helloWorld(firstName) as 'Hello Guys' from emp;</pre>
 <p>So what can be make out from result is function is called for every row that is shown in result.</p>
 <p>Let us write a function where salary will be increased if 12 % when employee is determised as female otherwise it 
 will be increased by 10 %. Women always have benefit over mens. No Change in salary whose Sex is other then male and 
 female.</p>
 <pre class="pres">
select * from emp;

DELIMITER //
CREATE FUNCTION increment(salary INT,sex VARCHAR(20)) RETURNS INT 
BEGIN
IF(sex = 'MALE') THEN
RETURN salary*1.1;
ELSEIF(sex = 'FEMALE') THEN
RETURN salary*1.12;
ELSE
RETURN salary*1.0;
END IF;
END//
DELIMITER ;

UPDATE emp SET salary=increment(salary,sex);
select * from emp;</pre>
<p>Many of MySQL functons have already explained in Joins/Functions section.</p>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>