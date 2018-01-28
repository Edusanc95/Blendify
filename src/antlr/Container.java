import java.util.ArrayList;

public class Container{
	private Location location;
	private Rotation rotation;
	private Scale scale;
	private Speed speed;
	private Weight weight;

	public Container(Location location){
		this.location = location;
	}

	public Container(Rotation rotation){
		this.rotation = rotation;
	}

	public Container(Scale scale){
		this.scale = scale;
	}

	public Container(Speed speed){
		this.speed = speed;
	}

	public Container(Weight weight){
		this.weight = weight;
	}

	public Container(){}

	public Location getLocation(){
		return location;
	}

	public Rotation getRotation(){
		return rotation;
	}

	public Scale getScale(){
		return scale;
	}

	public Speed getSpeed(){
		return speed;
	}

	public Weight getWeight(){
		return weight;
	}

	public void setLocation(Location location){
		this.location = location;
	}

	public void setRotation(Rotation rotation){
		this.rotation = rotation;
	}

	public void setScale(Scale scale){
		this.scale = scale;
	}

	public void setSpeed(Speed speed){
		this.speed = speed;
	}

	public void setWeight(Weight weight){
		this.weight = weight;
	}


}