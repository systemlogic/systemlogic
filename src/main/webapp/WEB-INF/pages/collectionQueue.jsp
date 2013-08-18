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
        	<h2>Queue</h2>
        	<p>PriorityQueue and LinkedList class implement Queue interface. We will see implementation and time complexity of PriorityQueue here.</p>
		<h3>PriorityQueue</h3>
        	<pre class="pres">
class priorityQueue{
	public static void main(String...strings){
		PriorityQueue<Integer> al = new PriorityQueue<Integer>();
		int parent = (10 - 1) >>> 1;
		al.add(11);
		al.add(10);
		al.add(9);
		al.add(8);
		al.add(7);
		al.add(6);
		al.add(5);
		al.add(4);
		al.add(3);
		al.add(2);
		al.add(1);
		System.out.println(al.toString());
		al.remove(7);
	}
}</pre>
<p>Priority Queue data structure is based on priority heap. In addition to add and remove it supports offer() and poll() to add and remove element. 
Internal add and remove call offer and poll only. Worst case insertion operation will take O(log n) which is the time complexity of Heap. 
where in beast case only takes O(1). </p>
<pre class="pres">
private void siftUpUsingComparator(int k, E x) {
        while (k > 0) {
            int parent = (k - 1) >>> 1;
            Object e = queue[parent];
            if (comparator.compare(x, (E) e) >= 0)
                break;
            queue[k] = e;
            k = parent;
        }
        queue[k] = x;
}</pre>
<p>Time complexity of removing an element is also an O(log n) since element need to shift in the tree down to leaf.
<pre class="pres">
private void siftDownUsingComparator(int k, E x) {
        int half = size >>> 1;
        while (k < half) {
            int child = (k << 1) + 1;
            Object c = queue[child];
            int right = child + 1;
            if (right < size &&
                comparator.compare((E) c, (E) queue[right]) > 0)
                c = queue[child = right];
            if (comparator.compare(x, (E) c) <= 0)
                break;
            queue[k] = c;
            k = child;
        }
        queue[k] = x;
    }
</pre>
<h2>PriorityQueue Complex Object</h2>
What if user have class object to be stored in Priority Queue. In such case one has to provide implementation to comparator.
<pre class="pres">
class PriorityObject{
	int uid ;
	String name;	
	PriorityObject(int u, String n){
		uid = u ;
		name = n ;
	}
}
class customComparatorUID implements Comparator<PriorityObject>{
	@Override
	public int compare(PriorityObject o1, PriorityObject o2) {
		// TODO Auto-generated method stub
		if(o1.uid > o2.uid){
			return 1;
		}else if(o1.uid < o2.uid){
			return -1;
		}else{
			return 0;
		}
	}
}

class priorityQueComplexObject{
	//static int MAX_ARRAY_SIZE = Integer.MAX_VALUE - 8;
	public static void main(String...strings){
		PriorityQueue<PriorityObject> al = new PriorityQueue<PriorityObject>(11,new customComparatorUID());
		al.add(new PriorityObject(11,"11"));
		al.add(new PriorityObject(10,"10"));
		al.add(new PriorityObject(9,"9"));
		al.add(new PriorityObject(8,"8"));
		al.add(new PriorityObject(7,"7"));
		al.add(new PriorityObject(6,"6"));
		al.add(new PriorityObject(5,"5"));
		al.add(new PriorityObject(4,"4"));
		al.add(new PriorityObject(3,"3"));
		al.add(new PriorityObject(2,"2"));
		al.add(new PriorityObject(1,"1"));
		System.out.println(al.size());
	}
}
</pre>
<p>The order of element stored in PriorityQueue is same as order of premitive 
element stored.</p>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>