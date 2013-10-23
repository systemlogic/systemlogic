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
        <td>

        </td>
        <td align="left" bordercolor="c41200">
        	<h2>Builder Factory Design Pattern</h2>
<p>Any man made Building is complex structure and represent complex Object in computer science which is made up of many small 
object.UML diagram can help in uderstanding the builder design pattern.</p>
<img  src="images/Builder_class_diagram.png">
<p>So what is need to consider is we need simple object and operation that will use these simple object and make complex
object and client who will execute these operation in sequence. In our Building example the order of operation will be 
foundation, structure, walling and interior.</p>

<pre class="pres">
interface buildingPlan{
	public void setfoundation(String foundation);
	public void setstructure(String structure);
	public void setwall(String wall);
	public void settouchup(String touchup);
}
public class House implements buildingPlan{
	String foundation;
	String structure;
	String wall;
	String touchup;
	@Override
	public void setfoundation(String foundation) {
		this.foundation = foundation;
		
	}
	@Override
	public void setstructure(String structure) {
		this.structure = structure;
		
	}
	@Override
	public void setwall(String wall) {
		this.wall = wall;
		
	}
	@Override
	public void settouchup(String touchup) {
		this.touchup = touchup;
		
	}
}</pre>

<p>This way we can get a house of type Hat, Building, TreeHouse, Igloo and many more which is a complex object 
however we need a process to create such complex Object.</p>

<pre class="pres">
interface buildingProcess{
	public void buildfoundation();
	public void buildstructure();
	public void buildwall();
	public void buildtouchup();
}

class ApartmentbuildingProcess implements buildingProcess{
	House house;
	ApartmentbuildingProcess(){
		this.house = new House();
	}
	@Override
	public void buildfoundation() {
		house.setfoundation("Concreate Foundation");
	}
	@Override
	public void buildstructure() {
		house.setstructure("Concreate structure");
	}
	@Override
	public void buildwall() {
		house.setwall("Cement brick Wall");
	}
	@Override
	public void buildtouchup() {
		house.settouchup("Cementing and Whitewash");
	}
}
class TreeHousebuildingProcess implements buildingProcess{
	House house;
	TreeHousebuildingProcess(){
		house = new House();
	}
	@Override
	public void buildfoundation() {
		house.setfoundation("Finding good stem Tree");
	}

	@Override
	public void buildstructure() {
		house.setstructure("Bamboo structure");
	}

	@Override
	public void buildwall() {
		house.setwall("Banana Leaf");
	}

	@Override
	public void buildtouchup() {
		house.settouchup(""); // tree house does need any touchup
	}
}</pre>

<p>So what we need some client whom we can ask to give perticualr type of house. Contractor and Civil Engineer are doing such
job which will give you final house.</p>
<pre class="pres">class civilEngineerContractor_client{
	private buildingProcess bp;
	civilEngineerContractor_client(buildingProcess bp){
		this.bp = bp;
	}
	public void buildHouse(){ //sequencial process of creating house
		bp.buildfoundation();
		bp.buildstructure();
		bp.buildwall();
		bp.buildtouchup();
	}
	public House getHouse(){
		return this.bp.getHouse();
	}
}</pre>

<p>Method buildHouse() can be part of civilEngineerContractor_client in case if we have decided what type of building process 
is requied. </p>
<p>Let us create a house.</p>
<pre class="pres">
civilEngineerContractor_client cecc = new civilEngineerContractor_client(new ApartmentbuildingProcess());
cecc.buildHouse();
cecc.getHouse();
</pre>

 
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>