package cn.entity;

import java.util.ArrayList;
import java.util.List;

import cn.dao.BaomingDao;

/**
 * TGuanzhu entity. @author MyEclipse Persistence Tools
 */

public class THuodong implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private String pic;
	private String htime;
	
	
	private List<TBaoming> baomings=new ArrayList<TBaoming>();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getHtime() {
		return htime;
	}
	public void setHtime(String htime) {
		this.htime = htime;
	}
	public List<TBaoming> getBaomings() {
		return baomings;
	}
	public void setBaomings(List<TBaoming> baomings) {
		this.baomings = baomings;
	}

	
	
}