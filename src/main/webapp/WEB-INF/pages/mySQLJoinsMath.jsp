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
<h2>Mathematical operation</h2>
<p>Wide verity of methematical operation can be perform on column data. As of now we see what all functions are available that can \
be used to perform task.</p>
<p><b>Arithmetic Operators are having their usual meaning. </b></p>
<pre class="pres">Select 10*30 as Result;</pre>
<pre>
Name			Description
ABS()			Return the absolute value
ACOS()			Return the arc cosine
ASIN()			Return the arc sine
ATAN2(), ATAN()		Return the arc tangent of the two arguments
ATAN()			Return the arc tangent
CEIL()			Return the smallest integer value not less than the argument
CEILING()		Return the smallest integer value not less than the argument
CONV()			Convert numbers between different number bases
COS()			Return the cosine
COT()			Return the cotangent
CRC32()			Compute a cyclic redundancy check value
DEGREES()		Convert radians to degrees
EXP()			Raise to the power of
FLOOR()			Return the largest integer value not greater than the argument
LN()			Return the natural logarithm of the argument
LOG10()			Return the base-10 logarithm of the argument
LOG2()			Return the base-2 logarithm of the argument
LOG()			Return the natural logarithm of the first argument
MOD()			Return the remainder
PI()			Return the value of pi
POW()			Return the argument raised to the specified power
POWER()			Return the argument raised to the specified power
RADIANS()		Return argument converted to radians
RAND()			Return a random floating-point value
ROUND()			Round the argument
SIGN()			Return the sign of the argument
SIN()			Return the sine of the argument
SQRT()			Return the square root of the argument
TAN()			Return the tangent of the argument
TRUNCATE()		Truncate to specified number of decimal places</pre>
<p><b>Log and Anti Log</b></p>
<pre class="pres">
select log10(9);
select power(10,log10(9)) ;</pre>
<p>Similarly all other function will work.</p>

<h2>Joins</h2>
<p>To understand join one should have knowledge of Sets mathematics. Let us see example of all possible joins.</p>
<pre class="pres">
select * from emp join dept;
SAME AS
select * from emp, dept;</pre>
<p>Here each row of emp is map with every other row of dept and result in NxM Rows. In this join you don't need to pass 
join condition.</p>
<p><b>Left Join :</b> All Rows from left table will be included even if match will not be found on right table. It is
equivalent to Left Outer Join. </p>
<pre class="pres">
select * from dept left join emp on emp.department = dept.department;
SAME AS
select * from dept left join emp using(department);
</pre>
<p><b>Right Join :</b> All Rows from right table will be included even if match will not be found on left table. It is
equivalent to Right Outer Join. </p>
<pre class="pres">
select * from emp right join dept on emp.department = dept.department;
SAME AS
select * from emp right join dept using(department);
</pre>
<p><b>Inner Join :</b> It is equivalent to intersection of set base on condition. </p>
<pre class="pres">
select * from emp inner join dept on emp.department = dept.department;
SAME AS
select * from emp inner join dept using(department);
</pre>
<p><b>Natural Join :</b> Join where records are get on basis of common column from two tables. No need to specify the on condition. </p>
<pre class="pres">
select * from emp natural join dept;</pre>
<p><b>Natural Left join :</b> All records that are matched on the basis of common column and all unmatched records from 
left side table to statement. It is equivalent to Natural left Outer Join.</p>
<pre class="pres">select * from emp natural left join dept;</pre>
<p><b>Natural Right join :</b> All records that are matched on the basis of common column and all unmatched records from 
right side table to statement.  It is equivalent to Natural Right Outer Join. </p>
<pre class="pres">select * from emp natural right join dept;</pre>

        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>