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
        	<h2>Create Table</h2>
        	<p>At this point you have database. What you will do with Empty database let us create some tables</p>
<pre class="pres">create table Table_Name(ColumnName varchar(20));</pre>
<p>After creating table always run describe command to see the structure of the table.</p>
<pre class="pres">desc Table_Name</pre>
<p>In case table is not appropriate and need to be redefined drop it and create it again.</p>
<pre class="pres">drop table Table_Name;</pre>
<p>Why not create some table which represent real time entity in the world say dept represent department.</p>
<pre class="pres">
create table dept(
department varchar(20),
description varchar(100)
);</pre>
<p>Any problem? Primary key is not defined.</p>
<pre class="pres">
create table dept(
department varchar(20),
description varchar(100),
primary key(department) 
);</pre>
<p>Primary key can not be null but at the same time you don't want descrition to have null value</p>
<pre class="pres">
create table dept(
department varchar(20),
description varchar(100) NOT NULL,
primary key (department)
);</pre>
<p>Any person who join the company should be in any of the department defined just now. Which also means we have to refer
dept primary key into emp table and this is called CONSTRAINT on table.</p>
<pre class="pres">
create table emp(
EmpId int,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
department varchar(20),
primary key(EmpId),
constraint foreign key(department) references dept(department)
);</pre>
<p>Need to define one constraint which allow table to accept EmpId always greater then 9999.</p>
<pre class="pres">
create table emp(
EmpId int,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
department varchar(20),
primary key(EmpId),
constraint foreign key(department) references dept(department)
);</pre>
<p>Table emp make sure no employee record will be added with department that is not present in dept table.</p>
<p>What about auto increment for EmpId which will get next available number in the sequence.</p>
<pre class="pres">
create table emp(
EmpId int NOT NULL AUTO_INCREMENT,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
Salary int NOT NULL default 0,
department varchar(20),
Sex ENUM('Male', 'Female', 'Others') NOT NULL default 'Male',
primary key(EmpId),
constraint foreign key(department) references dept(department)
);</pre>
<p>How about using Database Engines</p>
<pre class="pres">
create table emp(
EmpId int NOT NULL AUTO_INCREMENT,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
Salary int NOT NULL default 0,
department varchar(20),
Sex ENUM('Male', 'Female', 'Others') NOT NULL default 'Male',
primary key(EmpId),
constraint foreign key(department) references dept(department)
) engine=InnoDB;</pre>
<p>So here is the question is, What is database engine and what it's significance? Storage engine provides different storage 
mechanism to sotre data in file, indexing, locking mechanism and other different technique. For Example InnoDB is optamised 
for transaction and row level locking.</p>
<p>Let see what all engines are available.</p>
<pre class="pres">show engines;
+--------------------+---------+----------------------------------------------------------------+--------------+
| Engine             | Support | Comment                                                        | Transactions |
+--------------------+---------+----------------------------------------------------------------+--------------+
| MRG_MYISAM         | YES     | Collection of identical MyISAM tables                          | NO           |
| CSV                | YES     | CSV storage engine                                             | NO           |
| MEMORY             | YES     | Hash based, stored in memory, useful for temporary tables      | NO           |
| BLACKHOLE          | YES     | /dev/null storage engine (anything you write to it disappears) | NO           |
| MyISAM             | YES     | MyISAM storage engine                                          | NO           |
| FEDERATED          | NO      | Federated MySQL storage engine                                 | NULL         |
| ARCHIVE            | YES     | Archive storage engine                                         | NO           |
| InnoDB             | DEFAULT | Supports transactions, row-level locking, and foreign keys     | YES          |
| PERFORMANCE_SCHEMA | YES     | Performance Schema                                             | NO           |
+--------------------+---------+----------------------------------------------------------------+--------------+</pre>
<p>When data grows into the table drastically response time to retrieve data is increased. What we need is indexing on 
table to retrieve it fast. Let's define indexing on table.</p>
<pre class="pres">
create table emp(
EmpId int NOT NULL AUTO_INCREMENT,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
Salary int NOT NULL default 0,
department varchar(20),
Sex ENUM('Male', 'Female', 'Others') NOT NULL default 'Male',
primary key(EmpId),
constraint foreign key(department) references dept(department), 
index indexing(EmpId)
) engine=InnoDB; 

OR

create index indexing on emp(EmpId);
</pre>


        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>