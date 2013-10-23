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
            <%@ include file="creationalMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Object Pool Design Pattern</h2>
        	<p>My Employer ask all employees to do car pooling, however all those who have car can afford fuel as well. 
        	So what is the notion of car pooling? Less number of cars on road means less traffic and less headache. So 
        	anything that can be pooled reduced the overhead. Lets jump back to computer example, even a very good server 
        	with high configuration is helpless when thousand or lakh requests will come in very short span and these 
        	request want some operation say database access/menipulation. If all request will be let to perform operation 
        	then database may crash since database access is always an expensive operation. So what can be done in such 
        	situation? Just let only limited number of thread to operate at any given time. This limited number is 
        	<b>Pool</b>.</p>
<pre class="pres">
&lt;bean id="<b>dataSource</b>" destroy-method="close"
 class="org.apache.commons.dbcp.BasicDataSource"&gt;
	&lt;property name="driverClassName" value="${mysql.driver}" /&gt;
	&lt;property name="url" value="${mysql.url}" /&gt;
	&lt;property name="username" value="${mysql.user}" /&gt;
	&lt;property name="password" value="${mysql.password}" /&gt;
	&lt;property name="initialSize" value="3"/&gt;
	&lt;property name="maxActive" value="3"&gt;&lt;/property&gt;
&lt;/bean&gt;
</pre>
<p>At any given time Maximum of 3 database connection can be made if data source with id <b>dataSource</b> will be used.</p>
        	
        	<p>Does Pooling is restricted to Database only? <b>No.</b> Any resource that need to be access by many thread at
        	the same need to be pooled for optimized resource utilization. Java is doing this with Executor framework in concurrent 
        	package. So How it can be implemented in any language? One need to maintain Queue which keep track of all jobs in sequence,
        	and  fixed sized of array(pool) of object for parallel processing.</p>
<pre class="pres">
ExecutorService executor = Executors.newFixedThreadPool(10);
   for (int i = 0; i < 500; i++) {
     Runnable worker = new MyRunnable(10000000L + i); // where MyRunnable implements Runnable
     executor.execute(worker);
   }
   executor.shutdown();</pre> 
<p>At any given period of time only maximum of 10 thread will be executed.</p>          	
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>