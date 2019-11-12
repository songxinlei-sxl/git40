package beiyou.java.web.vo;

public class GameShop {
	private int sid;
	private String sname;
	private String details;
	private String type;
	private String maker;
	private int count;
	private String src;
	private String desc;
	private double price;
	private int num;
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "GameShop [sid=" + sid + ", sname=" + sname + ", details=" + details + ", type=" + type + ", maker="
				+ maker + ", count=" + count + ", src=" + src + ", desc=" + desc + ", price=" + price + ", num=" + num
				+ "]";
	}
	
	

	
}
