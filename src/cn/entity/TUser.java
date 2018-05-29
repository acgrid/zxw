package cn.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * TUser entity. @author MyEclipse Persistence Tools
 */

public class TUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String password;
	private String sex;
	private String shengri;
	private String tupian;
	private String dizhi;
	private Integer shengao;//cm
	private Double tizhong;//kg
	private String xueli;
	private Integer yuexin;
	private String shouji;
	private Integer vipyue;
	private Integer vipjifen;
	private Boolean vip;
	private Integer vipexpire;
	

	private String idcard;
	private Integer isyanz;
	private String ganqing;
	private String xingqu;
	private String ysex;
	private String yshengao;
	private String ytizhong;
	private String yyuexin;
	private String yxingqu;
	
	
	private List<TGuanzhu> guanzhus=new ArrayList<TGuanzhu>();
	private List<TGuanzhu> fans=new ArrayList<TGuanzhu>();

	// Constructors

	/** default constructor */
	public TUser() {
	}

	

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getShengri() {
		return this.shengri;
	}

	public void setShengri(String shengri) {
		this.shengri = shengri;
	}

	public String getTupian() {
		return this.tupian;
	}

	public void setTupian(String tupian) {
		this.tupian = tupian;
	}

	public String getDizhi() {
		return this.dizhi;
	}

	public void setDizhi(String dizhi) {
		this.dizhi = dizhi;
	}

	public Integer getShengao() {
		return this.shengao;
	}

	public void setShengao(Integer shengao) {
		this.shengao = shengao;
	}

	public Double getTizhong() {
		return this.tizhong;
	}

	public void setTizhong(Double tizhong) {
		this.tizhong = tizhong;
	}

	public String getXueli() {
		return this.xueli;
	}

	public void setXueli(String xueli) {
		this.xueli = xueli;
	}

	public Integer getYuexin() {
		return this.yuexin;
	}

	public void setYuexin(Integer yuexin) {
		this.yuexin = yuexin;
	}

	public String getShouji() {
		return this.shouji;
	}

	public void setShouji(String shouji) {
		this.shouji = shouji;
	}

	public Integer getVipyue() {
		return this.vipyue;
	}

	public void setVipyue(Integer vipyue) {
		this.vipyue = vipyue;
	}

	public Integer getVipjifen() {
		return this.vipjifen;
	}

	public void setVipjifen(Integer vipjifen) {
		this.vipjifen = vipjifen;
	}
	
	public Boolean isVip(){
		this.vip = this.vipexpire > System.currentTimeMillis() / 1000;
		return this.vip;
	}
	
	public Integer getVipexpire(){
		return this.vipexpire;
	}
	
	public void setVipexpire(Integer expire){
		this.vipexpire = expire;
	}
	
	public void extendVipExpire(Integer days){
		this.setVipexpire((this.isVip() ? this.vipexpire : (int) (System.currentTimeMillis() / 1000)) + days * 86400);
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}



	public List<TGuanzhu> getGuanzhus() {
		return guanzhus;
	}



	public void setGuanzhus(List<TGuanzhu> guanzhus) {
		this.guanzhus = guanzhus;
	}



	public List<TGuanzhu> getFans() {
		return fans;
	}



	public void setFans(List<TGuanzhu> fans) {
		this.fans = fans;
	}



	public String getIdcard() {
		return idcard;
	}



	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}



	public Integer getIsyanz() {
		return isyanz;
	}



	public void setIsyanz(Integer isyanz) {
		this.isyanz = isyanz;
	}



	public String getGanqing() {
		return ganqing;
	}



	public void setGanqing(String ganqing) {
		this.ganqing = ganqing;
	}



	public String getXingqu() {
		return xingqu;
	}



	public void setXingqu(String xingqu) {
		this.xingqu = xingqu;
	}



	public String getYsex() {
		return ysex;
	}



	public void setYsex(String ysex) {
		this.ysex = ysex;
	}



	public String getYshengao() {
		return yshengao;
	}



	public void setYshengao(String yshengao) {
		this.yshengao = yshengao;
	}



	public String getYtizhong() {
		return ytizhong;
	}



	public void setYtizhong(String ytizhong) {
		this.ytizhong = ytizhong;
	}



	public String getYyuexin() {
		return yyuexin;
	}



	public void setYyuexin(String yyuexin) {
		this.yyuexin = yyuexin;
	}



	public String getYxingqu() {
		return yxingqu;
	}



	public void setYxingqu(String yxingqu) {
		this.yxingqu = yxingqu;
	}


}