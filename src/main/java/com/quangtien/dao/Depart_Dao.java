package com.quangtien.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quangtien.model.Depart;

@Service
public class Depart_Dao
{
	@Autowired
	SessionFactory factory;
	
	public List<Depart> getListDepart(){
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM Depart");
		List<Depart> list = query.list();
		
		return list;
	}
	
	public List<Depart> showdetail(String departId)
	{
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM Depart where id = :id");
		query.setParameter("id", departId);
		
		List<Depart> list =  query.list();
		
		return list;
	}
	
	public boolean insertDepart(Depart depart)
	{
		Session session = factory.openSession();
		session.beginTransaction();
		try 
		{
			session.save(depart);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) 
		{
			session.getTransaction().rollback();
			// TODO: handle exception
		}
		return false;
	}
	
	public boolean deleteDepart(Depart depart)
	{
		Session session = factory.openSession();
		session.beginTransaction();
		try 
		{
			session.delete(depart);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) 
		{
			session.getTransaction().rollback();
			// TODO: handle exception
		}
		return false;
	}
	
	public Depart findByid(String id)
	{
		Session session = factory.getCurrentSession();
		Depart depart = session.find(Depart.class, id);
		return depart;
	}
	
	public List<Depart> searchDepart(String search)
	{
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM Depart where id like :search or name like :search");
		query.setParameter("search", "%"+search+"%");
		
		List<Depart> list = query.list();
		return list;
	}
	
	public boolean update(Depart depart) 
	{
		Session session =factory.openSession();
		try 
		{
			
			session.beginTransaction();
			session.update(depart);
			session.getTransaction().commit();
			return true;
		}
		catch (Exception e)
		{
			session.getTransaction().rollback();
		}
		return false;
	}
}
