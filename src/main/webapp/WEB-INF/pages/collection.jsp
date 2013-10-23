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
            <%@ include file="collectionMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Collection</h2>
        	<p>Collection interface provide implementation for Set, List and Queue interface. Map is not implementation of Collection, repeat after me
        	<b>Map is not implementation of Collection</b>, however at the same time set are implemented using respective map e.g. HashSet is implemented 
        	using HashMap. Please refer to JDK reference library.</p>
        	<p>Pictorial representation of Collection framework</p>
        	<img src="/images/Java-Collection-Framework.png">
        <h3>Important terms</h3>
		<p>collection (lowercase c), which represents any of the data structures in which objects are stored and iterated over.</p>
		<p>Collection (capital C), which is actually the java.util.Collection interface from which Set, List, and Queue extend. (That's right, extend, not implement. There are no direct implementations of Collection.)</p>
		<p>Collections (capital C and ends with s) is the java.util.Collections class that holds a pile of static utility methods for use with collections.</p>
		
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>