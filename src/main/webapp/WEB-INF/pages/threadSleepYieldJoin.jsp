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
        	<h2>sleep</h2>
        	<p>sleep is static method of Thread class. It put only currently running thread into sleep.  Thread is put onto sleep because 
        	it is running too fast, Or resource  might get release after some time.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
public class ThreadTest implements Runnable {
	@Override
	public void run() {
		System.out.println(Thread.currentThread().getName() + " Is going to sleep");
		try{
			Thread.sleep(2000);		//Thread Thread-1, Thread-2 Path
		}catch(InterruptedException e){
			System.out.println(e.getMessage());
		}
		System.out.println(Thread.currentThread().getName() + " Is resumed from sleep");
	}
	public static void main(String...strings){
		Runnable rr = new ThreadTest();
		Thread tt = new Thread(rr);
		tt.setName("Thread-1");
		tt.start();
		tt = new Thread(rr);
		tt.setName("Thread-2");
		tt.start();
		try{
			Thread.sleep(1000);		//Main Thread Path
		}catch(InterruptedException e){
			System.out.println(e.getMessage());
		}
		Thread.currentThread().setName("Main Thread");
		System.out.println(Thread.currentThread().getName());
	}
}
</pre>
<p>Order of <b>Thread-1</b> and <b>Thread-2</b> is not predictable however <b>Main Thread</b> always completed while Thread-1 and Thread-2 wait for 2 seconds.</b></p>
<h2>yield</h2>
<p>Every thread has some priority associated with it. When there are multiple thread are competing to run, then high priority thread is choosen over 
the other from Thread pool in runnable state. In order to bump back currently running thread to runnable state for giving chance to other thread to execute 
static method yield() of thread is used. Selection of thread to enter into running state based on priority. Yield won't cause currently running thread to waiting/sleeping/blocking 
state, it only relinquish the running thread and put into the Runnable state. As of now example won't be suffice until some real wait is simulate.yield() is 
static method of Thread class.</p> 
<h2>join</h2>
<p>Executing join on thread means other thread please join me at end when i complete. Join is Non-static method of thread class.</p>    
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
public class ThreadTest implements Runnable {

	@Override
	public void run() {
		System.out.println(Thread.currentThread().getName() + " Is going to joined by other Thread");
		try{
			Thread.sleep(2000);
		}catch( InterruptedException e){
			
		}
		System.out.println(Thread.currentThread().getName() + " Is completed");
	}
	public static void main(String...strings){
		Runnable rr = new ThreadTest();
		Thread tt = new Thread(rr);
		tt.setName("Thread-1");
		tt.start();
		try{
			tt.join(); 
		}catch (InterruptedException e) {
			// TODO: handle exception
		}
		tt = new Thread(rr);
		tt.setName("Thread-2");
		tt.start();
		Thread.currentThread().setName("Main Thread");
		System.out.println(Thread.currentThread().getName());
	}
}</pre>  
<p>Check out the result with and without join.</p> 	 
	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>