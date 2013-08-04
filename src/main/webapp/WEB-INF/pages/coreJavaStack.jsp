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
            <%@ include file="coreJavaMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Stack </h2>
        	<p>Java is providing Stack class library implementation still we will dig into the code and see how it can be implementedStack is based on Last in First Out(LIFO) and all operation is done from one end.</p>
        	We will implement generic stack which will accept any type of single value at any instance of operationThese values need to maintain in some type of class object which can hold value passed and reference of same type of object</p>
        	<h3>T.java</h3>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
package com;
public interface T {
}</pre>
<h3>Node.java</h3>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
package com;
public class Node implements T {
	Node node;
	Object obj;
}</pre>
        	<p>So how stack is implemented. The basic operation that stack can supports is Push an object and pop the top most object. Let us see the implementation.</p>
        	<h3>stk.java</h3>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
package com;
public interface stk {
	public void push(Object t);
	public Object pop() throws Exception;

}</pre>
<h3>STACK.java</h3>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
package com;
public class STACK implements stk {
	T top;
	public STACK(){
		top = null;
	}
	@Override
	public void push(Object t) {
		// TODO Auto-generated method stub
		Node n = new Node();
		n.obj = t ;
		if(top == null){
			top = n ;
		}else{
			n.node = (Node)top;
			top = n;
		}
	}
	@Override
	public Object pop() throws Exception{
		T temp = top ;// TODO Auto-generated method stub
		if(((Node)top) == null){
			return "Stack is empty";
		}else if(((Node)top).node == null){
			top = null;
		}else if(((Node)top).node != null){
			top = ((Node)top).node;
		}
		return ((Node)temp).obj;
	}
}
</pre>
        	<p>At this level it is difficult to write JUnit but i am still showing JUnit code as you might be in position to write code in main function. </p>
        	<h3>STACKJunit.java</h3>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
/**
 * 
 */
package com;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 * @author arorah1
 *
 */
public class STACKJunit {
	STACK stk;
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		stk = new STACK();
		stk.push(1);
		stk.push(2.1);
		stk.push(3.1F);
		stk.push("Hello");
	}

	/**
	 * @throws java.lang.Exception
	 */
	
	@Test
	public void testPush() throws Exception{
		stk.push("element");
		assertEquals("element", stk.pop());
	}

	/**
	 * Test method for {@link com.STACK#pop()}.
	 */
	@Test
	public void testPop() throws Exception{
		assertEquals("Hello", stk.pop());
	}

}
</pre>
        	<p>Now let us see how Java stack lib can be used for the same purpose.</p>
        	<h3>StackTest.java</h3>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
package com;
import java.util.Stack;
public class StackTest {
	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		Stack stk = new Stack();
		stk.push(1);
		stk.push(2);
		System.out.println(stk.pop());
	}
}
</pre>
        	
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>