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
            <%@ include file="concurrentMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Concurrent Collections</h2>
        	<p>Concurrent collections includes BlockingQueue, ConcurrentMap, ConcurrentNavigableMap, which further have class implementations. We will see one 
        	simple example of ArrayBlockingQueue which implements BlockingQueue.</p>
<pre class=pres>
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;

class Producer implements Runnable {
	private final BlockingQueue queue;
	Producer(BlockingQueue q) { queue = q; }
	public void run() {
		try {
			for(int index = 0 ; index < 12 ; index++){
				 queue.put(produce());
				 System.out.println(queue.size());
			}
		} catch (InterruptedException ex) {}
	}
	Object produce() {return new Object();  }
}

class Consumer implements Runnable {
	private final BlockingQueue queue;
	Consumer(BlockingQueue q) { queue = q; }
	public void run() {
		try {
			while (true) { consume(queue.take()); 
			System.out.println(queue.size());
			}
		} catch (InterruptedException ex) { }
	}
	void consume(Object x) {  }
}

public class TryLock {
	public static void main(String...strings) throws Exception{
		BlockingQueue q = new ArrayBlockingQueue(10);
		Producer p = new Producer(q);
		new Thread(p).start();
		Thread.sleep(1000);
		remove(q);
	}
	static void remove(BlockingQueue q) throws Exception{
		Object o = q.take();
		Thread.sleep(1000);
		o = q.take();
		System.out.println(q.size());
		Thread.sleep(1000);
		o = q.take();
		System.out.println(q.size());
		Thread.sleep(1000);
		o = q.take();
		System.out.println(q.size());
		Thread.sleep(1000);
		o = q.take();
		System.out.println(q.size());
		Thread.sleep(1000);
		o = q.take();
		System.out.println(q.size());
	}
}</pre>
<p>Here maximum size of queue is set to 10, further addition to queue wait until element is remove and capacity is bring down to 9. Element will be added and 
wait again for element to add.</p>
<p>Other implementation of blocking queues are DelayQueue, LinkedBlockingDeque, LinkedBlockingQueue, LinkedTransferQueue, PriorityBlockingQueue, SynchronousQueue.</p>
        	
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>