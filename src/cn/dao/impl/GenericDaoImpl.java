package cn.dao.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

import cn.dao.GenericDao;

//通用实现
public class GenericDaoImpl<T> extends HibernateDaoSupport implements GenericDao<T>{	
	public void setMySessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	/**
	 * 增加
	 */
	public Serializable add(T t) {
		return super.getHibernateTemplate().save(t);
	}

	/**
	 * 删除
	 */
	public void delete(T t) {
		super.getHibernateTemplate().delete(t);
	}
	/**
	 * 修改
	 */
	public void update(T t) {
		super.getHibernateTemplate().update(t);
	}
	/**
	 * 根据主键查找
	 */
	public T get(Class entityClass, Serializable pk) {
		return (T)super.getHibernateTemplate().load(entityClass, pk);
	}
	/**
	 * 根据Class对象查找
	 */
	public List<T> getAll(Class entityClass) {
		return (List<T>) super.getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(entityClass));
	}
	/**
	 * 根据sql语句查找
	 */
	public List<T> getByHql(String hql) {
		return (List<T>) super.getHibernateTemplate().find(hql);
	}
	/**
	 * 带参数的sql语句
	 */
	public List<T> getByHql(String hql, Object... args) {
		return (List<T>) super.getHibernateTemplate().find(hql, args);
	}
	/**
	 * 分页查找
	 */
	public List<T> getByPage(final String hql, final int page,final int pageSize) {
		return super.getHibernateTemplate().execute(new HibernateCallback(){
			public List<T> doInHibernate(Session session) throws HibernateException {
				Query query=session.createQuery(hql);
				query.setFirstResult((page-1)*pageSize);
				query.setMaxResults(pageSize);
				return query.list();
			}
		});
	}
	/**
	 * 查找记录数
	 */
	public Integer getCount(String hql){
		Integer count=0;
		List<Long> list=(List<Long>) super.getHibernateTemplate().find(hql);
		if(!list.isEmpty()){
			count=list.get(0).intValue();
		}
		return count;
	}
	public String getMax(String hql){
		String count="";
		List list=(List)super.getHibernateTemplate().find(hql);
		if(!list.isEmpty()){
			Object obj=list.get(0);
			if(obj instanceof Integer){
				count=((Integer)obj).toString();
			}
			if(obj instanceof String){
				count=obj.toString();
			}
		}
		return count;
	}
	public Double tongji(String hql){
		Double count=0.0;
		List<Double> list=(List<Double>) super.getHibernateTemplate().find(hql);
		if(!list.isEmpty()){
			count=list.get(0);
		}
		return count;
	}
	public Integer getCount(String hql,Object... param){
		Integer count=0;
		List<Long> list=(List<Long>) super.getHibernateTemplate().find(hql,param);
		if(!list.isEmpty()){
			count=list.get(0).intValue();
		}
		return count;
	}
	/**
	 * 分页查找
	 */
	//在做模糊查询时，不能用MatchMode.ANYWHERE,只能用"%"
	public List<T> getByPage(final DetachedCriteria dc,final int page,final int pageSize) {
		return super.getHibernateTemplate().executeWithNativeSession(new HibernateCallback(){
			public List<T> doInHibernate(Session session) throws HibernateException {
				return (List<T>) dc.getExecutableCriteria(session).setFirstResult((page-1)*pageSize).setMaxResults(pageSize);
			}
		});
	}
	/**
	 * 查找记录数
	 */
	public Integer getCount(final DetachedCriteria dc) {
		return super.getHibernateTemplate().executeWithNativeSession(new HibernateCallback(){
			public Integer doInHibernate(Session session) throws HibernateException {
				return (Integer)dc.getExecutableCriteria(session).uniqueResult();
			}
		});
	}
	@Override
	public void merge(T t) {
		super.getHibernateTemplate().merge(t);
	}
}
