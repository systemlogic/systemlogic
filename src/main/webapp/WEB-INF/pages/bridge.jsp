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
            <%@ include file="adaptorMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Bridge Design Pattern</h2>
        	<p>Bridge join two bank/ends. Definition is fine i guess.</p>
        	<img src="/images/bridge.jpg">
        	<p>Let us understand it with some real time problem and UML chart.</p> 
        	<p>If class being derived based on property then we could have UML chart something like this 
        	for Ford Car production. Make sense. </p>
        	<img src="/images/Enginee.png">
        	<p>If each property is associated with different department and required some piece of work 
        	then Car Figo and Fiesta will have different department. Let us Color the car. I think it is still manageable.</p>
        	<img src="/images/Color.png">
        	<p>Now suppose  if some other planned/Unplanned featured need to add then we could have 16 class at next level for 
        	different cars which also mean more different department. 
        	It is not possible to UML chart on given area. So I think you know the problem. New features are difficult to maintain 
        	on class diagram.</p>
        	<p>Let us see what solution can take care this problem. If we Abstract and cascade each feature to same level, also features are 
        	composition of car it does not make any difference in the car. Car will be car.</p>
        	<img src="/images/BridgeUML.png">
        	<p><b>Doesn't composition of Enginee to car and Color to car seems like bridge?</b></p>
        	<p>So What about adding music system. Music system can be simple or it could be complex with advance feature, what we 
        	need here is make it composite part of car.</p>
        	
<pre class="pres">
public interface Color {
	public void paintColor();
}

class Metallic implements Color{
	@Override
	public void paintColor(){
		System.out.println("I will do Metal Color on body and Fiber parts.");
	}
}

class NonMetallic implements Color{
	@Override
	public void paintColor(){
		System.out.println("I will do Non Metal Color on body and No color on Fiber parts.");
	}
}</pre>

<pre class="pres">
public interface Enginee {
	public void fitEnginee();
}

class CC1200 implements Enginee{
	@Override
	public void fitEnginee(){
		System.out.println("I Will give 1200 CC enginee to Car");
	}
}

class CC1600 implements Enginee{
	@Override
	public void fitEnginee(){
		System.out.println("I Will give 1600 CC enginee to Car");
	}
}</pre>

<pre class="pres">
public abstract class Car {
	Color color;
	Enginee enginee;
	Car(Color c,Enginee e){
		this.color = c ;
		this.enginee = e;
	}
	abstract public void assambleIt(); 
}

class Figo extends Car{
	Figo(Color c,Enginee e){
		super(c,e);
	}
	public void assambleIt(){
		color.paintColor();
		enginee.fitEnginee();
	}
}

class Fiesta extends Car{
	Fiesta(Color c,Enginee e){
		super(c,e);
	}
	public void assambleIt(){
		color.paintColor();
		enginee.fitEnginee();
	}
}</pre>

<pre class="pres">
public class Production {
	public static void main(String...strings){
		System.out.println("Car Figo Production");
		Car car1 = new Figo(new NonMetallic(), new CC1200());
		car1.assambleIt();
		System.out.println("\n\n");
		System.out.println("Car Fiesta Production");
		Car car2 = new Fiesta(new Metallic(), new CC1600());
		car2.assambleIt();
	}
}</pre>

<p>So what can preclude? Any new feature Which need to be part of car doesn't effect car just become part of it, Also 
only particular class need to change for matter of concern.</p>
        	
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>