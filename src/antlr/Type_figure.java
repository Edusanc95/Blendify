public class Type_figure{
	private String figure;
	private String id;

	public Type_figure(String figure, String id){
		this.figure = figure;
		this.id = id;
	}

	public Type_figure(String id){
		this.id = id;
	}

	public String getFigure(){
		return figure;
	}

	public String getId(){
		return id;
	}
}