import org.stringtemplate.v4.*;
import java.util.LinkedList;

public class ContainerST{
	private LinkedList<ST> list;

	public ContainerST(){
		this.list = new LinkedList<ST>();
	}

	public void add(ST template){
		list.add(template);
	}

	public ST poll(){
		return list.removeLast();
	}

	public boolean isEmpty(){
		return list.size() == 0;
	}

	public boolean contains(Object obj){
		return list.contains(obj);
	}

	public LinkedList<ST> getList(){
		return list;
	}
}