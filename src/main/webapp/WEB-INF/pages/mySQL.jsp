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
        	<h2>Create Database</h2>
        	<p>Installation is as simple as counting 1,2,3</p>
        	<pre class="pres">
sudo apt-get install mysql-server
</pre>
<p>Once installation is done Login to mysql prompt using following command. It will prompt for password.Where <b>root</b> is the user of mysql while installing</p>
<pre class="pres">
mysql -u root -p
</pre>
<p>Once you are in, you won't be having any Database. Let us create some database that we are going to loged in and perfoeming other operations.</p>
<pre class="pres">
create database database_name;
</pre>
<p>For some reason you have created the database but forgot what database you have created.</p>
<pre class="pres">show databases;</pre>
<p>At the same time if you want to drop the database.</p>
<pre class="pres">
drop database databse_name;</pre>	
<p>If you have logged in to the system without selecting database then use below command to select the database you are going to work.</p>
<pre class="pres">
use database_name;
</pre>
<p>In case you have database and want to select while login.</p>
<pre class="pres">
mysql -u root -p database_name;
</pre>
<p>You are into the database and want to see what all tables are present</p>
<pre class="pres">
show tables;
</pre>
<p>You have seen the table list however you want to see the structure of any particular table.</p>
<pre class="pres">desc TABLE_NAME;</pre>

        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>