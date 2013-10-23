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
        	<h2>Flyweight Design Pattern</h2>
<p>Flyweight reduce the memory utilization by storing common property into some external data structure and is used if and 
when is required and passed to the flyweight object. One such example that can be consider as good example of flyweight is 
Autocad file which stores the length, height, width of raster component like line, circle, square. The size of dxf file is 
really very small as compare to actual image of type jpg, png and other format. In Adobe Flex if each component is drawn 
using separate graphics object then size of viewing component will really big enough to handle however if all component will 
be drawn using same graphics then it will reduce the memory utilization considerably.</p>        	
       	</td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>