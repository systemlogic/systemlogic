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
            <%@ include file="jUnitMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>JUnit Test</h2>
        	<p>At this point many JUnit code has already been used. Let us write one simple JUnit code and class need to be test on editor.</p>
<pre class="pres">
package JUnitTest;
public class ObserveClass {
	private String firstName;
	private String lastName;
	ObserveClass(String fName,String lName){
		firstName = fName;
		lastName  = lName;
	}
	public String toString(){
		return "My name is " + firstName + " " + lastName;
		
	}
}</pre>
<p>Above class sets firstName and lastName and do some business logic in toString() method. Now, let's write JUnit for this class to test toString method result which 
will be <b>My name is {firstName} {lastName}</b>.</p>
<pre class="pres">
package JUnitTest;
import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
public class ObserverJUnit {
	ObserveClass obj ;
	@Before
	public void before(){
		obj = new ObserveClass("John", "Rambo");
	}
	@Test
	public void obJectTest1(){
		assertTrue("My name is John Rambo".equals(obj.toString()));
		//This case will pass
	}
	@Test
	public void obJectTest2(){
		assertTrue("My name is Rambo John".equals(obj.toString()));
		//This case will fail
	}
	@Ignore
	public void objectTest3(){
		assertTrue("My name is John Rambo".equals(obj.toString()));
		//This case will be ignored
	}
}
</pre>
<p>Why don't we test cases from terminal.</p>
<pre class="pres">
java -cp /media/Harsh/HeliosSDK/work/StackImp/bin:
/home/arorah1/.m2/repository/junit/junit/4.8.2/junit-4.8.2.jar org.junit.runner.JUnitCore JUnitTest.ObserverJUnit

//output on console 
//FAILURES!!!
//Tests run: 2,  Failures: 1
</pre>
<p>Aforementioned class is having only two test case which are mark with <b>Test</b> annotation. There are some more annotation that need to be understand.</p>
<table bordercolor="gray"  border="1">
<tr ><th>Annotation</th><th>Desctiption</th></tr>
<tr><td>@Test public void method()</td><td>The annotation @Test identifies that a method is a test method.</td></tr>
<tr><td>@Test(timeout=100) public void method()</td><td>The annotation @Test identifies that a method is a test method.</td></tr>
<tr><td>@Before public void method()</td><td>This method is executed before each test. This method can prepare the test environment (e.g. read input data, initialize the class).</td></tr>
<tr><td>@BeforeClass public static void method()</td><td>This method is executed once, before the start of all tests. This can be used to perform time intensive activities, for example to connect to a database. Methods annotated with this annotation need to be defined as static to work with JUnit.</td></tr>
<tr><td>@After public void method()</td><td>This method is executed after each test. This method can cleanup the test environment (e.g. delete temporary data, restore defaults). It can also save memory by cleaning up expensive memory structures.</td></tr>
<tr><td>@AfterClass public static void method()</td><td>This method is executed once, after all tests have been finished. This can be used to perform clean-up activities, for example to disconnect from a database. Methods annotated with this annotation need to be defined as static to work with JUnit.</td></tr>
<tr><td>@Ignore public void method()</td><td>Fails, if the method takes longer than 100 milliseconds.</td></tr>
</table>

<p>Let us do JUnit Eclipse Way. Select class > new (JUnit) > type in JUnit class name and select method of the class need to be test. Write in assert condition as mention in aforementioned code.</p>
<img  src="/images/JUintEclipseway.png"/>
<p>Observe the JUnit console by running JUnit test class</p>
<img src="/images/JUnitConsole.png">
<p>Test method of JUnit class that can be used in Test case.</p>
<table bordercolor="gray"  border="1">
<tr ><th>Method</th><th>Desctiption</th></tr>
<tr><td>fail(String)</td><td>Let the method fail. Might be used to check that a certain part of the code is not reached. Or to have a failing test before the test code is implement.</td></tr>
<tr><td>assertTrue([message], boolean condition)</td><td>Checks that the boolean condition is true.</td></tr>
<tr><td>assertsEquals([String message], expected, actual)</td><td>Tests that two values are the same. Note: for arrays the reference is checked not the content of the arrays.</td></tr>
<tr><td>assertsEquals([String message], expected, actual, tolerance)</td><td>Test that float or double values match. The tolerance is the number of decimals which must be the same.</td></tr>
<tr><td>assertNull([message], object)</td><td>Checks that the object is null.</td></tr>
<tr><td>assertNotNull([message], object)</td><td>Checks that the object is not null.</td></tr>
<tr><td>assertSame([String], expected, actual)</td><td>Checks that both variables refer to the same object.</td></tr>
<tr><td>assertNotSame([String], expected, actual)</td><td>Checks that both variables refer to different objects.</td></tr>
</table>
	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>