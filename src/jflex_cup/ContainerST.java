import org.stringtemplate.v4.*;
import java.util.LinkedList;
import java.util.Queue;

public class ContainerST{
	private Queue<ST> qe;

	public ContainerST(){
		this.qe = new LinkedList<ST>();
	}

	public void add(ST template){
		qe.add(template);
	}

	public ST poll(){
		return qe.poll();
	}

	public boolean isEmpty(){
		return qe.peek() == null;
	}
}