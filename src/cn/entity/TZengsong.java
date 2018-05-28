package cn.entity;

/**
 * TZengsong entity. @author MyEclipse Persistence Tools
 */

public class TZengsong implements java.io.Serializable {

	// Fields

	private Integer id;
	private TUser myuser;
	private TUser frienduser;
	private TLiwu liwu;

	// Constructors

	/** default constructor */
	public TZengsong() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TUser getMyuser() {
		return myuser;
	}

	public void setMyuser(TUser myuser) {
		this.myuser = myuser;
	}

	public TUser getFrienduser() {
		return frienduser;
	}

	public void setFrienduser(TUser frienduser) {
		this.frienduser = frienduser;
	}

	public TLiwu getLiwu() {
		return liwu;
	}

	public void setLiwu(TLiwu liwu) {
		this.liwu = liwu;
	}

	

}