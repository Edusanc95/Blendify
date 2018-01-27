import java_cup.runtime.Symbol;
import java.util.*;

public class utility{
	public static final Hashtable<String, Integer> keyWord =
	new Hashtable<String, Integer>() {{		
 	    put("begin", sym.BEGIN); 		
 	    put("end", sym.END);		
 	    put("declaration", sym.DECLARATION);		
 	    put("action", sym.ACTION);		
 	    put("static", sym.STATIC_OBJECT);		
 	    put("dynamic", sym.DYNAMIC_OBJECT);
 	    put("start_simulation", sym.START_SIMULATION);	
 	    put("location", sym.LOCATION);		
 	    put("scale", sym.SCALE);		
 	    put("rotation", sym.ROTATION);		
 	    put("weight", sym.WEIGHT);		
 	    put("speed", sym.SPEED);		
 	    put("Cube", sym.TYPE_FIGURE);		
 	    put("Sphere" , sym.TYPE_FIGURE);		
 	    put("Cone" , sym.TYPE_FIGURE);		
 	    put("Cylinder" , sym.TYPE_FIGURE);			
 	    put("Plane" , sym.TYPE_FIGURE);		
 	}};		
}
