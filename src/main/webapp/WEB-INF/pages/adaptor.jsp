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
        	<h2>Adaptor Design Pattern</h2>
        	<p>Typical 120/12V AC Power Adaptor. So what it really does? It first do physical port conversion and second 
        	what this it does is power conversion from 120/12 V if it is present which also mean it could also set appliance 
        	status to on/off. Let us write classes for Adpator which helps in better understanding. </p>
        	<img src="/images/PowerAdaptor.jpg">
<pre class="pres">
public class MainSupply {
	protected String physicalOutput;
	protected int outputSupply;
	protected boolean OnStatus = false;
	MainSupply(){
		physicalOutput = "Three Pin Socket" ;
		outputSupply = 120;
		OnStatus = true;
	}
}
</pre>
<pre class="pres">public class Adaptor extends MainSupply {
	Adaptor(){
		super();
		if(physicalOutput.equals("Three Pin Socket")){
		physicalOutput = "Round Pin" ;
		outputSupply = super.outputSupply / 10 ; 
		}else{
			OnStatus = false;
		}
	}
}</pre>
<pre class="pres">public class Appliance {
		boolean Workingstatus ;
		String physicalInput ;
		Appliance(){
			Workingstatus = false;
			physicalInput = "Round Pin" ;
		}
		boolean getConnection(Adaptor adp){
			if(adp.physicalOutput.equals(this.physicalInput) && adp.OnStatus && adp.outputSupply==12 ){
				Workingstatus = true;
			}
			return Workingstatus;
		}
		
		public static void main(String...strings){
			Adaptor adp = new Adaptor();
			Appliance app = new Appliance();
			System.out.print("Appliance Working status " + app.getConnection(adp));
		}
}</pre>
<p>So what Adaptor finally means. It's an intermediate media to use already exist product/service/infrastructure and what 
is already exists here is 120V supply and socket which can never be change for any country.</p>        	
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>