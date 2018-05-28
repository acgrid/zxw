package cn.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import cn.dao.HuodongDao;
import cn.dao.LiwuDao;
import cn.entity.THuodong;
import cn.entity.TLiwu;

@Repository("huodongDao")
public class HuodongDaoImpl extends GenericDaoImpl<THuodong> implements HuodongDao{
	@Autowired
	@Qualifier("sessionFactory")
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setMySessionFactory(sessionFactory);
	}
}
