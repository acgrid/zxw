package cn.entity;

/**
 * TGuanzhu entity. @author MyEclipse Persistence Tools
 */

public class TGuanzhu implements java.io.Serializable {

	// Fields

	private Integer id;
	private TUser myuser;
	private TUser frienduser;

	// Constructors

	/** default constructor */
	public TGuanzhu() {
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

	
}