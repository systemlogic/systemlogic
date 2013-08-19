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
            <%@ include file="springDataAccessMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>JDBC</h2>
        	<p>What we have to do and what spring does.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
	<table border="1" >
		<tr><th>Action</th><th>spring</th><th>You</th></tr>
		<tr><td>Define connection parameters.</td><td></td><td>X</td></tr>
		<tr><td>Open the connection.</td><td>X</td><td></td></tr>
		<tr><td>Specify the SQL statement.</td><td></td><td>X</td></tr>
		<tr><td>Declare parameters and provide parameter values</td><td></td><td>X	</td></tr>
		<tr><td>Prepare and execute the statement.</td><td>X</td><td></td></tr>
		<tr><td>Set up the loop to iterate through the results (if any).</td><td>X</td><td></td></tr>
		<tr><td>Do the work for each iteration.</td><td></td><td>X</td></tr>
		<tr><td>Process any exception.</td><td>X</td><td></td></tr>
		<tr><td>Handle transactions.</td><td>X</td><td></td></tr>
		<tr><td>Close the connection, statement and resultset.</td><td>X</td><td></td></tr>
	</table>
</pre>
      <p>Defining coneection</p>
      <pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
mysql.driver=com.mysql.jdbc.Driver
mysql.url=jdbc:mysql://localhost:3306/systemlogic
mysql.user=root
mysql.password=rain</pre>
<p>Defining Entry in xml configuration file.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;bean id="jdbctemplete" class="org.springframework.jdbc.core.JdbcTemplate"&gt;
	&lt;constructor-arg index="0"&gt;&lt;ref bean="dataSource"/&gt;
	&lt;/constructor-arg&gt;
&lt;/bean&gt;
	
&lt;bean id="dataSource" 
         class="org.springframework.jdbc.datasource.DriverManagerDataSource"&gt;
		&lt;property name="driverClassName" value="&#36;{mysql.driver}" /&gt;
		&lt;property name="url" value="&#36;{mysql.url}" /&gt;
		&lt;property name="username" value="&#36;{mysql.user}" /&gt;
		&lt;property name="password" value="&#36;{mysql.password}" /&gt;
&lt;/bean&gt;
&lt;context:property-placeholder location="/WEB-INF/jdbc.properties"/&gt;</pre>
<p><b>Open Connection : </b> Spring will take care of opening the connection just specify below code.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
@Autowired
@Qualifier("jdbctemplete")
private JdbcTemplate jdbctemp;
</pre>
<p><b>Specify SQL Statement, Declare parameters and provide parameter values, Prepare and execute the statement : </b> </p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
public String getDepts(){
	String sql = "SELECT * FROM dept";
	List&lt;Dept&gt; dept = jdbctemp.query(sql,new DeptRowMapper());
	String result = "&lt;Departmets&gt;";
	for(Dept dep : dept){
		result += "\n\t\t&lt;Dept&gt;" +
		"\n\t\t\t&lt;department&gt;" + dep.getDepartment()+ "&lt;/department&gt;" +
		"\n\t\t\t&lt;deptDesc&gt;" + dep.getDeptDesc()+ "&lt;/deptDesc&gt;"+
		"\n\t\t&lt;/Dept&gt;" ;
	}
	
	return result + "\n\t&lt;/Departmets&gt;";
}
public String getDept(String id){
	String sql = "SELECT * FROM dept WHERE department=?";
	Dept dept = jdbctemp.queryForObject(
			sql, new Object[] { id }, new DeptRowMapper());
	return "&lt;Dept&gt;" +
	"\n\t\t&lt;department&gt;" + dept.getDepartment()+"&lt;/department&gt;" +
	"\n\t\t&lt;deptDesc&gt;" + dept.getDeptDesc() + "&lt;/deptDesc&gt;"+
	"\n\t&lt;/Dept&gt;" ;
}
public String postDept(String id,String desc){
	String sql = "INSERT INTO dept(department,DeptDesc) values (?,?)";
	int k = jdbctemp.update(sql,new Object[] {id, desc});
	return "&lt;Result&gt;" + k + " Record has been successfully Inserted to database"+ 
			"&lt;/Result&gt;";
}
public String putDept(String id,String desc){
	String sql = "UPDATE dept set DeptDesc=? WHERE department=?";
	int k = jdbctemp.update(sql, new Object[] {desc,  id});
	return "&lt;Result&gt;" + k + " Record has been successfully Updated in database"+ 
			"&lt;/Result&gt;";
}
public String deleteDept(String id){
	String sql = "DELETE FROM dept WHERE department=?";
	int k = jdbctemp.update(sql, new Object[] { id});
	return "&lt;Result&gt;" + k + " Record has been Deleted successfully from database"+ 
			"&lt;/Result&gt;";
}</pre>
        <p>Observe instance of DeptRowMapper is passed. It is used to set and menupulate the Dept object which is later used to return values to the client.</p>
        
        <p><b>Dept Table operations</b></p>
				<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
				<table border="1" >
					<tr><th>path</th><th>Request Type</th><th>Description</th></tr>
					<tr><td>/dept</td><td>GET</td><td>Get all department</td></tr>
					<tr><td>/dept/{id}</td><td>GET</td><td>Get information pertaining to specified Department id</td></tr>
					<tr><td>/dept/{deptid}/{deptDesc}</td><td>POST</td><td>Add specified Department to Database</td></tr>
					<tr><td>/dept/{deptid}/{deptDesc}</td><td>PUT</td><td>Change the specified Department in Database</td></tr>
					<tr><td>/dept/{id}</td><td>Delete</td><td>Delete the department identified by id</td></tr>
				</table></pre>
				<p> <b>Base URL :</b> <a href='http://restapp.systemlogic.cloudbees.net'><span>http://restapp.systemlogic.cloudbees.net</span></a></p>
				<p><a href='https://github.com/systemlogic/RestApp/archive/master.zip'><span>Download this Example</span></a></p>
        </td>
        
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>