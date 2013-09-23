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
            <%@ include file="AdobeLivecycleMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Adobe Livecycle</h2>
        	<p>This technology is mainly used for some process flow, form submission, survey. First we will see example 
        	which uses xml in core for data handelling. Other methed is in the form of CSV. </p>
<pre class="pres">
&lt;?xml version="1.0"?&gt;
&lt;Details&gt;
	&lt;person&gt;
		&lt;Name&gt;
		&lt;firstName titile="Mr"&gt;John&lt;/firstName&gt;
		&lt;lastName&gt;Rambo&lt;/lastName&gt;
		&lt;/Name&gt;		
		&lt;contact&gt;		
		&lt;phone mobile="9988776655" office="22334477"&gt;y&lt;/phone&gt;
		&lt;email&gt;harsh.k.arora@gmail.com&lt;/email&gt;
				&lt;/contact&gt;
		&lt;Address&gt;
			&lt;Location door="960"&gt;Anand vihar&lt;/Location&gt;
			&lt;State district="Gurgoan" &gt;Haryana&lt;/State&gt;
			&lt;Country Pin="110095" &gt;India&lt;/Country&gt;
		&lt;/Address&gt;
	&lt;/person&gt;
&lt;accounts&gt;
 &lt;account type="Saving"&gt;
  &lt;balance&gt;149432.99&lt;/balance&gt;
 &lt;/account&gt;
 &lt;account type="Credit"&gt;
  &lt;balance&gt;-34149.99&lt;/balance&gt;
 &lt;/account&gt;
 &lt;account type="Pf"&gt;
  &lt;balance&gt;4149.99&lt;/balance&gt;
 &lt;/account&gt;
&lt;/accounts&gt;
&lt;/Details&gt;</pre>

<p>Aforementioned is xml that has been copied from xjc example. Let us save on hard disk. Now open a new form and data view
tab. In data view tab navigate to the saved xml and import it. You could see XML structure. and then drag and drop structure 
from data view to working area. That all your Survey form is ready.</p>

<img  src="images/form.png">

<p>There is not much coding part. However where ever custom client side validation action is required one shold know js. In 
above code on submit button one java script code has been added which added new row to account type.</p>

<p>Code to process the xml is given in <a href='/spring/xjc'><span>xjc/JAXB</span></a>. Submit button won't work as it is 
pointing localhost. One need to specify the post request in form and define equivalent servlet in server.</p>  
<p><a href='http://systemlogic.systemlogic.cloudbees.net/images/Form.pdf'><span>Download.</span></a> this form.</p>      	
		</td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>