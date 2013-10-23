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
            <%@ include file="AdobeFlexMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Adobe flex</h2>
        	<p>Although Adobe has decided to stop further development in Flex/mobile still we will look some simple example to 
        	to understand.</p>
        	<p>Before that you might be aware of how to setup flex builder on linux. <a href='http://code.google.com/p/fb4linux/downloads/list'><span>Download</span></a> 
        	and <a href='http://askubuntu.com/questions/104723/how-to-install-debug-flash-player-11-1-on-64-bit'><span>Configure.</span></a>Configurations
        	are quite easy on windows environment.</p>
        	<p> Let us try Hello world Example in Alert box and console.</p>
<pre class="pres">
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;s:Application xmlns:fx="http://ns.adobe.com/mxml/2009"
               xmlns:s="library://ns.adobe.com/flex/spark"
               xmlns:mx="library://ns.adobe.com/flex/mx"
               minWidth="955" minHeight="600" viewSourceURL="srcview/index.html"&gt;
  
  &lt;fx:Script&gt;
    &lt;![CDATA[
      import mx.controls.Alert;
      protected function _clickHandler(event:MouseEvent):void
      {
        // TODO Auto-generated method stub
        Alert.show("Hello World on Alert Box","Message box");
      }
    ]]&gt;
  &lt;/fx:Script&gt;
  
  &lt;fx:Declarations&gt;
    &lt;!-- Place non-visual elements (e.g., services, value objects) here --&gt;
  &lt;/fx:Declarations&gt;
  &lt;mx:HBox&gt;
    &lt;s:Button label="Alert Hello world" click="_clickHandler(event)"/&gt;
    &lt;s:Button label="Trace Hello world" click="{trace('Hello world On console')}"/&gt;  
  &lt;/mx:HBox&gt;
  
&lt;/s:Application&gt;</pre>        	
        
        <p><a href='http://flex.systemlogic.cloudbees.net/HelloWorld.html'><span>Run</span></a> and
        <a href='https://github.com/systemlogic/Flex/archive/master.zip'><span>Download</span></a>.</p>
<p>At this point you might be unaware of how to see console for flex application running in browser. First install the 
debuger version of flash player and create mm.cfg file in home folder</p>
<pre class="pres">ErrorReportingEnable=1
TraceOutputFileEnable=1</pre>
<p>This will create flashlog.txt file in home_folder/.macromedia/Flash_Player/Logs .</p>
<p>Other mm.cfg file argument that can be set are on <a href='https://www.google.co.in/webhp?sourceid=chrome-instant&ion=1&ie=UTF-8#q=adobe.com+mm.cfg'><span>Adobe site</span></a>.</p>
        	
		</td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>