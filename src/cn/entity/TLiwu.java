package cn.entity;

/**
 * TLiwu entity. @author MyEclipse Persistence Tools
 */

public class TLiwu implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String tupian;
	private Integer price;
	private String isduihuan;
	private String isdel;

	// Constructors

	/** default constructor */
	public TLiwu() {
	}

	/** full constructor */
	public TLiwu(String name, String tupian, Integer price, String isduihuan) {
		this.name = name;
		this.tupian = tupian;
		this.price = price;
		this.isduihuan = isduihuan;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTupian() {
		return this.tupian;
	}

	public void setTupian(String tupian) {
		this.tupian = tupian;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getIsduihuan() {
		return this.isduihuan;
	}

	public void setIsduihuan(String isduihuan) {
		this.isduihuan = isduihuan;
	}

	public String getIsdel() {
		return isdel;
	}

	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}
	

}