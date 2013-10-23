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
            <%@ include file="oracleMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
<h2>View</h2>
<p>I think you have already through with mySQL View part. View are same in both that mySQL doesn't have that Oracle data 
does have is Materialized views.</p>
<p><b>Materialized view : </b> is same like normal view in exposing under lying as logic data, however in addtion, it also 
saved the underlying result set of select statement to table. Materialized view need to refresh periodically in order to 
view the updated data otherwise it always get data from last update, which is also a benefit over normal view in a sense 
it always get data from particular result set, no need to resolve the select query over and again and will be faster.</p>
<pre class="pres">CREATE MATERIALIZED VIEW view_name
  AS select_query;</pre>
<p>So how to refresh the view.</p>
<pre class="pres">exec dbms_mview.refresh( 'view_name', 'C' );</pre>


        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>