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
        	<h2>Executors</h2>
        	<p>Before we look into Executor we will see what is the problem is threaded application.</p>
        	
        	
<pre class=pres>
public class TryLock {
	int value = 0;
	public static void main(String...strings){
		Thread t;
		for (int i = 0 ; i< 1000 ; i++){
			t = new Thread(new writer());
			t.setName("Thread-"+i);
			t.start();
		}
	}
	static class writer implements Runnable{
		public void run() {
			for(int index=0 ; index < 1000 ; index++){
				System.out.println(Thread.currentThread().getName() + " : " + index);
			}
		}
	}
}</pre>
<p>When I run above program the CPU utilization is 100% Memory is running out of space as every thread
need some space to run. So if someone try to open some application that is not getting space, In short 
we can say resource utilization is gone for a toss.</p>
<p>How about allowing only few thread to be run at a time from very large number of thread/task. This 
will allow cpu and memeory for other tasks. </p>
<pre class=pres>
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class TryLock {
	int value = 0;
	public static void main(String...strings){
		ExecutorService ex = Executors.newFixedThreadPool(5);
		for (int i = 0; i < 1000; i++) {
			Runnable worker = new writer();
			ex.execute(worker);
		}
		ex.shutdown();
		System.out.println("Finished all threads");
	}
	static class writer implements Runnable{
		public void run() {
			for(int index=0 ; index < 1000 ; index++){
				System.out.println(Thread.currentThread().getName() + " : " + index);
			}
		}
	}
}</pre>

<p>Pretty good so far. However if someone wants thread to return the result.</p>
<pre class=pres>
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class TryLock {
	int value = 0;
	public static void main(String...strings){
		ExecutorService ex = Executors.newFixedThreadPool(5);
		List&lt;Future&lt;Integer&gt;&gt; list = new ArrayList&lt;Future&lt;Integer&gt;&gt;();
	    for (int i = 0; i &lt; 1000; i++) {
	      Callable&lt;Integer&gt; worker = new writer();
	      Future&lt;Integer&gt; submit = ex.submit(worker);
	      list.add(submit);
	    }
	    long sum = 0;
	    System.out.println("List Size="+list.size());
	    // now retrieve the result
	    for (Future&lt;Integer&gt; future : list) {
	      try {
	    	  System.out.println("Item value="+future.get());
	        sum += future.get();
	      } catch (InterruptedException e) {
	        e.printStackTrace();
	      } catch (ExecutionException e) {
	        e.printStackTrace();
	      }
	    }
	    System.out.println(sum);
	    ex.shutdown();
	}
	static class writer implements Callable&lt;Integer&gt; {
		@Override
		public Integer call() throws Exception {
			int sum = 0;
			for (int i = 0; i &lt;= 1000; i++) {
				sum += i;
			}
			return sum;
		}

	}
}
</pre>

<h3>Fork/Join</h3>
<p>The idea behind Fork/Join is on multi processor machine divide the job in small sub jobs if it requires 
very large computation. Each sub job executed in parallel and result is combined in last.</p>
        	
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>