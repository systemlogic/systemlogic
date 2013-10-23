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
            <%@ include file="ioserializationMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Serialization</h2>
        	<p>Serialization is process to create object graph, which will later saved to I/O classes and transfered over the medium or save it for later use. Each serialization process is associated deserialization.
        	Class object that need to be serialize need to implement Serializable interface which is also a marker interface. Member variables and static variables that are not marked as transient become part of object graph(serialize).</p>
<pre class="pres">
package serial;
import java.io.Serializable;
class SerializeClass implements Serializable{
	private int uid;
	private String firstName;
	private String lastName;
	private transient String mobile;
	private static String address;
	public SerializeClass(int ud,String fname,String lname,String mobile,String address) {
		this.uid = ud;
		this.firstName = fname;
		this.lastName = lname;
		this.mobile = mobile;
		this.address = address;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public static String getAddress() {
		return address;
	}
	public static void setAddress(String address) {
		SerializeClass.address = address;
	}

}</pre>
<p>Let us save the state of this class object, read it back and check what all cases are passed or failed.</p>
<pre class="pres">
package serial;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class SerialJUnit {
	static SerializeClass sc;
	static int uid=112233;
	static String fname="John";
	static String lname="Rambo";
	static String mobile = "099223344";
	static String address =  "India";
	ObjectInputStream ois;
	
	@BeforeClass
	public static void setSerializeObject() throws Exception{
		sc = new SerializeClass(uid,fname ,lname ,mobile ,address);
		FileOutputStream fos = new FileOutputStream("streamTest")	;
		ObjectOutputStream oos = new ObjectOutputStream(fos);
		oos.writeObject(sc);
	}
	@Before
	public void setUp() throws Exception {
		File f = new File("streamTest");
		assertTrue(f.exists());
		FileInputStream fis = new FileInputStream(f);
		ois = new ObjectInputStream(fis);
	}	
	@Test
	public void uidTest() throws Exception{
		SerializeClass obj = (SerializeClass)(ois.readObject());
		assertEquals(uid, obj.getUid());
		
	}
	@Test
	public void firstTest() throws Exception{
		SerializeClass obj = (SerializeClass)(ois.readObject());
		assertTrue(fname.equals(obj.getFirstName()));
		
	}
	@Test
	public void lastTest() throws Exception{
		SerializeClass obj = (SerializeClass)(ois.readObject());
		assertTrue(lname.equals(obj.getLastName()));
		
	}
	@Test
	public void mobileTest() throws Exception{
		SerializeClass obj = (SerializeClass)(ois.readObject());
		assertTrue(mobile.equals(obj.getMobile()));
	}
	@Test
	public void addressTest() throws Exception{
		SerializeClass obj = (SerializeClass)(ois.readObject());
		assertTrue(address.equals(obj.getAddress()));
	}
}
</pre>
<p>Mobile test case fails as variable marked as transient are not saved as object state and restored to null;</p>

<h2>serialVersionUID</h2>
<p>Each class is associated with serialVersionUID. If not defined compiler tag the class by it's own. Until now we have not seen significance of serialVersionUID in any class. 
Let us see one good example. </p>

<pre class="pres">
class TestSerial implements Serializable{
	private static final long serialVersionUID = 12L;
	public int a ;
	TestSerial(int aa){
		a = aa;	
	}
	TestSerial(){}
	int print(){return a;}
}</pre>

<p>We are going to serialize the object of above class. Let us write serialize and deserialize code in two different different file.</p>

<pre class="pres">
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
public class serial{
	public static void main(String... str) throws Exception{
		TestSerial a = new TestSerial(5);
		FileOutputStream fs = new FileOutputStream("file.out");
		ObjectOutputStream os = new ObjectOutputStream(fs);
		os.writeObject(a);
	}
}</pre>

<pre class="pres">
import java.io.FileInputStream;
import java.io.ObjectInputStream;
public class deserial{
	public static void main(String... str) throws Exception{
		FileInputStream in = new FileInputStream("file.out");
		ObjectInputStream oin = new ObjectInputStream(in);
		TestSerial lin = (TestSerial)oin.readObject();
		System.out.println(lin.print());
	}
}</pre>

<p>Until now everything is fine. Let us do following to see the output.</p>
<p>1. compile TestSerial.java</p>
<p>2. compile serial.java</p>
<p>3. compile deserial.java</p>
<p>4. Observe Console output</p>
<p>Everything will be fine on console. Now do following and observe the console.</p>
<p>1. compile TestSerial.java</p>
<p>2. compile serial.java</p>
<p>3. comment/change the serialVersionUID in TestSerial.java file</p>
<p>4. compile TestSerial.java</p>
<p>5. compile deserial.java</p>
<p>6. Observe Console output</p>

<p>It is always better to tag the class with serialVersionUID and have significance in <b>client/server environment</b> or <b>writing/reading file</b>.</p>
<h2>serialver</h2>
<p>To generate serialVersionUID one can use JDK serialver utility command ship with sdk and class should implements Serializable otherwise it will not genrate the one.</p>
<pre class="pres">
serialver className</pre>

        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>