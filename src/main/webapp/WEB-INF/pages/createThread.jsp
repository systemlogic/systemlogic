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
        	<h2>Thread and Runnable</h2>
        	<p>Thread can be created by extending Thread class or implementing Runnable interface and giving definition to run method.</p> 
        	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
public class ThreadTest extends Thread {
		
		@Override
		public void run() {
		super.run();
			System.out.println(Thread.currentThread().getName());
		}
		public static void main(String...strings){
			ThreadTest tt = new ThreadTest();
			tt.setName("Custom Thread");
			tt.run();
			Thread.currentThread().setName("Main Thread");
			System.out.println(Thread.currentThread().getName());
		}
}
//Output on console 
//main
//Main Thread
</pre>
       <p>Does this really start new thred? <b>NO.</b> Let us see the jvm console.</p>
       <img  src="/images/ThreadNotStarted.png">
       <p>Other then default thread there is only <b>Main Thread</b> that has been started. So how new thread is created. Always remember one has to call <b>start()</b>
       method on thread object to start new thread. </p> 
       <h3>Extending Thread Class</h3>	
                	<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
public class ThreadTest extends Thread {
		
		@Override
		public void run() {
		super.run();
			System.out.println(Thread.currentThread().getName());
		}
		public static void main(String...strings){
			ThreadTest tt = new ThreadTest();
			tt.setName("Custom Thread");
			tt.start();
			Thread.currentThread().setName("Main Thread");
			System.out.println(Thread.currentThread().getName());
		}
}
//Output on console 
//Custom Thread
//Main Thread
</pre>
<p>Order of output is not predictable. Let us observe the jvm console now.</p>
<img src="/images/NewThread.png">
<h3>Implementing Runnable Interface</h3>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
public class ThreadTest implements Runnable {
		
		@Override
		public void run() {
			System.out.println(Thread.currentThread().getName());
		}
		public static void main(String...strings){
			Runnable rr = new ThreadTest();
			Thread tt = new Thread(rr);
			tt.setName("Custom Thread");
			tt.start();
			Thread.currentThread().setName("Main Thread");
			System.out.println(Thread.currentThread().getName());
		}
}
//Output on console 
//Custom Thread
//Main Thread
</pre>
<p>Again,Order of output is not predictable.</p>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>