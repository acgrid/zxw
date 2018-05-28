package cn.entity;

/**
 * TMessage entity. @author MyEclipse Persistence Tools
 */

public class TMessage implements java.io.Serializable {

	// Fields

	private Integer id;
	private TUser myuser;
	private TUser frienduser;
	private String msg;
	private String msgtime;

	// Constructors

	/** default constructor */
	public TMessage() {
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

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getMsgtime() {
		return msgtime;
	}

	public void setMsgtime(String msgtime) {
		this.msgtime = msgtime;
	}

	

}