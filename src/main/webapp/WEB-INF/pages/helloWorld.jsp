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
            <%@ include file="coreJavaMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>Download and install <a href='http://www.java.com'><span>JDK</span></a> </h2>
        	<p>Download the appropriate version of java and set the path in bashrc file using command
        	vi ~/.bashrc and append the JDK_DIR/bin path.Once path is set close the terminal and open it again and run java/javac command on terminal.</p>
        	<img  src="/images/terminalJavac.jpg" />
        	<p>javac is used to compile the code where as java is used to run the compiled code</p>
        	<p>machine:~ javac programFile.java ----------> To compile</p>
        	<p>machine:~ java programFile ------------------> To run the compiled code providec .class file is in current folder</p>
        	<p>As a biggener one should always write a code without using tool like eclipse/netbeans or any other tool which helps in showing available classes 
        	and attribute.</p>
        	<p>Writing code on text file always help in learning different classes, packages and language features.</p>
        	
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>