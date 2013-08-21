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
        	<h2>Prototype Design Pattern</h2>
        	<p>Basic model from which other forms are developed and/or copied(Google search result). 
        	I have to define it here as some time people don't know what they mean it and what they want to do. 
        	So how it is useful here? In this Design Pattern Prototype class is developed and other process use it to obtain the instance. 
        	So don't you think a normal class can do the same task. Is in't ? 
        	Yes, however creating instance for normal class using new keyword is really a expensive operation. Specially when you want many instance. 
        	To cope up with such problem we don't instantiate object using new keyword, we just clone it.</p>
        	
        	<h3>Prototype.java</h3>
        	<pre class="pres">
class Prototype implements Cloneable {
	public Prototype() {}  
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
	public static void main(String... str) throws CloneNotSupportedException{
		Prototype obj = new Prototype();
		Prototype pro = (Prototype)obj.clone();
	}
}</pre>
<p>Aforementioned is perfectly fine. Don't you think cloning is not good enough, I should also concentrate on developing new form.</p>
<h3>Singleton.java</h3>
<pre class="pres">
class Prototype implements Cloneable {
	   public Prototype() {}
	   public Object clone() throws CloneNotSupportedException {
	      return super.clone();
	   }
	   public Prototype prototypeAction(){
	     //protoype variable assignment and manipulation;
		   return null;
	   }
	}

class ActionClass{  
	Prototype DevelopedAction(Prototype proto) throws CloneNotSupportedException {    
		Prototype developedObject = (Prototype)proto.clone();       
		developedObject.prototypeAction();       
		return developedObject;  
	}   

	  public static void main(String... str) throws CloneNotSupportedException {
	    Prototype obj = new Prototype();
	    ActionClass act= new ActionClass();
	    Prototype developedPrototype = act.DevelopedAction(obj);
	  }
}
</pre>    
<p>The above class will create normal object, cloned object as well as modified cloned object.</p> 	
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>