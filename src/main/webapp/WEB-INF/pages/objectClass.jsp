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
            <%@ include file="collectionMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Object Class</h2>
        	<p>There are couple of Object class method that we are going to discuss it here. These are toString(), hashCode(), equals(obj), finalize(),
        	wait(),notify(),notifyall().</p>
        	
        <h2>toString()</h2>
		<p>By any chance did you ever print the object in System.out.println(obj). Let us do it here now.</p>
		<h3>Writer.java</h3>
        	<pre class="pres">
class Writer{
	String fName;
	String lName;
	String books;
	public Writer(String f,String l,String b) {
		fName = f ;
		lName = l ;
		books = b ;
	}
	public static void main(String ...strings){
		Writer obj = new Writer("Rudyard","Kipling","The Jungle book, Just So Stories, Kim");
		System.out.println(obj);
	}
}</pre>
<p>Output for aforementioned program is Writer@89ffb18. Does't make any sense to me. Let us give some defination to toString by overriding and see the 
output.</p>
<h3>Writer.java</h3>
<pre class="pres">
class Writer{
	String fName;
	String lName;
	String books;
	public Writer(String f,String l,String b) {
		fName = f ;
		lName = l ;
		books = b ;
	}
	public static void main(String ...strings){
		Writer obj = new Writer("Rudyard","Kipling","The Jungle book, Just So Stories, Kim");
		System.out.println(obj);
	}
	public String toString(){
		return "Famous books by " + fName + " " + lName + " are " + books ;
	}
}</pre>
<p>The output on console is <b>Famous books by Rudyard Kipling are The Jungle book, Just So Stories, Kim</b> Make Sense? </p>
<h2>equals()</h2>
<p>What is the difference <b>==</b> and <b>equals</b>? In Java the arguments are always passed by value. Java only supports pass by value. when variable 
type is basic like int, float, long (String is complex type) the value passed is the value hold in the variable where as in complex type value passed 
is address of the object that it is referring to.</p>
<h3>equalTest.java</h3>
<pre class="pres">
class equalTest{
	public static void main(String ... arr){
		String a = new String("sun");
		String b = "sun";
		String c = "sun";
		System.out.println(a==b);  		// false	--> comparing reference
		System.out.println(b==c);  		// true		--> comparing value
		System.out.println(a.equals(c));	// true		--> comparing value	
	}
}</pre>

<p>So, in our case when we compare two variable of basic type holding same value using  <b>==</b> will return true where in case of complex type, variables are 
pointing to two different memory address will return false even if object variable contain same value. In order to run the equality check on complex variable or 
class object we have to give definition to equals method </p>
<h3>Writer.java</h3>
<pre class="pres">
class Writer{
	String fName;
	String lName;
	int booksWrote;
	public Writer(String f,String l,int b) {
		fName = f ;
		lName = l ;
		booksWrote = b ;
	}
	public static void main(String ...strings){
		Writer obj1 = new Writer("Rudyard","Kipling",100);
		Writer obj2 = new Writer("Rudyard","Kipling",100);
		System.out.println(obj1 == obj2);	// false	--> Object reference is compare
		System.out.println(obj1.equals(obj2));	// true		--> Object values are compared using override equals() method
	}
	@Override
	public boolean equals(Object obj) {
		Writer temp = (Writer)obj;
		return this.fName == temp.fName && this.lName == temp.lName && this.booksWrote == temp.booksWrote ;
	}
}</pre>

<h2>hashCode()</h2>
<p>Hashcodes are typically used to increase the performance of large collections of data stored in collection class whose 
name starts with hash{HashMap, HashTable, HashSet}. Hash value of an object decide to which bucket of collection the object will go.
We can define our own algorithm in hashCode() method to decide which bucket it should belong.</p>
<p>Whenever new entry is added to collection class it will first search right bucket using hashcode() and then search whether object 
is already there in that perticular bucket if it is not then it append the entry otherwise it won't add it.</p>
<h2>finalize(), wait(),notify(),notifyall()</h2>
<p>wait(), notify(), notifyall() will be discussed with Thread examples.</p>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>