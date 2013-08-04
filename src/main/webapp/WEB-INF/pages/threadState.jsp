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
        	<h2>Thread States</h2>
        	<p>Any thread can be in any of the one state</p>
        	<img  src="/images/ThreadStates.png">
        <p><b>New : </b>This is the state the thread is in after the Thread instance has been created, but the start() method has 
        not been invoked on the thread. It is a live Thread object, but not yet a thread of execution. At this point, the thread 
        is considered not alive.</p>
        
        <p><b>Runnable : </b>This is the state a thread is in when it's eligible to run, but the scheduler has not selected it to 
        be the running thread. A thread first enters the runnable state when the start() method is invoked, but a thread can also 
        return to the runnable state after either running or coming back from a blocked, waiting, or sleeping state. When the thread 
        is in the runnable state, it is considered alive.</p>
        
        <p><b>Running : </b>TThe "big time." Where the action is. This is the state a thread is in when the thread scheduler 
        selects it (from the runnable pool) to be the currently executing process. A thread can transition out of a running 
        state for several reasons, including because "the thread scheduler felt like it.", it is considered alive.</p>
        
    	<p><b>Waiting/blocked/sleeping : </b>Thread is in this state because thread has called wait() method, Or waiting for some resource 
    	that has been locked by other thread, or sleep timer has been expired. Thread is considered alive.</p>
        
        <p><b>Dead : </b>A thread is considered dead when its run() method completes. It may still be a viable Thread object, but 
        it is no longer a separate thread of execution. Once a thread is dead, it can never be brought back to life, it is not
        considered alive.</p>    
	    </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>