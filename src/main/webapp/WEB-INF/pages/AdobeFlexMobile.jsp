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
            <%@ include file="AdobeFlexMobileMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Adobe Mobile App</h2>
<p>Scan it in QR Reader on mobile.</p>
<img  src="images/Flex_BBC.png">        	
<p>Here we will consume BBC RSS feed service and try to display the data.</p>    
<pre class="pres">
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;s:View xmlns:fx="http://ns.adobe.com/mxml/2009" 
        xmlns:s="library://ns.adobe.com/flex/spark"  title="BBC News - Home"
        creationComplete="_creationCompleteHandler(event)"&gt;
  &lt;fx:Script&gt;
    &lt;![CDATA[
      import mx.binding.utils.ChangeWatcher;
      import mx.collections.ArrayCollection;
      import mx.events.FlexEvent;
      import mx.events.PropertyChangeEvent;
      [Bindable]
      private var initDG:ArrayCollection = new ArrayCollection(); 
      private var chwat:ChangeWatcher ;
      protected function _creationCompleteHandler(event:FlexEvent):void
      {
        // TODO Auto-generated method stub
        bbcRss.send();
        chwat = ChangeWatcher.watch(bbcRss,"lastResult",watcherListenerProp);
        busy.visible = true;
      }
      public function watcherListenerProp(event:Event):void
      {
        if (bbcRss.lastResult != null){
          for each(var obj:Object in bbcRss.lastResult.rss.channel.item){
            var temp:Object = new Object();
            temp.label = obj.title;
            temp.message = obj.description;
            temp.icon = obj.thumbnail[1].url;
            initDG.addItem(temp);
          }
        }
        chwat.unwatch();
        busy.visible = false;
      }
      
      
    ]]&gt;
  &lt;/fx:Script&gt;
  &lt;fx:Declarations&gt;
    &lt;s:HTTPService id="bbcRss" url="http://newsrss.bbc.co.uk/rss/newsonline_world_edition/front_page/rss.xml" /&gt;
    &lt;!-- Place non-visual elements (e.g., services, value objects) here --&gt;
  &lt;/fx:Declarations&gt;
  &lt;s:List dataProvider="{initDG}" id="grid" click="{navigator.pushView(NewsView, grid.selectedItem)}"
    width="100%"
    height="100%"
    itemRenderer="views.MyIconItemRenderer"/&gt;
 &lt;s:BusyIndicator id="busy" verticalCenter="0" horizontalCenter="0" height="100" width="100" visible="false"/&gt;
&lt;/s:View&gt;</pre>
<p>And renderer defination is.</p>
<pre class="pres">
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;s:IconItemRenderer
  xmlns:fx="http://ns.adobe.com/mxml/2009"
  xmlns:s="library://ns.adobe.com/flex/spark"
  iconField="icon"
  labelField="label"
  messageField="message"
  iconWidth="45"
  iconHeight="45"&gt;
  &lt;fx:Declarations&gt;
    &lt;!-- Place non-visual elements (e.g., services, value objects) here --&gt;
  &lt;/fx:Declarations&gt;
&lt;/s:IconItemRenderer&gt;
</pre>
<p>New page is as follows</p> 
<pre class="pres">&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;s:View xmlns:fx="http://ns.adobe.com/mxml/2009" 
        xmlns:s="library://ns.adobe.com/flex/spark" title="BBC News" &gt;
  &lt;fx:Declarations&gt;
    &lt;!-- Place non-visual elements (e.g., services, value objects) here --&gt;
  &lt;/fx:Declarations&gt;
  &lt;s:VGroup&gt;
    &lt;s:HGroup&gt;
      &lt;s:Image source="{data.icon}" /&gt;
      &lt;s:TextArea text="{data.label}" borderVisible="false" contentBackgroundColor="0xffffff"/&gt;
    &lt;/s:HGroup&gt;
      
    &lt;s:TextArea text="{data.message}" borderVisible="false" contentBackgroundColor="0xffffff"/&gt;
  &lt;/s:VGroup&gt;
  
&lt;/s:View&gt;
</pre>   	       
		</td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>