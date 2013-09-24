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
        	<h2>Abstract Factory Design Pattern</h2>
<p>Factory method is easy to understand. Let us put your head to understand Abstract factory. Let us modify Factory method 
example by </p>
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

class CarFactory{
	public Car factoryMethod(String type){
		Car car = null;
		if(type.equals("Figo"))
			car = new Figo();
		else if(type.equals("Fiesta"))
			car = new Fiesta();
		return car;
	}
}

class FactoryTest{
	public static void main(String...strings){
		CarFactory carfact = new CarFactory();
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