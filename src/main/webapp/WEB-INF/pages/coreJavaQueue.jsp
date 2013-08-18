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
        	<h2>Queue </h2>
        	<p>Queue is abstract datatype which is based on First-In-First-Out data structure. Where Items are inserted at one end and are removed from other end. These operation are called as Enqueue, and Dequeue.</p>
        	We will implement generic Queue which will accept any type of single value at any instance of operation. These values need to maintain in some type of class object which can hold value passed and reference of same type of object to navigate forward and backward.</p>
        	<h3>IQueue.java</h3>
        	<pre class="pres">
package queue;
public interface IQueue< E > {
	public void enqueue(E t);
	public E dequeue();
}</pre>
        	<p>So how stack is implemented. The basic operation that Queue can supports is Enqueue an object and Dequeue an Object. Let us see the implementation.</p>
        	<h3>Queue.java</h3>
        	<pre class="pres">
package queue;
public class Queue< E > implements IQueue< E > {
	transient Node< E > first;
	transient Node< E > last;
	static class Node< E > {
	    E item;
	    Node< E > next;
	    Node< E > prev;
	    Node(Node< E > prev, E element, Node< E > next) {
	        this.item = element;
	        this.next = next;
	        this.prev = prev;
	    }
	}
	@Override
	public void enqueue(E t) {
		// TODO Auto-generated method stub
		if(first == null && last == null){
			final Node< E > newNode = new Node< E >(null, t, null);
			first = last = newNode;
		}else{
			final Node< E > newNode = new Node< E >(null, t, last);
			last.prev = newNode;
			last = newNode;
		}
	}
	@Override
	public E dequeue() {
		if(first == null && last == null){
			return (E)"Nothing to return";
		}else if(first == last){
			Node< E > temp = first;
			last = first = null;
			return temp.item;
		}else{
			Node< E > temp = first;
			first = first.prev;
			first.next = null;
			return temp.item;
		}
	}
}
</pre>
        	<p>At this level it is difficult to write JUnit but i am still showing JUnit code as you might be in position to write code in main function. </p>
        	<h3>QueueTest.java</h3>
        	<pre class="pres">
package queue;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class QueueTest {
	Queue queue ;
	@Before
	public void setUp() throws Exception {
		queue = new Queue();
		queue.enqueue(1);
		queue.enqueue(2);
		queue.enqueue(3);
	}

	@Test
	public void testEnqueue() {
		//assertEquals(,queue.enqueue(7));
		queue.enqueue(9);
		assertEquals(9, queue.last.item);
	}

	@Test
	public void testDequeue() {
		assertEquals(1,queue.dequeue());
		assertEquals(2,queue.dequeue());
		assertEquals(3,queue.dequeue());
		System.out.println(queue.dequeue());
	}

}</pre>
        	
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>