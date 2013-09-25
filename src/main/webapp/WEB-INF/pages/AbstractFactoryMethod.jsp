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
<p>Encapsulation of group of factories with common type of factory production. client software creates a concrete 
implementation of the abstract factory and then uses the generic interface of the factory to create the concrete objects </p>
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

abstract class Bike{
	abstract public int CubicCapcity();
}

class pulsar extends Bike{
	public int CubicCapcity(){
		return 220;
	}
}

class Harley extends Bike{
	public int CubicCapcity(){
		return 600;
	}
}</pre> 
<p>Upto this point everything would be clear. Let us create their respective factory and abstract factory on top of it.</p>
<pre class="pres">
abstract class abstractcreatorFactory{
	public abstract Car  carfactoryMethod();
	public abstract Bike bikefactoryMethod();
}

class abstractcreatorFactory1 extends abstractcreatorFactory{
	public Car carfactoryMethod(){
		Car car = new Figo();
		return car;
	}
	public Bike bikefactoryMethod(){
		Bike bike = new pulsar();
		return bike;
	}
}

class abstractcreatorFactory2 extends abstractcreatorFactory{
	public Car carfactoryMethod(){
		Car car = new Fiesta();
		return car;
	}
	public Bike bikefactoryMethod(){
		Bike bike = new Harley();
		return bike;
	}
}
</pre>

<p>This way we will have option to select factory which can be used for specific type of production.</p>      	
        	
<pre class="pres">class FactoryChooser{
	public abstractcreatorFactory chooseFactory(String chooseFactory){
		abstractcreatorFactory afs = null;
		if("FirstFactory".equals(chooseFactory)){
			afs = new abstractcreatorFactory1();
		}else if("SecondFactory".equals(chooseFactory)){
			afs =  new abstractcreatorFactory2();
		}
		return afs;
	}
}

class client{
	public static void main(String...strings){
		FactoryChooser fc = new FactoryChooser();
		abstractcreatorFactory acf = fc.chooseFactory("FirstFactory");
		Car car = acf.carfactoryMethod();
		Bike bike = acf.bikefactoryMethod();
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