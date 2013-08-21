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
            <%@ include file="creationalMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Singleton Design Pattern</h2>
        	<p>OOP is good software development paradigm however at this point of time my application want only one instance of certain class which other object and its thread can play with.
        	So how one can restrict only single instance of class? Using static keyword. Let us see how it can be done programmatically.</p>
        	
        	<h3>Singleton.java</h3>
        	<pre class="pres">
class Singleton{
	private static Singleton single = new Singleton();
	public static Singleton getInstance(){
		return single;
	}
}</pre>
<p>Aforementioned code is an example of early initialization. Don't you think this code is having some problem? It will create an instance even if one don't requires it in whole program cycle.
To guard it  we can change class something like.</p>
<h3>Singleton.java</h3>
<pre class="pres">
class Singleton{
	private static Singleton single = null;
	public static Singleton getInstance(){
		if( single==null){
			single= new Singleton() ;
		}
		return single;
	}
}
</pre>    
<p>The above code do well with single process single thread model. However with multiple thread access can cause multiple instance problem. One way to get out from this problem is to mark single final variable but, this will throws and exception when next time initialization happens. So better to go with synchronized block.</p> 	
<h3>Singleton.java</h3>
<pre class="pres">
class Singleton{
	private static Singleton single = null;
	public static Singleton getInstance(){
		synchronized(Singleton.class){
			if(single==null)
				single = new Singleton() ;
		}
		return single;
	}
}
</pre> 
<p>This code will work 100% fine however will cause performance hit. How? Once object got some memory it will wait on synchronized block statement to get in. So how this problem can be guarded.
</p>        	
<h3>Singleton.java</h3>
<pre class="pres">
class Singleton{
	private static Singleton single = null;
	public static Singleton getInstance(){
		if(single==null)
			synchronized(Singleton.class){
				if(single==null)
					single = new Singleton() ;
				//Some more initialization and processing.
			}
		return single;
	}
}</pre> 
<p>This is called double check, when condition is check twice for object initialization. Is there any problem  
with above code? if all thread come at same time before memory is asigned they will wait at synchronized statement. 
What can be other problem is? suppose first thread get into second if and then it has to do some sort of processing 
with Singleton instance. Since object is already got memory other new threads will not come into first if statement 
and will lead to some read-write problem because first thread has not finished it yet. So what can be the solution?</p>
<pre class="pres">
class Singleton{
	private static Singleton single = null;
	public static Singleton getInstance(){
	Boolean executedOnce = false;
		if(single==null || !executedOnce)
			synchronized(Singleton.class){
				if(single==null)
					single = new Singleton() ;
				//Some more initialization and processing.
			executedOnce = true; //last line on single object processing
			}
		return single;
	}
}</pre>
<p>The aforementioned code will make sure read-write problem won't even occures.</p>      	
        	
        	
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>