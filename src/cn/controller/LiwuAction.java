package cn.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;

import cn.dao.GuanzhuDao;
import cn.dao.LiwuDao;
import cn.dao.UserDao;
import cn.dao.ZengsongDao;
import cn.entity.TGuanzhu;
import cn.entity.TLiwu;
import cn.entity.TUser;
import cn.entity.TZengsong;
import cn.util.PageBean;

@Controller("liwuAction")
public class LiwuAction extends BaseAction {
	private Integer id;
	private String name;
	private TLiwu liwu=new TLiwu();
	
	private Integer friendid;
	private Integer liwuid;
	private Integer num;
	private Integer type;//0积分1是余额
	
	private List<TLiwu> list=new ArrayList<TLiwu>();
	private List<TZengsong> zengsongs=new ArrayList<TZengsong>();
	private PageBean pageBean=new PageBean();
	@Autowired
	@Qualifier("liwuDao")
	private LiwuDao liwuDao;
	@Autowired
	@Qualifier("zengsongDao")
	private ZengsongDao zengsongDao;
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	
	// 列表
	public String list() {
		String hql = "from TLiwu u where 1=1";
		String sqlCount="select count(*) from TLiwu u where 1=1";
		if(name!=null && !"".equals(name)){
			hql+=" and u.name like '%"+name+"%'";
			sqlCount+=" and u.name like '%"+name+"%'";	
		}
		
		sqlCount+=" and u.isdel=1";
		hql+=" and u.isdel=1";
		pageBean.setTotalCount(liwuDao.getCount(sqlCount));
		list=liwuDao.getByPage(hql, pageBean.getPageNo(), pageBean.getPageSize());
		return "success";

	}
	
	// 列表
	public String liwulist() {
		request.setAttribute("uid", id);
		String hql = "from TLiwu u where u.isdel=1";
		list=liwuDao.getByHql(hql);
		TUser u = (TUser) session.getAttribute("currentUser");
		String hql2 = "from TZengsong z where z.myuser.id="+u.getId();
		zengsongs=zengsongDao.getByHql(hql2);
		request.setAttribute("zengsongs", zengsongs);
		return "liwulist";
	}
	public String detail() throws IOException{
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		TLiwu liwu=liwuDao.get(TLiwu.class, id);		
		out.print(JSON.toJSONString(liwu));
		out.close();
		return null;
	}
	
	public String add() {
		liwu.setIsdel("1");
		liwuDao.add(liwu);
		return "list";
	}
	
	public String zs() {
		TUser myuser = (TUser) session.getAttribute("currentUser");
		TUser frienduser=userDao.get(TUser.class, friendid);
		TLiwu liwu=liwuDao.get(TLiwu.class, liwuid);
		TZengsong zs=new TZengsong();
		zs.setFrienduser(frienduser);
		zs.setMyuser(myuser);
		zs.setLiwu(liwu);
		zengsongDao.add(zs);
		
		TUser user=userDao.get(TUser.class, myuser.getId());
		if(type==0){//积分
			user.setVipjifen(myuser.getVipjifen()-num);
		}else{
			//加积分
			user.setVipjifen(myuser.getVipjifen()+num);
			user.setVipyue(myuser.getVipyue()-num);
		}
		userDao.update(user);	
		return "liwulist";
	}
	//修改
	public String update() {
		TLiwu u=liwuDao.get(TLiwu.class, id);
		u.setIsduihuan(liwu.getIsduihuan());
		u.setName(liwu.getName());
		u.setPrice(liwu.getPrice());
		u.setTupian(liwu.getTupian());
		liwuDao.update(u);
		return "list";
	}
	public String delete() {
		TLiwu u=liwuDao.get(TLiwu.class, id);
		u.setIsdel("0");
		liwuDao.update(u);
		return "list";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TLiwu getLiwu() {
		return liwu;
	}

	public void setLiwu(TLiwu liwu) {
		this.liwu = liwu;
	}

	public List<TLiwu> getList() {
		return list;
	}

	public void setList(List<TLiwu> list) {
		this.list = list;
	}

	public LiwuDao getLiwuDao() {
		return liwuDao;
	}

	public void setLiwuDao(LiwuDao liwuDao) {
		this.liwuDao = liwuDao;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public List<TZengsong> getZengsongs() {
		return zengsongs;
	}

	public void setZengsongs(List<TZengsong> zengsongs) {
		this.zengsongs = zengsongs;
	}


	public Integer getFriendid() {
		return friendid;
	}

	public void setFriendid(Integer friendid) {
		this.friendid = friendid;
	}

	public Integer getLiwuid() {
		return liwuid;
	}

	public void setLiwuid(Integer liwuid) {
		this.liwuid = liwuid;
	}

	public ZengsongDao getZengsongDao() {
		return zengsongDao;
	}

	public void setZengsongDao(ZengsongDao zengsongDao) {
		this.zengsongDao = zengsongDao;
	}

	

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	


}
