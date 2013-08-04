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
        	<h2>Synchronize</h2>
        	<p>Synchronization is the control access of common resource by multiple thread so that only one thread can execute synchronized code. Executing synchronized 
        	code obtain the lock on object if it is called on non-static method in this case no other thread can get into the synchronized method/block until entered 
        	thread completes it's synchronized method execution.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
public class ThreadTest implements Runnable {

	@Override
	public void run() {
		System.out.println(Thread.currentThread().getName() + " Is Started");
		this.executingCode();
		System.out.println(Thread.currentThread().getName() + " Is finished");
	}
	public synchronized void executingCode(){
		System.out.println(Thread.currentThread().getName() + " Is in synchronized block");
		for(int index = 0 ;index < 10000 ; index++){
			
		}
	}
	public static void main(String...strings){
		Runnable rr = new ThreadTest();
		Thread tt = new Thread(rr);
		tt.setName("Thread-1");
		tt.start();
		tt = new Thread(rr);
		tt.setName("Thread-2");
		tt.start();
	}
}
</pre>
 <p>Run the code with/without synchronized keyword in the method and observe the output.</p>
 <p>In case of Thread executes synchronized static method of class it obtain class level lock and no other thread can execute same or any other synchronized static method of the same class.</p>
 <pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
public class ThreadTest implements Runnable {
	@Override
	public void run() {
		if("Thread-1".equals(Thread.currentThread().getName())){
			executingCode1();
		}else{
			executingCode2();
		}
		
	}
	public static synchronized void executingCode1(){
		System.out.println(Thread.currentThread().getName() + " Is in static synchronized block");
		for(int index = 0 ;index < 1000000 ; index++){
			
		}
		System.out.println(Thread.currentThread().getName() + " Is finishes");
	}
	public static synchronized void executingCode2(){
		System.out.println(Thread.currentThread().getName() + " Is in static synchronized block");
		for(int index = 0 ;index < 10 ; index++){
			
		}
		System.out.println(Thread.currentThread().getName() + " Is finishes");
	}
	public static void main(String...strings){
		Runnable rr = new ThreadTest();
		Thread tt = new Thread(rr);
		tt.setName("Thread-1");
		tt.start();
		tt = new Thread(rr);
		tt.setName("Thread-2");
		tt.start();
		tt = new Thread(rr);
		tt.setName("Thread-3");
		tt.start();
		tt = new Thread(rr);
		tt.setName("Thread-4");
		tt.start();
	}
}</pre>	 
<p>Order of thread execution and completion of any thread is not predictable however it is always sure any thread that has been entered to synchronized blocked 
no other thread can enter any other static synchronized method. So the output on console will always be "Thread-x  Is in static synchronized block" followed by 
"Thread-x Is finishes". JVM console output.</p>
<img  src="/images/StaticThreadSync.png">
<p>Only Thread-1 is running and acquire intrinsic lock, Thread-2,3,4 are observing the lock to be released(Monitor).</p>
	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>