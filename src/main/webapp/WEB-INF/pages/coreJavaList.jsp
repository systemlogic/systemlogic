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
        	<h2>Linklist </h2>
        	<p>Linklist is one of the common data structure which is widely used and simple as maintaining element in sequence.</p>
        	<p>We will implement generic Linklist which will accept any type of value at any instance of operation. These values need to maintain in some type of class object which can hold value passed and reference of same type of object</p>
        	<h3>ILinkList.java</h3>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
package linklist;
public interface ILinkList< E,N > {
	public void insertAfter(E e,N n);
	public void insertBefore(E e,N n);
	public void insertBeginning(E e);
	public void insertEnd(E e);
	public E remove(N n);
}</pre>
<h3>LinkList.java</h3>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
/**
 * 
 */
package linklist;


/**
 * @author arorah1
 *
 */
public class Linklist< E, N > implements ILinkList< E, N > {

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

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void insertAfter(E e,N n){
		Node temp = (Node)n;
		if(n!=null){
			final Node< E > newNode = new Node< E >(temp, e, temp.next);
			temp.next.prev = newNode;
			temp.next = newNode;
		}
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public void insertBefore(E e,N n){
		Node temp = (Node)n;
		if(n!=null){
			final Node< E > newNode = new Node< E >(temp.prev, e, temp);
			temp.prev.next = newNode;
			temp.prev = newNode;
		}
	}
	@Override
	public void insertBeginning(E e){
		insert(e,true);
	}
	@Override
	public void insertEnd(E e){
		insert(e,false);

	}
	private void insert(E e,Boolean bignning ){
		if(first == null && last == null){
			final Node< E > newNode = new Node< E >(null, e, null);
			first = last = newNode;
		}else if(bignning){
			final Node< E > newNode = new Node< E >(null, e, first);
			first.prev = newNode ;
			first = newNode;
		}else if(!bignning){
			final Node< E > newNode = new Node< E >(last, e, null);
			last.next = newNode ;
			last = newNode;
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public E remove(N n){
		E e = null;
		Node temp ;
		if(first != null && last != null && first == last){
			e = first.item ;
			first = last = null;
		}else if(n == last){
			temp = last;
			e = last.item;
			last = last.prev;
			last.next = null;
		}else if(n == first){
			temp = first ;
			e = first.item;
			first = first.next;
			first.prev = null;
		}else{
			temp = (Node)n;
			e = (E) temp.item;
			temp.prev.next = temp.next;
			temp.next.prev = temp.prev;
		}
		temp = null;
		return e;
	}
}</pre>
        	<p>In Linklist data can be inserted at any where and can be removed as well from anywhere.</p>
        	<h3>LinklistTest.java</h3>
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
/**
 * 
 */
package linklist;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

/**
 * @author arorah1
 *
 */
public class LinklistTest {
	@SuppressWarnings("rawtypes")
	Linklist link;
	/**
	 * @throws java.lang.Exception
	 */
	@SuppressWarnings("rawtypes")
	@Before
	public void setUp() throws Exception {
		link = new Linklist();
	}

	@SuppressWarnings("unchecked")
	private Object prepareList(){
		link.insertBeginning(5);
		link.insertBeginning(3);
		link.insertBeginning(1);
		return link.first.next;
	}
	/**
	 * Test method for {@link linklist.Linklist#insertAfter(java.lang.Object, java.lang.Object)}.
	 */
	@SuppressWarnings("unchecked")
	@Test
	public void testInsertAfter() {
		link.insertAfter(4, prepareList());
		assertEquals(4, link.last.prev.item);
	}

	/**
	 * Test method for {@link linklist.Linklist#insertBefore(java.lang.Object, java.lang.Object)}.
	 */
	@SuppressWarnings("unchecked")
	@Test
	public void testInsertBefore() {
		link.insertBefore(2, prepareList());
		assertEquals(2, link.first.next.item);
	}

	/**
	 * Test method for {@link linklist.Linklist#insertBeginning(java.lang.Object)}.
	 */
	@SuppressWarnings("unchecked")
	@Test
	public void testInsertBeginning() {
		link.insertBeginning(1);
		link.insertBeginning(2);
		link.insertBeginning(3);
		assertEquals(3, link.first.item);
	}

	/**
	 * Test method for {@link linklist.Linklist#insertEnd(java.lang.Object)}.
	 */
	@SuppressWarnings("unchecked")
	@Test
	public void testInsertEnd() {
		link.insertEnd(3);
		link.insertEnd(2);
		link.insertEnd(1);
		assertEquals(1, link.last.item);
	}

	/**
	 * Test method for {@link linklist.Linklist#remove(java.lang.Object)}.
	 */
	@Test
	public void testRemove() {
		prepareList();
		assertEquals(link.remove(link.first.next),3);
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