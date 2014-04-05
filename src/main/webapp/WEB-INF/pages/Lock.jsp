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
        	<h2>Lock</h2>
        	<p>Lock objects work very much like the implicit locks used by synchronized code. The advantage of using 
        	Lock object is to back out of an attempt to acquire lock.</p>
<pre class=pres>
import java.util.Random;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class TryLock {
	int value = 0;
	private final Lock lock = new ReentrantLock();

	private void print(){
		try{
			this.lock.lock();
			System.out.println(Thread.currentThread().getName() + "   " + value++);
		}finally{
			this.lock.unlock();
			System.out.println(Thread.currentThread().getName() + "   " + value++);
		}
	}

	public static void main(String...strings){
		TryLock tl = new TryLock();
		Thread t1 = new Thread(new writer(tl));
		Thread t2 = new Thread(new writer(tl));
		t1.setName("Thread-1");
		t2.setName("Thread-2");

		t1.start();
		t2.start();

	}
	static class writer implements Runnable{
		TryLock tl ;
		writer(TryLock tl){
			this.tl = tl;

		}
		public void run() {
			Random random = new Random();
			for (;;) {
				try {
					Thread.sleep(random.nextInt(1000));
				} catch (InterruptedException e) {}
				tl.print();
			}
		}
	}

}


</pre>
<p>If one thread is already obtain the lock, the other thread will wait until first thread release the lock. </p>
        	
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>