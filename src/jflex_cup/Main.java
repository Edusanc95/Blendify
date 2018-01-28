import java_cup.runtime.Symbol;
import java.io.*;

public class Main {

	static boolean do_debug_parse = false;

	static public void main(String[] args) throws java.io.IOException {
		int count = 1;
		try{
			for(String arg : args){
				parser parser_obj = new parser(new analex(new FileReader(arg)));

				parser_obj.file = "blendify_output" + (count++) + ".py";

				Symbol parse_tree = null;

				if (do_debug_parse)
					parse_tree = parser_obj.debug_parse();
				else
					parse_tree = parser_obj.parse();
				System.out.println("Correct analysis");
			}
		} catch (Exception e) {
				System.out.println("Incorrect analysis!!");
		} 
	}
}
