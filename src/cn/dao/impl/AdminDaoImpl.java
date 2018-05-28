package cn.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import cn.dao.AdminDao;
import cn.entity.TAdmin;

@Repository("adminDao")
public class AdminDaoImpl extends GenericDaoImpl<TAdmin> implements AdminDao{
	@Autowired
	@Qualifier("sessionFactory")
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setMySessionFactory(sessionFactory);
	}
}
