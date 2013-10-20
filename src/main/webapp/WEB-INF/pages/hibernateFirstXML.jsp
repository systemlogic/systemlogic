<html>
<head>
<link href="/menu_assets/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="Header.jsp"%>
	<%@ include file="Menu.jsp"%>
	<table>
		<tr>
			<td valign="top" height="10px" width="222"><%@ include
					file="hibernateFirstAnnotationMenu.jsp"%>
			</td>
			<td></td>
			<td align="left" bordercolor="c41200">
				<h2>Hibernate</h2>
				<p>We have already seen hibernate example using Annotation. Let us see same example using xml configuration </p>
				<pre class="pres">
import java.util.Date;

public class BeanRepresentingTable implements java.io.Serializable{
	private static final long serialVersionUID = 1L;

	Integer idKey;
	Date date;
	public Integer getIdKey() {
		return idKey;
	}
	public void setIdKey(Integer idKey) {
		this.idKey = idKey;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
</pre>

<p>Above class represent java class equivalent to Table in Database. Mapping of class attribute to Table column is 
defined in different xml file say bean.xml . 
</p>

<pre class="pres">
&lt;?xml version="1.0"?&gt;
&lt;!DOCTYPE hibernate-mapping PUBLIC "-//Hibernate/Hibernate Mapping DTD 3.0//EN"
"http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd"&gt;
 
&lt;hibernate-mapping&gt;
    &lt;class name="com.bean.BeanRepresentingTable" table="BeanTableXML" &gt;
        &lt;id name="idKey" type="java.lang.Integer"&gt;
            &lt;column name="ID" /&gt;
        &lt;/id&gt;
        &lt;property name="date" type="java.util.Date"&gt;
            &lt;column name="Date" length="10" not-null="true" unique="true" /&gt;
        &lt;/property&gt;
    &lt;/class&gt;
&lt;/hibernate-mapping&gt;
</pre>
<p>Configuration file is modified little bit. Observe the change carefully.</p>
<pre class="pres">
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;!DOCTYPE hibernate-configuration PUBLIC
"-//Hibernate/Hibernate Configuration DTD 3.0//EN"
"http://hibernate.sourceforge.net/hibernate-configuration-3.0.dtd"&gt;
&lt;hibernate-configuration&gt;
    &lt;session-factory&gt;
        &lt;property name="hibernate.connection.driver_class"&gt;com.mysql.jdbc.Driver&lt;/property&gt;
        &lt;property name="hibernate.connection.url"&gt;jdbc:mysql://localhost:3306/databasename&lt;/property&gt;
        &lt;property name="hibernate.connection.password"&gt;password&lt;/property&gt;
        &lt;property name="hibernate.connection.username"&gt;user&lt;/property&gt;
        &lt;property name="hibernate.dialect"&gt;org.hibernate.dialect.MySQLDialect&lt;/property&gt;
        &lt;property name="show_sql"&gt;true&lt;/property&gt;
        &lt;property name="hibernate.hbm2ddl.auto"&gt;create-drop&lt;/property&gt;
        &lt;mapping resource="Bean.xml"&gt;&lt;/mapping&gt;
    &lt;/session-factory&gt;
&lt;/hibernate-configuration&gt;</pre>
<p>Let us write some code to obtain Session.</p>
<pre class="pres">
import org.hibernate.Session;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateSessionFactory {
	private Session session;
	
	public Session getSession() {
		return session;
	}
	@SuppressWarnings("deprecation")
	public HibernateSessionFactory() {
		session = new AnnotationConfiguration().
		configure("cusotmhibernate.cfg.xml").
		buildSessionFactory().openSession();
		//session = new AnnotationConfiguration().configure().buildSessionFactory().openSession(); 
		//In case File name is hibernate.cfg.xml
	}
	@Override
	protected void finalize() throws Throwable {
		super.finalize();
		session = null;
	}

}
</pre>

<p>Every thing is fine up to this point. Now lets update table with some records.</p>

<pre class="pres">
import java.util.Date;

import org.hibernate.Session;

import com.pattern.SessionFactory.HibernateSessionFactory;
import com.bean.BeanRepresentingTable;

public class HelloWorld {

	public static void main(String[] args) {
		BeanRepresentingTable brt ;
		Session session = new HibernateSessionFactory().getSession();
		session.beginTransaction();
		for(int index = 0 ; index < 10 ; index++){
			brt = new BeanRepresentingTable();
			brt.setDate(new Date());
			brt.setIdKey(Math.round((float)Math.random()*10000));
			session.save(brt);
			try{
			Thread.sleep(1000);
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
		}
		
		session.getTransaction().commit();
	}

}
 </pre>
 <p>After running the code please check the database as well.</p>
					<a
						href='https://github.com/systemlogic/HibernateHelloWorldAnnotation/archive/master.zip'><span>Download
							this Example</span></a>
				</p>
			</td>
			<%@ include file="rightPane.jsp"%>
		</tr>
	</table>
	<%@ include file="FooterLink.jsp"%>
	<%@ include file="Footer.jsp"%>
</body>
</html>