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
					file="springCoreContainerMenu.jsp"%></td>
			<td></td>
			<td align="left" bordercolor="c41200">
				<h2>Spring Expression Language (SpEL)</h2>
				<p>
					<b>Spring Expression Language (SpEL) : </b> The Spring Expression Language (SpEL for short) is a powerful expression language that supports querying and manipulating an object graph at runtime.
					</p>
				<P>In earlear example we have already make use of ClassPathXmlApplicationContext and AnnotationConfigApplicationContext now we will see what BeanFactory really means.
				This interface is implemented by objects that hold a number of bean definitions, each uniquely identified by a String name. Depending on the bean definition, 
				the factory will return either an independent instance of a contained object (the Prototype design pattern), or a single shared instance (a superior
				 alternative to the Singleton design pattern, in which the instance is a singleton in the scope of the factory)	</P>
		</tr>
	</table>
	<%@ include file="FooterLink.jsp"%>
	<%@ include file="Footer.jsp"%>
</body>
</html>