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
        	<h2>Proxy Design Pattern</h2>
        	<p>Proxy : is not real and substitute the real. So How it is useful in computer science. Let us first understand 
        	the problem domain and then we will dig into the code.</p>
        	<p>Out of Big heavy complex object one need only small portion of it for operation as other components are not 
        	required as of now and instantiate only those components. </p>
        	<p>A small Object on client that represent big complex object on server. Image processing on browser having small 
        	image that represent big image on server can be consider simplest proxy example.</p>
        	<p></p>
        	<img src="images/proxyDP.png">
<pre class="pres">interface Image {
	
    public void displayImage();
    public void colorOperation(String color);
}

class RealImage implements Image{
	private String Name = null;
	private String Size = null;
	public String getSize() {
		return Size;
	}
	public void setSize(String size) {
		Size = size;
	}
	private String color = null;
	RealImage(){
		Size = "1440x900" ;
	}
	RealImage(String name,Boolean proxy){
		this();
		if(proxy){
			Size = "144x90";
		}
		setName(name);
		setColor("Hue");
	}
	@Override
	public void displayImage() {
		System.out.println("Image size = " + Size);
	}
	@Override
	public void colorOperation(String color) {
		this.setColor(color); 
		
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
}
class ProxyImage implements Image{
	private String Name = null;
	private String Size = null;
	private String color = null;
	private RealImage realImage = null;
	
	ProxyImage(String name){
		realImage = new RealImage(name, true);
		this.Name = realImage.getName();
		this.color = realImage.getColor();
		this.Size = realImage.getSize();
		
	}
	public String getSize() {
		return Size;
	}

	public void setSize(String size) {
		Size = size;
	}
	
	public RealImage getRealImage() {
		return realImage;
	}

	public void setRealImage(RealImage realImage) {
		this.realImage = realImage;
	}
	@Override
	public void displayImage() {
		// TODO Auto-generated method stub
		System.out.println("Image size = " + Size);
	}
	@Override
	public void colorOperation(String color) {
		this.color = color;
		realImage.colorOperation(color);
		
	}
}

class ImageOperation{
	public static void main(String...strings){
		Image img = new ProxyImage("Image.jpg");
		img.colorOperation("Bright = 29");
		((ProxyImage) img).getSize();
	}
}</pre>
<p>Here proxyImage is on client machine and is really small in size and operate respective operation on image on server.</p>
        	
 		</td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>