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
        	<h2>Factory Method Design Pattern</h2>
<p>Factory is a place which will produce certain type of item based of item asked. We will simplify it by using ideological 
name of product class and creator class.</p>
<pre class="pres">
public abstract class Car {
	abstract public int MaxSpeed(); 
}

class Figo extends Car{
	public int MaxSpeed(){
		return 160;
	}
}

class Fiesta extends Car{
	public int MaxSpeed(){
		return 220;
	}
}

abstract class creatorCarFactory{
	public abstract Car factoryMethod(String type);
}

class CarFactory extends creatorCarFactory{
	public Car factoryMethod(String type){
		Car car = null;
		if(type.equals("Figo"))
			car = new Figo();
		else if(type.equals("Fiesta"))
			car = new Fiesta();
		return car;
	}
}

class client{
	public static void main(String...strings){
		creatorCarFactory carfact = new CarFactory();
		Car car = carfact.factoryMethod("Figo");
		System.out.println("Car max speed is" + car.MaxSpeed());
	}
}</pre>       	
        	
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>