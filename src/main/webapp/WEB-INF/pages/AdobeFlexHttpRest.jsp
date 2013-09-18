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
        	<h2>REST and HTTP</h2>
        	<p><a href='http://restapp.systemlogic.cloudbees.net/'><span>REST</span></a> implementation we have already 
        	seen in spring. In order to consume these api from flex using HttpServive when its proxy value set to false 
        	we need to give definition to CustomizedHiddenHttpMethodFilter(Please look into RestApp code) which do 
        	re wrapper the each request. </p>	
<pre class="pres">
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;s:Application xmlns:fx="http://ns.adobe.com/mxml/2009" 
               xmlns:s="library://ns.adobe.com/flex/spark" creationComplete="_creationCompleteHandler(event)"
               xmlns:mx="library://ns.adobe.com/flex/mx" minWidth="955" minHeight="600"&gt;
  &lt;fx:Script&gt;
    &lt;![CDATA[
      import mx.collections.ArrayCollection;
      import mx.controls.Alert;
      import mx.events.FlexEvent;
      import mx.rpc.events.FaultEvent;
      import mx.rpc.events.ResultEvent;
      import mx.utils.ObjectProxy;
      //var URL:String = "http://localhost:8090";
      var URL:String = "http://restapp.systemlogic.cloudbees.net";
      
      protected function service_resultHandler(event:ResultEvent):void
      {
        // TODO Auto-generated method stub
        deptList.dataProvider = deptservice.lastResult.deptList.dept;
        list.dataProvider = new ArrayCollection();
        for each(var obj:Object in deptList.dataProvider)
        list.dataProvider.addItem(obj.department);
        
        
        deptList.selectedIndex = 0;
        empservice.method = "GET";
        empservice.url = URL + "/empList/" + deptList.selectedItem.department;
        empservice.send();
      }
      
      protected function _creationCompleteHandler(event:FlexEvent):void
      {
        // TODO Auto-generated method stub
        deptservice.send();
      }
      
      protected function empservice_resultHandler(event:ResultEvent):void
      {
        // TODO Auto-generated method stub
        var obj:Object = event.result;
        if(obj instanceof ObjectProxy){
          if(event.result.Response.Result != null){
            Alert.show(event.result.Response.Result);
            trace(empservice.headers[0]);
            if(empservice.method = "POST"){
              empservice.method = "GET";
              empservice.url = URL + "/empList/" + deptList.selectedItem.department;
              empservice.send();
            }
              
            fname.text = "";
            lname.text = "";
            empid.text = "";
            
          }
          else if(event.result.Response.Error != null)
            Alert.show(event.result.Response.Error);
          else if(event.result.Response.Employees != null)
            empList.dataProvider = empservice.lastResult.Response.Employees.Employee;
          else  
            empList.dataProvider = new ArrayCollection();
        }else{
          trace(event.result.name().localName);
          trace(event.result.name());
          if(event.result.Result[0] != null && event.result.Result[0].name() == "Result"){
            Alert.show(event.result.Result);
            if(empservice.method = "POST"){
              empservice.method = "GET";
              empservice.url = URL + "/empList/" + deptList.selectedItem.department;
              empservice.send();
            }
            fname.text = "";
            lname.text = "";
            empid.text = "";
          }else if(event.result.Error[0] != null && event.result.Error[0].name() == "Error"){
            Alert.show(event.result.Error);
          }else if(event.result.Employees[0] != null && event.result.Employees[0].name() == "Employees")
            empList.dataProvider = event.result.Employees.Employee;
          else  
            empList.dataProvider = new ArrayCollection();
        }
      }
      
      protected function deptList_clickHandler(event:MouseEvent):void
      {
        // TODO Auto-generated method stub
        empservice.method = "GET";
        empservice.url = URL + "/empList/" + deptList.selectedItem.department;
        empservice.send();
      }
      
      protected function Add_clickHandler(event:MouseEvent):void
      {
        // http://restapp.systemlogic.cloudbees.net/emp/{id}/{firstName}/{lastName}/{dept}
        empservice.method = "POST";
        empservice.url = URL + "/emp/" + empid.text + "/" + fname.text + "/" + lname.text + "/" + list.selectedItem;
        empservice.resultFormat="e4x";
        empservice.useProxy = false;
        var obj:Object = new Object()
          obj.name = "text";
        empservice.send(obj);
        
      }
      
      protected function _faultHandler(event:FaultEvent):void
      {
        // TODO Auto-generated method stub
        empservice.lastResult;
        trace(event.message);
      }
      
      protected function Delete_clickHandler(event:MouseEvent):void
      {
        // TODO Auto-generated method stub
        var destination:String = URL + "/emp/"+ empList.selectedItem.EmpID;
        //empservice.url = destination;
        //empservice.method = "DELETE";
        //empservice.send();
         destination = destination + "?_method=" + "DELETE";
        empservice.method = "POST";
        empservice.url = destination;
        empservice.headers = [new URLRequestHeader("X-HTTP-Method-Override", "DELETE")];
        empservice.useProxy = false;
        var obj:Object = new Object()
        obj.name = "text";
        empservice.send(obj); 
      }
      
    ]]&gt;
  &lt;/fx:Script&gt;
  &lt;fx:Declarations&gt;
    &lt;!-- Place non-visual elements (e.g., services, value objects) here --&gt;
    &lt;s:HTTPService id="deptservice" url="{URL + '/dept' }"  method="GET" result="service_resultHandler(event)"/&gt;
    &lt;s:HTTPService id="empservice"   method="GET" result="empservice_resultHandler(event)" fault="_faultHandler(event)"/&gt;
  &lt;/fx:Declarations&gt;

  &lt;mx:VBox&gt;
    &lt;s:Label text="Department Description"/&gt;
    &lt;mx:AdvancedDataGrid id="deptList" click="deptList_clickHandler(event)"&gt;
      &lt;mx:columns&gt;
        &lt;mx:AdvancedDataGridColumn dataField="department" width="100"/&gt;
        &lt;mx:AdvancedDataGridColumn dataField="deptDesc" width="200"/&gt;
      &lt;/mx:columns&gt;
    &lt;/mx:AdvancedDataGrid&gt;
    &lt;s:Label text="Employees Details"/&gt;
    &lt;mx:HBox&gt;
    &lt;mx:AdvancedDataGrid id="empList" &gt;
      &lt;mx:columns&gt;
        &lt;mx:AdvancedDataGridColumn dataField="EmpID" width="100"/&gt;
        &lt;mx:AdvancedDataGridColumn dataField="FirstName" width="200"/&gt;
        &lt;mx:AdvancedDataGridColumn dataField="LastName" width="100"/&gt;
      &lt;/mx:columns&gt;
    &lt;/mx:AdvancedDataGrid&gt;
    &lt;s:Button label="Delete" click="Delete_clickHandler(event)" enabled="{empList.selectedIndex!= -1}"/&gt;
    &lt;/mx:HBox&gt;
    &lt;s:Label text="New Employee Details"/&gt;
    &lt;s:Form&gt;
      &lt;s:FormItem label="First Name"&gt;
        &lt;s:TextInput id="fname"/&gt;
      &lt;/s:FormItem&gt;
      &lt;s:FormItem label="Last Name"&gt;
        &lt;s:TextInput id="lname"/&gt;
      &lt;/s:FormItem&gt;
      &lt;s:FormItem label="Emp Id"&gt;
        &lt;s:TextInput id="empid"/&gt;
      &lt;/s:FormItem&gt;
      &lt;s:FormItem label="department"&gt;
        &lt;s:DropDownList id="list"/&gt;
      &lt;/s:FormItem&gt;
      &lt;s:FormItem&gt;
        &lt;s:Button label="Add" click="Add_clickHandler(event)"/&gt;
      &lt;/s:FormItem&gt;
    &lt;/s:Form&gt;
  &lt;/mx:VBox&gt;
&lt;/s:Application&gt;
</pre>        	
        <p><a href='http://flex.systemlogic.cloudbees.net/FormBased.html'><span>Run</span></a> and
        <a href='https://github.com/systemlogic/Flex/archive/master.zip'><span>Download</span></a>.</p>	
        
<p>As mentioned flex httpservice support GET and POST when poxy is false, however problem can be overcome by specifying 
by defining _method in url request. Refer Delete_clickHandler method.</p> 
<p>PUT call will be same and leave for your practice.</p>       
		</td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>