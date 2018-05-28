package cn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import cn.dao.AdminDao;
import cn.entity.TAdmin;
import cn.util.PageBean;

@Controller("adminAction")
public class AdminAction extends BaseAction {
	private Integer id;
	private String username;
	private String password;
	private String password1;

	@Autowired
	@Qualifier("adminDao")
	private AdminDao adminDao;

	// 登录
	public String login() {
		String hql = "";
		hql = "from TAdmin u where username=? and password=?";
		List<TAdmin> list = adminDao.getByHql(hql, username, password);
		if (list != null && list.size() > 0) {
			TAdmin admin = list.get(0);
			session.setAttribute("currentAdmin", admin);
			return "index";
		}
		request.setAttribute("msg", "登录失败!");
		return "login";

	}

	public String updatepwd() {
		
			TAdmin admin = (TAdmin) session.getAttribute("currentAdmin");
			if (!password.equals(admin.getPassword())) {
				request.setAttribute("msg", "原密码不正确!");
				return "updatepwd";
			} else {
				admin.setPassword(password1);
				adminDao.update(admin);
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

	public AdminDao getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
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

}
