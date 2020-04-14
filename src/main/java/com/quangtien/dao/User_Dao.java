package com.quangtien.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.quangtien.model.Users;

@Service
public class User_Dao 
{
	@Autowired
	SessionFactory factory;
	
	public List<Users> getListUser()
	{
		Session session = factory.getCurrentSession();
		String hqlString = "FROM Users";
		Query query = session.createQuery(hqlString);
		List<Users> list = query.list();
		
		return list;
	}
	public Users select(String username)
	{
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM Users WHERE username = :user");
		query.setParameter("user", username);
		Users users;
		if (query.list().size() > 0) 
		{
			 users = (Users) query.list().get(0);
		}
		else 
		{
			 users = null;
		}
	
		return users;
	}
	
	public List<Users> selectUser(String seacrh)
	{
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM Users where username like :username or fullname like :username");
		query.setParameter("username", "%"+seacrh+"%");
		List<Users>	list = query.list();
		
		return list;
	}
	
	public boolean deleteUser(Users user)
	{
		Session session =factory.openSession();
		session.beginTransaction();
		
		try
		{
			session.delete(user);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) 
		{
			session.getTransaction().rollback();
			// TODO: handle exception
		}
		return false;
	}
	
	public boolean insert(Users user)
	{
		Session session = factory.openSession();
		try 
		{
			session.beginTransaction();
			session.save(user);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) 
		{
			session.getTransaction().rollback();
		}
		return false;
	}
	
	public Users findById(String username)
	{
		Session session = factory.getCurrentSession();
		return session.find(Users.class, username);
	}
	
	public boolean update(Users user)
	{
		Session session = factory.openSession();
		try 
		{
			session.beginTransaction();
			session.update(user);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) 
		{
			session.getTransaction().rollback();
		}
	return false;
	}
	
}
