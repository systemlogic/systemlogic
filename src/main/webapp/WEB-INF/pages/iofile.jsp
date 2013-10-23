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
            <%@ include file="ioserializationMenu.jsp" %>
        </td>
        <td></td>
        <td align="left" bordercolor="c41200">
        	<h2>File</h2>
        	<p>There are many methods to perform file operation. We will see one such example and implements copy program.</p>
<pre class="pres">
package FileOperation;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public class cp {
	public static void main(String[] args) throws Exception{
		File readerFile = new File(args[0]);
		File writerFile = new File(args[1]);
		BufferedReader br = new BufferedReader(new FileReader(readerFile));
		BufferedWriter bw = new BufferedWriter(new FileWriter(writerFile));
		String line = "";
		while ((line=br.readLine()) != null) {
            System.out.println(line);
            bw.write(line);
            bw.newLine();   // Write system dependent end of line.
            bw.flush();
        }
		//bw.close();   // this will flush and close the buffer
	}
}</pre>
<p>Let us copy file from source to destination. Doesn't it seems file copy utility of any OS. </p>
<pre class="pres">
java -cp /media/Harsh/HeliosSDK/work/StackImp/bin FileOperation.cp /home/arorah1/gs /home/arorah1/out
</pre>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>