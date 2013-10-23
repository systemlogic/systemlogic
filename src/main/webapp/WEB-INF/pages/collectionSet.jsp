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
        	<h2>Set</h2>
        	<p>What is special about Set? Set Maintain unique elements in collection and using some Map class. Since we can not have duplicate key
        	same way we can not have duplicate element as what ever we put in set is stored internally in key and dummy object as value. Few of HashSet
        	function have been shown below. </p>
        	
		<h3>HashSet</h3>
        	<pre class="pres">
public class HashSet<E>{
public HashSet() {
        map = new HashMap<>();
}
public boolean add(E e) {
        return map.put(e, PRESENT)==null;
}
// Dummy value to associate with an Object in the backing Map
    private static final Object PRESENT = new Object();

}</pre>
<p>A HashSet is an unsorted, unordered Set. Why? Any Object that is put into the Set is stored according to the hashcode value of the object and goes into 
appropriate hashcode bucket. Two different object can have same hash code and go to same bucket which improves better access performance. Lets start with example 
of set storing primitive type.</p>
<pre class="pres">
class HASHSET{
	public static void main(String...strings){
		HashSet< String > hs = new HashSet< String >();
		hs.add("Dog");
		hs.add("Apple");
		hs.add("Elly");
		hs.add("Ball");
		hs.add("Giraf");
		hs.add("Monkey");
		hs.add("Zoo");
		hs.add("Fan");
		hs.add("Dog");
		Iterator< String > i = hs.iterator();
		while(i.hasNext()){
			String temp = i.next();
			System.out.println(temp +  " hashcode=" + new Integer(temp.hashCode()) );
		}
	}
}</pre>
<p>Checkout the console output for set order which is not same as insertion order. Hash code value has been printed to show what bucket it belongs to.
String object with value "Dog" is inserted only once. Let see HashSet Example with Animal Class object.</p>
<pre class="pres">
class Animal {
	int count ;
	String name;	
	Animal(int c, String n){
		count = c ;
		name = n ;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return name.length()+count;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return count + " " + name + " are in Jungle. Hashcode bucket # " + this.hashCode();
	}
}
class HASHSET{
	public static void main(String...strings){
		HashSet< Animal > hs = new HashSet< Animal >();
		hs.add(new Animal(4,"Dog"));
		hs.add(new Animal(4,"Cat"));
		
		hs.add(new Animal(6,"Tiger"));
		hs.add(new Animal(6,"Horse"));
		
		Iterator< Animal > i = hs.iterator();
		while(i.hasNext()){
			Animal temp = i.next();
			System.out.println(temp);
		}
	}
}
//Console output will be
//4 Cat are in Jungle. Hashcode bucket # 7
//4 Dog are in Jungle. Hashcode bucket # 7
//6 Horse are in Jungle. Hashcode bucket # 11
//6 Tiger are in Jungle. Hashcode bucket # 11
</pre>
<p>Above example will print all object as default equals() method of Animal compare Object refernce which won't be same even if hashCode value is same. 
Object belong to same bucket link to each other using list. Let us give definition to equals method of Animal class.</p> 
<pre class="pres">
class Animal {
	int count ;
	String name;	
	Animal(int c, String n){
		count = c ;
		name = n ;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return name.length()+count;
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		Animal temp = (Animal)obj;
		return this.count == temp.count;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return count + " " + name + " are in Jungle. Hashcode bucket # " + this.hashCode();
	}
}
class HASHSET{
	public static void main(String...strings){
		HashSet< Animal > hs = new HashSet< Animal >();
		hs.add(new Animal(4,"Dog"));
		hs.add(new Animal(4,"Cat"));
		
		hs.add(new Animal(6,"Tiger"));
		hs.add(new Animal(6,"Horse"));
		
		Iterator< Animal > i = hs.iterator();
		while(i.hasNext()){
			Animal temp = i.next();
			System.out.println(temp);
		}
	}
}
//Console output will be
//4 Dog are in Jungle. Hashcode bucket # 7
//6 Tiger are in Jungle. Hashcode bucket # 11
</pre>
<p>According to equals contract two objects are equals when their count is equals. So that is the reason second object with same count won't 
be added to the set.</p>
<h3>LinkedHashSet</h3>
<p>A LinkedHashSet is an ordered version of HashSet that maintains a doubly-linked List across all elements. Use this class instead of HashSet 
when you care about the iteration order. When you iterate through a HashSet the order is unpredictable, while a LinkedHashSet lets you iterate 
through the elements in the order in which they were inserted.
</p>
<h3>TreeSet</h3>
TreeSet in implemented using TreeMap so all property of TreeMap are applicable to TreeSet. TreeSet maintain the element by natural order using
Red-Black Tree. So why we don't need equal() implementation with TreeSet? Whenever we add element to TreeSet it will be traverse node to node by
Comparing the values define in comparator Interface implementation. Equal method of premitive type( int, fload, String) will be call to compare 
the values rather to call equals() method of Class whose object need to be sorted. So if Node with value already present at location in RB-Tree 
then it won't be inserted. Time Complexity of any operation is O(log n).Example will explain how Objects of class are sorted using Comparator interface.
<pre class="pres">
class Animal {
	int count ;
	String name;	
	Animal(int c, String n){
		count = c ;
		name = n ;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return name.length()+count;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return count + " " + name + " are in Jungle. Hashcode bucket # " + this.hashCode();
	}
}
class AnimalComparator implements Comparator< Animal >{
	@Override
	public int compare(Animal o1, Animal o2) {
		// TODO Auto-generated method stub
		return o1.name.compareTo(o2.name);
	}
}
class TREESET{
	public static void main(String...strings){
		TreeSet< Animal > ts = new TreeSet< Animal >(new AnimalComparator());
		ts.add(new Animal(6,"Dog"));
		ts.add(new Animal(6,"Cat"));
		ts.add(new Animal(8,"Tiger"));
		ts.add(new Animal(8,"Horse"));
		Iterator< Animal > i = ts.iterator();
		while(i.hasNext()){
			Animal temp = i.next();
			System.out.println(temp);
		}
	}
}
</pre>
<p>TreeSet contain extra function for searching an object. Checkout the output for below code</p>
<pre class="pres">
class searchingSet{
	public static void main(String...strings){
		TreeSet<Animal> hs = new TreeSet<Animal>(new AnimalComparator());
		hs.add(new Animal(6,"Tiger"));
		hs.add(new Animal(6,"Horse"));
		hs.add(new Animal(5,"Dog"));
		hs.add(new Animal(5,"Cat"));
		Animal a = new Animal(4,"Donkey");
		hs.add(a);
		Animal b = new Animal(4,"Monkey");
		hs.add(b);
		System.out.println(hs);
		TreeSet<Animal> subset = new TreeSet<Animal>();
		subset = (TreeSet<Animal>)hs.headSet(b);
		System.out.println(subset);
		System.out.println("Subset Head Last = " + subset.last());
		System.out.println("Subset Head First = " + subset.first());
		System.out.println("Subset Head Floor = " + subset.floor(a));
		System.out.println("Subset Head Ceil = " + subset.ceiling(a));
		System.out.println("Subset Head Lower = " + subset.lower(a));
		System.out.println("Subset Head Higher = " + subset.higher(a));
		
		subset = (TreeSet<Animal>)hs.tailSet(a);
		
		System.out.println("Subset Tail Last = " + subset.last());
		System.out.println("Subset Tail First = " + subset.first());
		System.out.println("Subset Tail Floor = " + subset.floor(b));
		System.out.println("Subset Tail Ceil = " + subset.ceiling(b));
		System.out.println("Subset Tail Lower = " + subset.lower(b));
		System.out.println("Subset Tail Higher = " + subset.higher(b));
	}
}

//Output on Console
//Subset Head Last = Horse Count in Jungle is=6 Hashcode bucket # 11
//Subset Head First = Cat Count in Jungle is=5 Hashcode bucket # 8
//Subset Head Floor = Donkey Count in Jungle is=4 Hashcode bucket # 10
//Subset Head Ceil = Donkey Count in Jungle is=4 Hashcode bucket # 10
//Subset Head Lower = Dog Count in Jungle is=5 Hashcode bucket # 8
//Subset Head Higher = Horse Count in Jungle is=6 Hashcode bucket # 11
//Subset Tail Last = Tiger Count in Jungle is=6 Hashcode bucket # 11
//Subset Tail First = Donkey Count in Jungle is=4 Hashcode bucket # 10
//Subset Tail Floor = Monkey Count in Jungle is=4 Hashcode bucket # 10
//Subset Tail Ceil = Monkey Count in Jungle is=4 Hashcode bucket # 10
//Subset Tail Lower = Horse Count in Jungle is=6 Hashcode bucket # 11
//Subset Tail Higher = Tiger Count in Jungle is=6 Hashcode bucket # 11
</pre>  
TreeSet and TreeMap Function analogy
<table border="black">
	<tr><th>TreeSet</th><th>TreeMap</th><th>Description</th></tr>
	<tr><td>TreeSet.ceiling(e)</td><td>TreeMap.ceilingKey(e)</td><td>Returns the lowest element >= e</td></tr>
	<tr><td>TreeSet.higher(e)</td><td>TreeMap.higherKey(e)</td><td>Returns the lowest element > e</td></tr>
	<tr><td>TreeSet.floor(e)</td><td>TreeMap.floorKey(e)</td><td>Returns the highest element <= e</td></tr>
	<tr><td>TreeSet.lower(e)</td><td>TreeMap.lowerKey(e)</td><td>Returns the highest element < e</td></tr>
	<tr><td>TreeSet.pollFirst()</td><td>TreeMap.pollFirstEntry()</td><td>Returns and removes the first entry</td></tr>
	<tr><td>TreeSet.pollLast()</td><td>TreeMap.pollLastEntry()</td><td>Returns and removes the last entry</td></tr>
	<tr><td>TreeSet.descendingSet()</td><td>TreeMap.descendingMap()</td><td>Returns in reverse order</td></tr>
	
	
</table>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>