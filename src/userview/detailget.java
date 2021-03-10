package userview;

public class detailget {
	
	private String url1;
	private String url2;
	private String url3;

	private String name;
	private int rent;
	private int refund;
	private int cost;
	private String model;
	private String dimension;
	private String manfu;
	private String clr;
	private String wg;
	
	private int id;
	private String cat;
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}
	
	public String getUrl1() {
		return url1;
	}
	public void setUrl1(String url1) {
		this.url1 = url1;
	}
	public String getUrl2() {
		return url2;
	}
	public void setUrl2(String url2) {
		this.url2 = url2;
	}
	public String getUrl3() {
		return url3;
	}
	public void setUrl3(String url3) {
		this.url3 = url3;
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
	public int getRefund() {
		return refund;
	}
	public void setRefund(int refund) {
		this.refund = refund;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getDimension() {
		return dimension;
	}
	public void setDimension(String dimension) {
		this.dimension = dimension;
	}
	public String getManfu() {
		return manfu;
	}
	public void setManfu(String manfu) {
		this.manfu = manfu;
	}
	public String getClr() {
		return clr;
	}
	public void setClr(String clr) {
		this.clr = clr;
	}
	public String getWg() {
		return wg;
	}
	public void setWg(String wg) {
		this.wg = wg;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "detailget [url1=" + url1 + ", url2=" + url2 + ", url3=" + url3 + ", name="
				+ name + ", rent=" + rent + ", refund=" + refund + ", cost=" + cost + ", model=" + model
				+ ", dimension=" + dimension + ", manfu=" + manfu + ", clr=" + clr + ", wg=" + wg + ", id=" + id + "]";
	}
	
	
}
