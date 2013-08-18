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
        	<h2>List</h2>
        	<p>ArrayList, Vector, LinkedList class implement List interface. We will see implementation and time complexity of each.</p>
		<h3>ArrayList</h3>
        	<pre class="pres">
class arrayList{
	public static void main(String...strings){
		ArrayList < Integer > al = new ArrayList < Integer > ();
		al.add(10);			// [10]			time complexity - O(1)
		al.add(11);			// [10,11]		time complexity - O(1)
		al.add(12);			// [10,11,12]		time complexity - O(1)
		al.add(13);			// [10,11,12,13]	time complexity - O(1)
		al.add(0,9);			// [9,10,11,12,13]	time complexity - O(n)	adding Object at index 0
		al.remove(0);			// [10,11,12,13]	time complexity - O(n)	removing object at index 0
		al.remove(new Integer(10));	// [11,12,13]		time complexity - O(n)	removing particular object 
							//which could be at any place in this case it is on index 0
		al.set(0, new Integer(10));	// [10,12,13]		time complexity - O(1)
		System.out.println(al.size());
	}
}</pre>
<p>Time Complexity of adding/removing in ArrayList at the end is O(1) where any place other then end is o(n) since all element need to shift by one place.  </p>
<p>Default size of ArrayList is 10 which will grow by below algoritm according of JDK 1.7 and equal to half of the size of threshold size. Time complexity for 
below code will be O(n) since it has to shift all element of old array to new array;</p>
<pre class="pres">
private void grow(int minCapacity) {
        // overflow-conscious code
        int oldCapacity = elementData.length;
        int newCapacity = oldCapacity + (oldCapacity >> 1);	// for minCapacity=10, newCapacity=15
        if (newCapacity - minCapacity < 0)
            newCapacity = minCapacity;
        if (newCapacity - MAX_ARRAY_SIZE > 0)
            newCapacity = hugeCapacity(minCapacity);
        // minCapacity is usually close to size, so this is a win:
        elementData = Arrays.copyOf(elementData, newCapacity);
}</pre>
<h3>Sorting</h3>
<p>Sorting element when ArrayList contains only primitive time is very easy.</p>
<pre class="pres">
class arrayList{
	public static void main(String...strings){
		ArrayList < Integer > al = new ArrayList < Integer > ();
		al.add(10);			
		al.add(9);			
		al.add(11);			
		al.add(8);			
		al.add(12);		
		System.out.println(al.toString());
		Collections.sort(al);
		System.out.println(al.toString());
	}
}</pre>
<p>Let see how difficult it is when sorting is required on some Class object.
<pre class="pres">
class UIDObject{
	int uid ;
	String name;	
	UIDObject(int u, String n){
		uid = u ;
		name = n ;
	}
}
class ComparatorUID implements Comparator<UIDObject>{
	@Override
	public int compare(UIDObject o1, UIDObject o2) {
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
class arrayList{
	ArrayList < UIDObject > al = new ArrayList<UIDObject>() ;
	public static void main(String...strings){
		arrayList ar = new arrayList();
		ar.al.add(new UIDObject(10, "Micky"));
		ar.al.add(new UIDObject(9, "Mini"));
		ar.al.add(new UIDObject(11, "Pluto"));
		ar.al.add(new UIDObject(8, "Donald"));
		ar.al.add(new UIDObject(12, "goofy"));
		System.out.println(ar.toString());
		Collections.sort(ar.al, new ComparatorUID());
		System.out.println(ar.toString());
	}
	@Override
	public String toString(){
		String tempString = "";
		for(Object obj : al){
			UIDObject temp = (UIDObject)obj;
			tempString += "[" + temp.uid + "," + temp.name + "] ";
		}
		return tempString;
	}
}</pre>
<p>Above example let you sort object of some other class. What about if you want to sort the object of its own class.
<pre class="pres">
class UIDObject implements Comparable<UIDObject>{
	int uid ;
	String name;	
	UIDObject(int u, String n){
		uid = u ;
		name = n ;
	}
	public static void main(String...strings){
		ArrayList < UIDObject > al = new ArrayList<UIDObject>() ;	
		al.add(new UIDObject(10, "Micky"));
		al.add(new UIDObject(9, "Mini"));
		al.add(new UIDObject(11, "Pluto"));
		al.add(new UIDObject(8, "Donald"));
		al.add(new UIDObject(12, "goofy"));
		Collections.sort(al);
	}
	@Override
	public int compareTo(UIDObject o) {
		// TODO Auto-generated method stub
		if(uid > o.uid){
			return 1;
		}else if(uid < o.uid){
			return -1;
		}else{
			return 0;
		}
	}
}</pre>
<p>Try yourself to print element on the console.</p>
<p>Collections.sort(List); and Collections.sort(List,Comparator); is applicable to ArrayList, Vector and LinkList since all these classes implements List interface.  </p>
<h3>Vector</h3>
<p>Vector is basically same as an ArrayList, but Vector methods are synchronized for adding and removing element. Vector and ArrayList are two classes 
to implement RandomAccess. Time complexity is same as ArrayList.</p>        	
<h3>LinkedList</h3>
<pre class="pres">
class linkList{
	//static int MAX_ARRAY_SIZE = Integer.MAX_VALUE - 8;
	public static void main(String...strings){
		LinkedList< Integer > al = new LinkedList< Integer >();
		al.add(10);
		al.add(11);
		al.add(12);
		al.add(13);
		al.add(0,9);
		al.remove(0);
		al.remove(new Integer(10));
		al.set(0, new Integer(10));;
		System.out.println(al.size());
}</pre>
<p>LinkList in java is maintained using Node which is maintaining element, reference to next and reference to previous node. Time complexity of insertion and 
removal of element if element location is not known then it is O(n). If location is know then it is O(1) since it is only unlink the internal node and change of
 reference. Traversal of element is expensive operation and take O(n) time. Node Of LinkedList used to maintain the data is something like below.</p>
<pre class="pres">
private static class Node<E> {
        E item;
        Node< E > next;
        Node< E > prev;

        Node(Node< E > prev, E element, Node< E > next) {
            this.item = element;
            this.next = next;
            this.prev = prev;
        }
}</pre>
<p> LinkedList also implement Queue interface and it's method which we will discuss in PriorityQueue.</p> 
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>