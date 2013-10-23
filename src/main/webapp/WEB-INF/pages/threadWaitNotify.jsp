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
            <%@ include file="threadMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>wait, notify</h2>
        	<p>wait(), notify(), and notifyAll() all are Object class method that help threads communicate about the status of an 
        	event that the threads care about. When thread locks an object. When it is running, waiting, sleeping or Monitoring? </p>
        	<p>wait() method is always called from synchronized block which means thread acquires lock before it executes wait() 
        	method on object. So what really happen when it executes wait(), It simply release the lock. Let us understand it with example</p>
        	<pre class="pres">
import java.util.Date;

public class ThreadTest{
	public static void main(String[] args) {
		Message message = new Message("Howdy");
		Waiter waiter = new Waiter(message);
		Thread waiterThread = new Thread(waiter, "waiterThread");
		waiterThread.start();
		Notifier notifier = new Notifier(message);
		Thread notifierThread = new Thread(notifier, "notifierThread");
		notifierThread.start();
	}
}

class Message {
	private String text;
	public Message(String text) {
		this.text = text;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
}

class Waiter implements Runnable {
	Message message;
	public Waiter(Message message) {
		this.message = message;
	}
	@Override
	public void run() {
		synchronized (message) {
			try {
				System.out.println("Waiter is waiting for the notifier at " + new Date());
				message.wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		System.out.println("Waiter is done waiting at " + new Date());
		System.out.println("Waiter got the message: " + message.getText());
	}
}
class Notifier implements Runnable {
	Message message;
	public Notifier(Message message) {
		this.message = message;
	}
	@Override
	public void run() {
		System.out.println("Notifier is sleeping for 3 seconds at " + new Date());
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e1) {
			e1.printStackTrace();
		}
		synchronized (message) {
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			message.setText("Notifier took a nap for 3 seconds");
			System.out.println("Notifier is notifying waiting thread to wake up at " + new Date());
			message.notify();
		}
	}
}
        	</pre>
        	<p>Two thread waiter and notifier executes parallelly. notifier is put on sleep to make sure waiting thread to enter first into its synchronized block 
        	 and hit wait(). Now consider if wait won't release the lock the notifier thread has to wait on it's synchronized block as both are trying to lock 
        	 same object, but in this scenario notifier thread enter to its synchronized block and notify waiting thred to start monitoring the object to get the lock. </p>
        	 <img src="/images/ThreadWaitNotify.png">
        	 <p>Thread sleep won't release the lock.</p>
        	 <h2>wait, notifyAll</h2>
        	 <p>When multiple thread try to execute synchronized block of wait(), notifier thread uses notifyAll method of the object. </p>
<pre class="pres">
import java.util.Date;

public class ThreadTest{
	public static void main(String[] args) {
		Message message = new Message("Howdy");
		Waiter waiter = new Waiter(message);
		Thread waiterThread = new Thread(waiter, "waiter Thread-1");
		waiterThread.start();
		waiter = new Waiter(message);
		 waiterThread = new Thread(waiter, "waiter Thread-2");
		 waiterThread.start();
		 waiter = new Waiter(message);
		 waiterThread = new Thread(waiter, "waiter Thread-3");
		 waiterThread.start();
		Notifier notifier = new Notifier(message);
		Thread notifierThread = new Thread(notifier, "notifierThread");
		notifierThread.start();
	}
}

class Message {
	private String text;
	public Message(String text) {
		this.text = text;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
}

class Waiter implements Runnable {
	Message message;
	public Waiter(Message message) {
		this.message = message;
	}
	@Override
	public void run() {
		synchronized (message) {
			try {
				System.out.println(Thread.currentThread().getName() + " is waiting for the notifier at " + new Date());
				message.wait();
				System.out.println(Thread.currentThread().getName() + " is done waiting at " + new Date());
				System.out.println(Thread.currentThread().getName() + " got the message: " + message.getText());
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
class Notifier implements Runnable {
	Message message;
	public Notifier(Message message) {
		this.message = message;
	}
	@Override
	public void run() {
		System.out.println("Notifier is sleeping for 3 seconds at " + new Date());
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e1) {
			e1.printStackTrace();
		}
		synchronized (message) {
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			message.setText("Notifier took a nap for 3 seconds");
			System.out.println("Notifier is notifying waiting thread to wake up at " + new Date());
			message.notifyAll();
		}
	}
}</pre>
<p>Order of output is not pridictable.</p>
	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>