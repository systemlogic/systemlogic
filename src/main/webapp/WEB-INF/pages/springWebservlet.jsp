<html>
<head>
<link href="/menu_assets/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="Header.jsp"%>
	<%@ include file="Menu.jsp"%>
	<table>
		<tr>
			<td valign="top" height="10px" width="222"><%@ include
					file="springWebMenu.jsp"%></td>
			<td></td>
			<td align="left" bordercolor="c41200">
				<h2>Web Servlet</h2>
				<p><b>DispatcherServlet : </b> is the Servlet inherits from the HttpServlet and declared in the web.xml 
				One need to map requests that DispatcherServlet need to handle, by using a URL mapping web.xml file.</p>
<pre style="background-color:F0F7FE; border: 1px solid #CCCCCC; display: block; margin: 12px 10px; padding: 12px 10px 16px; overflow-x: auto;">
&lt;servlet&gt;
	&lt;servlet-name&gt;<b>mvc-dispatcher</b>&lt;/servlet-name&gt;
	&lt;servlet-class&gt;org.springframework.web.servlet.DispatcherServlet&lt;/servlet-class&gt;
	&lt;load-on-startup&gt;1&lt;/load-on-startup&gt;
&lt;/servlet&gt;

&lt;servlet-mapping&gt;
	&lt;servlet-name&gt;<b>mvc-dispatcher</b>&lt;/servlet-name&gt;
	&lt;url-pattern&gt;/pattern/*&lt;/url-pattern&gt;
&lt;/servlet-mapping&gt;				
</pre>
<p>After this it will look for file with name <b>mvc-dispatcher</b>-servlet.xml in WEB-INF directory.</p>
			</td>
			<%@ include file="rightPane.jsp"%>
		</tr>
	</table>
	<%@ include file="FooterLink.jsp"%>
	<%@ include file="Footer.jsp"%>
</body>
</html>