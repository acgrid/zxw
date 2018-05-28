package cn.entity;

/**
 * TGuanzhu entity. @author MyEclipse Persistence Tools
 */

public class TBaoming implements java.io.Serializable {

	// Fields

	private Integer id;
	private String hname;
	private THuodong huodong;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public THuodong getHuodong() {
		return huodong;
	}
	public void setHuodong(THuodong huodong) {
		this.huodong = huodong;
	}
	
	
}