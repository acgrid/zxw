package cn.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;

import cn.dao.BaomingDao;
import cn.dao.GuanzhuDao;
import cn.dao.HuodongDao;
import cn.dao.UserDao;
import cn.dao.ZengsongDao;
import cn.entity.TBaoming;
import cn.entity.TGuanzhu;
import cn.entity.THuodong;
import cn.entity.TUser;
import cn.entity.TZengsong;
import cn.util.PageBean;

@Controller("huodongAction")
public class HuodongAction extends BaseAction {
	private Integer id;
	private String title;
	private THuodong huodong=new THuodong();

	private List<THuodong> list=new ArrayList<THuodong>();

	private PageBean pageBean=new PageBean();
	@Autowired
	@Qualifier("huodongDao")
	private HuodongDao huodongDao;
	@Autowired
	@Qualifier("baomingDao")
	private BaomingDao baomingDao;
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	
	// 列表
	public String list() {
		String hql = "from THuodong u where 1=1";
		String sqlCount="select count(*) from THuodong u where 1=1";
		if(title!=null && !"".equals(title)){
			hql+=" and u.title like '%"+title+"%'";
			sqlCount+=" and u.title like '%"+title+"%'";	
		}
		pageBean.setTotalCount(huodongDao.getCount(sqlCount));
		list=huodongDao.getByPage(hql, pageBean.getPageNo(), pageBean.getPageSize());
		return "success";

	}
	
	// 列表
	public String huodonglist() {
		request.setAttribute("uid", id);
		String hql = "from THuodong u";
		list=huodongDao.getByHql(hql);
		return "huodonglist";
	}
	
	public String view() {
		huodong=huodongDao.get(THuodong.class, id);
		return "view";
	}
	
	public String baoming() {
		huodong=huodongDao.get(THuodong.class, id);
		TBaoming baoming=new TBaoming();
		TUser user=(TUser)session.getAttribute("currentUser");
		baoming.setHname(user.getUsername());
		baoming.setHuodong(huodong);
		Serializable pk=baomingDao.add(baoming);
//		response.setContentType("text/json;charset=UTF-8");
//		PrintWriter out=response.getWriter();
//		if((Integer)pk>0){
//			out.print("参加活动成功!");
//		}else{
//			out.print("参加活动失败!");
//		}
//		out.close();
		return "default";
		
	}
	
	
	public String detail() throws IOException{
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out=response.getWriter();
		THuodong huodong=huodongDao.get(THuodong.class, id);		
		out.print(JSON.toJSONString(huodong));
		out.close();
		return null;
	}
	
	public String add() {
		huodongDao.add(huodong);
		return "list";
	}
	
	
	//修改
	public String update() {
		THuodong u=huodongDao.get(THuodong.class, id);
		u.setHtime(huodong.getHtime());
		u.setTitle(huodong.getTitle());
		u.setPic(huodong.getPic());
		huodongDao.update(u);
		return "list";
	}
	public String delete() {
		THuodong u=huodongDao.get(THuodong.class, id);
		huodongDao.delete(huodong);
		return "list";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public THuodong getHuodong() {
		return huodong;
	}

	public void setHuodong(THuodong huodong) {
		this.huodong = huodong;
	}

	public List<THuodong> getList() {
		return list;
	}

	public void setList(List<THuodong> list) {
		this.list = list;
	}

	public HuodongDao getHuodongDao() {
		return huodongDao;
	}

	public void setHuodongDao(HuodongDao huodongDao) {
		this.huodongDao = huodongDao;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public BaomingDao getBaomingDao() {
		return baomingDao;
	}

	public void setBaomingDao(BaomingDao baomingDao) {
		this.baomingDao = baomingDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	


}
