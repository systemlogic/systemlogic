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
        	<h2>Select Quaries</h2>
        	<p>Before you fire any select query let us insert data to the table. Also observe the different way to insert the data.</p>
<pre class="pres">
INSERT INTO dept VALUES('10','Human Resource');
INSERT INTO dept VALUES('11','Engineering');
INSERT INTO dept VALUES('12','Research and Development');
INSERT INTO dept VALUES('13','Finance');
INSERT INTO dept VALUES('14','Development and Engineering');
INSERT INTO dept VALUES('15','Inventory');
INSERT INTO dept VALUES('16','Information Technology');


INSERT INTO emp (EmpId, FirstName, LastName, department) 
	  VALUES(1000,'Rohit','Sharama','10');
INSERT INTO emp (EmpId, FirstName, LastName, department,Salary) 
	  VALUES(1001,'Fahad','Sayeed','11',20000);
INSERT INTO emp (EmpId, FirstName, LastName, department,Salary,Sex) 
	  VALUES(1002,'Poornima','Loganathan','12',23000,'Female');
INSERT INTO emp (EmpId, FirstName, LastName, department,Salary,Sex) 
	  VALUES(1003,'Rakesh','Misra','13',19000,'Others');
INSERT INTO emp VALUES(1004,'Ashwini','Rajanna',20000,14,'Female');
INSERT INTO emp (EmpId, FirstName, LastName, department,Salary) 
	  VALUES(1004,'Raktim','Paul','11',22200);
INSERT INTO emp (EmpId, FirstName, LastName, department,Salary,Sex) 
	  VALUES(1005,'Radha','Mahadevaia','12',18000,'Female');
INSERT INTO emp (EmpId, FirstName, LastName, department,Salary,Sex) 
	  VALUES(1006,'Sarv','sarvnana','13',29000,'Male');
INSERT INTO emp VALUES(1007,'Sushma','Kar',20000,14,'Female');
</pre>

<p>Either copy and paste the data directly into the mysql wizard or save the data in somefile say table.sql and run the following command. The later 
case is more preffered when data that need to feed is very big and buffer is not suffice the copy data.</p>
<pre class="pres">
source location_of_file/table.sql
</pre>
<p>Now we are ready to run some select Queries. Let us write simplest query.</p>
<pre class="pres">
select * from dept;
select * from emp;
</pre>
<p>Select all female employee data.</p>
<pre class="pres">
SELECT * FROM emp WHERE Sex like 'Female';
</pre>
<p>Getting Male employee data will be same. Let us get data for Sex that are Male or Female but not Others.</p>
<pre class="pres">
select * from emp where Sex like '%Male';
select * from emp where Sex in ('Male','Female');</pre>
<p>Let us complicate the query. Get All Male and Female employee whose salary is greater then 20000.</p>
<pre class="pres">select * from emp where Sex in ('Male','Female') and Salary > 20000;
</pre>
<p>What if we are concern about only few column of the result.</p>
<pre class="pres">
select EmpId,Salary,department from emp where Sex in ('Male','Female') and Salary > 20000;</pre>
<p>How about showing meaningful column name.</p>
<pre class="pres">
select etable.EmpId as ID, etable.Salary as Salary ,etable.department as 'Department Id' 
from emp etable where etable.Sex in ('Male','Female') and etable.Salary > 20000;</pre>
<p>Get data from two different table.</p>
<pre class="pres">
select * from emp,dept;
</pre>
<p>This will get result in NxM rows and all columns from both tables. where N is rows in emp table and M is row in dept table. Let us get record where 
employee belongs to some department in dept table.</p>
<pre class="pres">select * from emp,dept where emp.department=dept.department;
</pre>
<p>Only few columns from two different tables.</p>
<pre class="pres">
select emp.EmpId,emp.FirstName,dept.description from emp,dept where emp.department=dept.department;</pre>
<p>But interesting more if name will appear as single column as Name for FirstName and LastName.</p>
<pre class="pres">
select e.EmpId as ID ,CONCAT(e.LastName, ', ' , e.FirstName) as Name ,d.description as Department 
from emp e,dept d where e.department=d.department;
</pre>
<p>It will be good to see data in order by ascending or descending. By default it is ascending and no need to specify ASC in query.</p>
<pre class="pres">
select e.EmpId as ID ,CONCAT(e.LastName, ', ' , e.FirstName) as Name ,d.description as Department  
from emp e,dept d where e.department=d.department order by d.description DESC;</pre>
<p>Let group the data based on some column which need aggrigate function in congestion with it.Count Total Salary drawn by employee in each department.</p>
<pre class="pres">
Select department, SUM(Salary) as Amount from emp group by department;</pre>
<p>And average Salary in each department.</p>
<pre class="pres">
select department, AVG(Salary) as Average from emp group by department;</pre>
<p>There are many other Aggrigate function to use with group by.</p>
<p>group by statement is come with condition statement having which where statement can not do.</p>
<pre class="pres">
select department,sum(Salary) from emp group by department having sum(Salary) > 20000;
select department,sum(Salary) from emp where department like '12' group by department having sum(Salary) > 20000;</pre>
<p>Do you think your query is coping up with really big set of rows and taking time? Use Index that defined earlier in create table.</p>
<pre class="pres">
select * from emp use index(indexing);
</pre>
<p>But one should know what all indexes has been created over the period of time, So over indexing  wasting of disk space 
and will slow the database down on write.</p>
<pre class="pres">show index from emp;</pre>
<p>Now days Application bring pageful information when scroll down another pagefull information will be pulled,
and addup to current page.So how to do it.</p>
<pre class="pres">
select * from emp use index(indexing) limit 0,5;
</pre>
<p>where 0 is start index and 5 is number of rows to be retrived.</p>


        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>