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
				<p>The good thing about Hibernate is one don't need to write any database query to any specific database.
				Configure the class file and play with java objects to save and retrieved anything to the database. </p>
				<p>Hibernate implementation coming in two flavour one is using XML and other is using Annotation.
				Here we will see how things can be done using Annotation.</p>
				
				<pre class="pres">
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(uniqueConstraints = {
		@UniqueConstraint(columnNames = "ID") }, name="BeanTableAnnotation")
public class BeanRepresentingTable implements java.io.Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="ID" ,unique=true ,nullable=false)
	Integer idKey;

	@Column(name="DATE",nullable=false)
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

<p>Above class maps java class to Table in Database. Now we need some database specific setting. In this example
we will use mysql install at local machine. Setting need to be stored in hibernate.cfg.xml or to some other name file. 
In later case we need to do some more configuration.
</p>

<pre class="pres">
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;!DOCTYPE hibernate-configuration PUBLIC
"-//Hibernate/Hibernate Configuration DTD 3.0//EN"
"http://hibernate.sourceforge.net/hibernate-configuration-3.0.dtd"&gt;
&lt;hibernate-configuration&gt;
    &lt;session-factory&gt;
        &lt;property name="hibernate.connection.driver_class"&gt;com.mysql.jdbc.Driver&lt;/property&gt;
        &lt;property name="hibernate.connection.url"&gt;jdbc:mysql://localhost:3306/databaseName&lt;/property&gt;
        &lt;property name="hibernate.connection.password"&gt;password&lt;/property&gt;
        &lt;property name="hibernate.connection.username"&gt;user&lt;/property&gt;
        &lt;property name="hibernate.dialect"&gt;org.hibernate.dialect.MySQLDialect&lt;/property&gt;
        &lt;property name="show_sql"&gt;true&lt;/property&gt;
        &lt;property name="hibernate.hbm2ddl.auto"&gt;create-drop&lt;/property&gt;
        &lt;mapping class="com.bean.BeanRepresentingTable"&gt;&lt;/mapping&gt;
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
		// In case File name is hibernate.cfg.xml
	}
	@Override
	protected void finalize() throws Throwable {
		super.finalize();
		session = null;
	}

}</pre>

<p>Every thing is fine up to this point. Now lets update table with some records.</p>

<pre class="pres">
import java.util.Date;
import org.hibernate.Session;
import com.Pattern.SessionFactory.HibernateSessionFactory;
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