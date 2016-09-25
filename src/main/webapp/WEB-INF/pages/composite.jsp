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
            <%@ include file="structuralMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Composite Design Pattern</h2>

<img src="/images/Composite.png"/>
<pre class=pres>
import java.util.ArrayList;
import java.util.List;

public class Composite {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Brick b1 = new Brick();
		Brick b2 = new Brick();
		Structure st1 = new Structure();
		st1.add(b1);
		st1.add(b2);
		
		Brick b3 = new Brick();
		Brick b4 = new Brick();
		Structure st2 = new Structure();
		st2.add(b3);
		st2.add(b4);
		
		Structure st = new Structure();
		st.add(st1);
		st.add(st2);
		st.add(new Brick());
		st.printType();
	}
}

interface Component{
	public void printType();
}
class Brick implements Component{
	@Override
	public void printType() {
		System.out.println("Brick");
	}
}
class Structure implements Component{
	List&lt;Component&gt; bricks = new ArrayList&lt;Component&gt;();
	@Override
	public void printType() {
		 for (Component brick : bricks) {
			 brick.printType();
	        }
	}
	 public void add(Component brk) {
		 bricks.add(brk);
	 }
}</pre>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>