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
        	<h2>Map</h2>
        	<p>Map is Key, value pair combination of collection where keys are always unique(which is also the
        		bases of Set) however values can be same. Let us understand Map classes with some example.</p>
		<h3>HashMap</h3>
		<p>HashMap choice over other map classes is, it provide efficient access to the element for the same we need to define 
efficient hashCode() implementation. It is always the key object hashCode which used for efficient access, Doesn't matter how efficient 
the hashCode of Value Object</p>
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
		return name.length()+count;
	}
	@Override
	public String toString() {
		return count + " " + name + " are in Jungle. Hashcode bucket # " + this.hashCode();
	}
}
class HASHMAP{
	public static void main(String...strings){
		HashMap< Animal,String > hm = new HashMap< Animal,String >();
		hm.put( new Animal(2,"Dog"),"Dog");
		hm.put( new Animal(2,"Cat"),"Cat");
		hm.put( new Animal(3,"Tiger"),"Tiger");
		hm.put( new Animal(3,"Horse"),"Horse");
		Iterator< Animal > i = hm.keySet().iterator();
		while(i.hasNext()){
			Animal temp = i.next();
			System.out.println("[KEY={" + temp + "} Value=" + hm.get(temp) + "]");
		}
	}
}
//Output on Console
//[KEY={2 Cat are in Jungle. Hashcode bucket # 5} Value=Cat]
//[KEY={2 Dog are in Jungle. Hashcode bucket # 5} Value=Dog]
//[KEY={3 Horse are in Jungle. Hashcode bucket # 8} Value=Horse]
//[KEY={3 Tiger are in Jungle. Hashcode bucket # 8} Value=Tiger]
</pre>
<p>Lets give some definition to equals method and check the Output. 
<pre class="pres">
class Animal {
	int count ;
	String name;	
	Animal(int c, String n){
		count = c ;
		name = n ;
	}
	@Override
	public boolean equals(Object obj) {
		return this.count == ((Animal)obj).count;
	}
	@Override
	public int hashCode() {
		return name.length()+count;
	}
	@Override
	public String toString() {
		return count + " " + name + " are in Jungle. Hashcode bucket # " + this.hashCode();
	}
}
class HASHMAP{
	public static void main(String...strings){
		HashMap< Animal,String > hm = new HashMap< Animal,String >();
		hm.put( new Animal(2,"Dog"),"Dog");
		hm.put( new Animal(2,"Cat"),"Cat");
		hm.put( new Animal(3,"Tiger"),"Tiger");
		hm.put( new Animal(3,"Horse"),"Horse");
		
		Iterator< Animal > i = hm.keySet().iterator();
		while(i.hasNext()){
			Animal temp = i.next();
			System.out.println("[KEY={" + temp + "} Value=" + hm.get(temp) + "]");
		}
	}
}
//Console Output
//[KEY={2 Dog are in Jungle. Hashcode bucket # 5} Value=Cat]
//[KEY={3 Tiger are in Jungle. Hashcode bucket # 8} Value=Horse]
</pre>
<h3>HashTable</h3>
<p>HashTable is differ from HashMap by it doesn't accept null as key and its methods are synchronized.Synchronization
we will learn later. For Now check the output for below code</p>
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
		return name.length()+count;
	}
	@Override
	public String toString() {
		return count + " " + name + " are in Jungle. Hashcode bucket # " + this.hashCode();
	}
}
class HASHTABLE{
	public static void main(String...strings){
		HashMap< Animal,String > hm = new HashMap< Animal,String >();
		Hashtable< Animal,String > ht = new Hashtable< Animal,String >();
		hm.put( new Animal(2,"Dog"),"Dog");
		ht.put( new Animal(2,"Dog"),"Dog");
		hm.put(null, "Dog");
		ht.put(null, "Dog");
	}
}</pre>
<h3>LinkedHashMap</h3>
<p>LinkedHashMap is Same as HashMap the only difference is, it maintains the order of insertion and with hashCode definition it provide
efficient access.</p>
<h3>TreeMap</h3>
<p>TreeMap is a sorted Map and sorted by the natural order of the elements  using Red-Black Tree. We will see TreeMap with accepting Class Object key.
 Time Complexity of any operation is O(log n)</p>
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
		return name.length()+count;
	}
	@Override
	public String toString() {
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
class TREEMAP{
	public static void main(String...strings){
		TreeMap< Animal,String > hm = new TreeMap< Animal,String >(new AnimalComparator());
		
		hm.put( new Animal(3,"Tiger"),"Tiger");
		hm.put( new Animal(3,"Horse"),"Horse");
		hm.put( new Animal(2,"Dog"),"Dog");
		hm.put( new Animal(2,"Cat"),"Cat");
		
		Iterator< Animal > i = hm.keySet().iterator();
		while(i.hasNext()){
			Animal temp = i.next();
			System.out.println("[KEY={" + temp + "} Value=" + hm.get(temp) + "]");
		}
	}
}
//Console Output
//[KEY={2 Cat are in Jungle. Hashcode bucket # 5} Value=Cat]
//[KEY={2 Dog are in Jungle. Hashcode bucket # 5} Value=Dog]
//[KEY={3 Horse are in Jungle. Hashcode bucket # 8} Value=Horse]
//[KEY={3 Tiger are in Jungle. Hashcode bucket # 8} Value=Tiger]
</pre>
<p>Keys are order by Animal name</p>
        </td>
        <%@ include file="rightPane.jsp" %>
    </tr>
</table>
<%@ include file="comments.jsp" %>
<%@ include file="FooterLink.jsp" %>
<%@ include file="Footer.jsp" %>
</body>
</html>