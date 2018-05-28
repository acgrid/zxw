package cn.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import cn.dao.ZengsongDao;
import cn.entity.TZengsong;

@Repository("zengsongDao")
public class ZengsongDaoImpl extends GenericDaoImpl<TZengsong> implements ZengsongDao{
	@Autowired
	@Qualifier("sessionFactory")
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setMySessionFactory(sessionFactory);
	}
}
