package gjvm;

public class JavaService {

	String name;
	
	public void setName(String name){
		this.name = name;
	}
	public String hello(){
		return "Hello " + name;
	}
}
