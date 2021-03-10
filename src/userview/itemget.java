package userview;

public class itemget {
	private String mainURL;
	private String name;
	private int rent;
	private String model;
	public String getMainURL() {
		return mainURL;
	}
	public void setMainURL(String mainURL) {
		this.mainURL = mainURL;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRent() {
		return rent;
	}
	public void setRent(int rent) {
		this.rent = rent;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	
	
	@Override
	public String toString() {
		return "itemget [mainURL=" + mainURL + ", name=" + name + ", rent=" + rent + ", model=" + model + "]";
	}
	
	
}
