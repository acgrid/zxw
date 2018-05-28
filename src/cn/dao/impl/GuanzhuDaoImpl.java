package cn.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import cn.dao.GuanzhuDao;
import cn.entity.TGuanzhu;

@Repository("guanzhuDao")
public class GuanzhuDaoImpl extends GenericDaoImpl<TGuanzhu> implements GuanzhuDao{
	@Autowired
	@Qualifier("sessionFactory")
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setMySessionFactory(sessionFactory);
	}
}
