package cn.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import cn.dao.GuanzhuDao;
import cn.dao.HuodongDao;
import cn.dao.UserDao;
import cn.entity.TGuanzhu;
import cn.entity.THuodong;
import cn.entity.TUser;
import cn.util.PageBean;

@Controller("userAction")
public class UserAction extends BaseAction {
	private Integer id;
	private String username;
	private String password;
	private String password1;
	
	//搜索选项
	private String sex;
	private String address;
	private String shengao;
	private String tizhong;
	private String xueli;
	private String yuexin;
	private TUser user=new TUser();
	
	
	private String[] xingqu1;
	private String xingqu11;
	private String[] xingqu2;
	private String xingqu22;
	
	private List<TUser> list=new ArrayList<TUser>();
	
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	@Autowired
	@Qualifier("guanzhuDao")
	private GuanzhuDao guanzhuDao;
	
	@Autowired
	@Qualifier("huodongDao")
	private HuodongDao huodongDao;

	// 登录
	public String login() {
		String hql = "";
		hql = "from TUser u where username=? and password=?";
		List<TUser> list = userDao.getByHql(hql, username, password);
		if (list != null && list.size() > 0) {
			TUser user = list.get(0);
			session.setAttribute("currentUser", user);
			//根据完善的信息查找推荐
			List<TUser> tuijians=gettuijian();
			session.setAttribute("tuijians", tuijians);
			
			return "success";
		}
		request.setAttribute("msg", "登录失败!");
		return "success";
	}
	public String logout(){
		session.removeAttribute("currentUser");
		return "success";
	}
	//详情
	public String detail(){
		user=userDao.get(TUser.class, id);
		return "detail";
	}
	//我的
	public String my(){
		TUser u = (TUser) session.getAttribute("currentUser");
		if(u==null){
			return "index";
		}
		user=userDao.get(TUser.class, u.getId());
		return "my";
	}
	//关注
	public String guanzhu(){
		//自己
		TUser user = (TUser) session.getAttribute("currentUser");
		TUser friend=userDao.get(TUser.class, id);
		String hql="from TGuanzhu g where g.myuser=? and g.frienduser=?";
		List<TGuanzhu> guanzhus=guanzhuDao.getByHql(hql, user,friend);
		if(guanzhus!=null && guanzhus.size()>0){
			request.setAttribute("msg", "您已经关注了该用户!");
			return "detail";
		}
		TGuanzhu guanzhu=new TGuanzhu();
		guanzhu.setMyuser(user);
		guanzhu.setFrienduser(friend);
		guanzhuDao.add(guanzhu);
		request.setAttribute("msg", "关注成功!");
		return "detail";
	}
	// 列表
	public String search() {
		String hql = "from TUser u where 1=1";
		if(sex!=null && !"-1".equals(sex)){
			hql+=" and u.sex='"+sex+"'";
		}
		if(address!=null && !"".equals(address)){
			hql+=" and u.address like '%"+address+"%'";
		}
		if(shengao!=null && !"-1".equals(shengao)){
			hql+=" and u.shengao "+shengao;
		}
		if(tizhong!=null && !"-1".equals(tizhong)){
			hql+=" and u.tizhong "+tizhong;
		}
		if(xueli!=null && !"-1".equals(xueli)){
			hql+=" and u.xueli='"+xueli+"'";
		}
		if(yuexin!=null && !"-1".equals(yuexin)){
			hql+=" and u.yuexin "+yuexin;
		}
		
		list = userDao.getByHql(hql);
		
		List<THuodong> huodongs=huodongDao.getAll(THuodong.class);
		session.setAttribute("huodongs", huodongs);
		return "index";

	}
	
	//后台管理
	public String list() {
		String hql = "from TUser u where 1=1";
		if(username!=null && !"".equals(username)){
			hql+=" and u.username='"+username+"'";
		}
		list = userDao.getByHql(hql);
		return "list";
	}
	
	public String add() {
		user.setVipyue(0);
		user.setVipjifen(0);
		user.setIsyanz(0);//开始未验证
		userDao.add(user);
		request.setAttribute("msg", "注册成功,请登录!");
		return "success";
	}
	
	public String tongguo() {
		TUser u=userDao.get(TUser.class, id);
		u.setIsyanz(1);
		
		userDao.update(u);
		session.setAttribute("currentUser", u);
		return "userlist";
	}
	
	//修改个人资料
	public String update() {
		TUser u=userDao.get(TUser.class, id);
		user.setVipjifen(u.getVipjifen());
		user.setVipyue(u.getVipyue());
		
		if(user.getTupian()==null || "".equals(user.getTupian())){
			user.setTupian(u.getTupian());
		}
		userDao.merge(user);
		session.setAttribute("currentUser", user);
	
		return "my";
	}
	public String update2() {
		TUser u=userDao.get(TUser.class, id);
		
		u.setGanqing(user.getGanqing());
		
		String xingqu="";
		if(xingqu1!=null && xingqu1.length>0){
			for(int i=0;i<xingqu1.length;i++){
				xingqu+=(xingqu1[i]+",");
			}
		}
		if(xingqu11!=null && !"".equals(xingqu11)){
			xingqu+=xingqu11;
		}		
		u.setXingqu(xingqu);
		
		String yxingqu="";
		if(xingqu2!=null && xingqu2.length>0){
			for(int i=0;i<xingqu2.length;i++){
				yxingqu+=(xingqu2[i]+",");
			}
		}
		if(xingqu22!=null && !"".equals(xingqu22)){
			yxingqu+=xingqu22;
		}		
		
		u.setYxingqu(yxingqu);
		u.setYsex(user.getYsex());
		u.setYshengao(user.getYshengao());
		u.setYtizhong(user.getYtizhong());
		u.setYyuexin(user.getYyuexin());
		
		
		userDao.update(u);
		session.setAttribute("currentUser", user);
		List<TUser> tuijians=gettuijian();
		session.setAttribute("tuijians", tuijians);
		return "my2";
	}
	
	public List<TUser> gettuijian(){
		List<TUser> tuijians=null;
		TUser user=(TUser)session.getAttribute("currentUser");
		String hql = "from TUser u where 1=0";
		if(user.getYsex()!=null){
			tuijians=new ArrayList<TUser>();
			hql = "from TUser u where 1=1";
			if(user.getYsex()!=null){
				hql+=" and u.sex='"+user.getYsex()+"'";
			}
			
			if(user.getYshengao()!=null && !"-1".equals(user.getYshengao())){
				hql+=" and u.shengao "+user.getYshengao();
			}
			if(user.getYtizhong()!=null && !"-1".equals(user.getYtizhong())){
				hql+=" and u.tizhong "+user.getYtizhong();
			}
		
			if(user.getYyuexin()!=null && !"-1".equals(user.getYyuexin())){
				hql+=" and u.yuexin "+user.getYyuexin();
			}

//			if(user.getYxingqu()!=null && !"".equals(user.getYxingqu())){
//				hql+=" and u.xingqu like '%"+user.getYxingqu()+"%'";
//			}
		}
		tuijians = userDao.getByHql(hql);
		return tuijians;

	}
	
	//vip充值
	//修改个人资料
	public String vip() {
		TUser u=userDao.get(TUser.class, id);
		u.setVipyue(u.getVipyue()+user.getVipyue());
		userDao.update(u);
		session.setAttribute("currentUser", u);
		request.setAttribute("msg", "充值成功!");
		return "vip";
	}
	public String updatepwd() {
			TUser user = (TUser) session.getAttribute("currentUser");
			if (!password.equals(user.getPassword())) {
				request.setAttribute("msg", "原密码不正确!");
				return "updatepwd";
			} else {
				user.setPassword(password1);
				userDao.update(user);
			}
		
		request.setAttribute("msg", "密码修改成功,请重新登录!");
		return "login";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	
	public List<TUser> getList() {
		return list;
	}
	public void setList(List<TUser> list) {
		this.list = list;
	}
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getShengao() {
		return shengao;
	}
	public void setShengao(String shengao) {
		this.shengao = shengao;
	}
	public String getTizhong() {
		return tizhong;
	}
	public void setTizhong(String tizhong) {
		this.tizhong = tizhong;
	}
	public String getXueli() {
		return xueli;
	}
	public void setXueli(String xueli) {
		this.xueli = xueli;
	}
	public String getYuexin() {
		return yuexin;
	}
	public void setYuexin(String yuexin) {
		this.yuexin = yuexin;
	}
	public TUser getUser() {
		return user;
	}
	public void setUser(TUser user) {
		this.user = user;
	}
	public String[] getXingqu1() {
		return xingqu1;
	}
	public void setXingqu1(String[] xingqu1) {
		this.xingqu1 = xingqu1;
	}
	public String getXingqu11() {
		return xingqu11;
	}
	public void setXingqu11(String xingqu11) {
		this.xingqu11 = xingqu11;
	}
	public String[] getXingqu2() {
		return xingqu2;
	}
	public void setXingqu2(String[] xingqu2) {
		this.xingqu2 = xingqu2;
	}
	public String getXingqu22() {
		return xingqu22;
	}
	public void setXingqu22(String xingqu22) {
		this.xingqu22 = xingqu22;
	}
	public GuanzhuDao getGuanzhuDao() {
		return guanzhuDao;
	}
	public void setGuanzhuDao(GuanzhuDao guanzhuDao) {
		this.guanzhuDao = guanzhuDao;
	}
	public HuodongDao getHuodongDao() {
		return huodongDao;
	}
	public void setHuodongDao(HuodongDao huodongDao) {
		this.huodongDao = huodongDao;
	}

}
