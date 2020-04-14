package com.quangtien.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quangtien.model.Depart;
import com.quangtien.model.Staffs;

@Service
public class Staffs_Dao 
{
	@Autowired
	SessionFactory factory;

	public List<Staffs> getListStaff() {
		System.out.println(factory);
		Session session = factory.getCurrentSession();
		String hqlString = "FROM Staffs";
		Query query = session.createQuery(hqlString);
		List<Staffs> list = query.list();

		return list;
	}

	public List<Staffs> selectStaff(String search) {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM Staffs where name like :searchName";
		Query query = session.createQuery(hqlString);
		query.setParameter("searchName", "%" + search + "%");
		List<Staffs> list = query.list();

		return list;
	}

	public Staffs findById(String id) {
		Session session = factory.getCurrentSession();
		return session.find(Staffs.class, id);
	}

	public List<Staffs> showDetail(String editId) {
		Session session = factory.getCurrentSession();
		String hqlString = "FROM Staffs where id = :editId";
		Query query = session.createQuery(hqlString);
		query.setParameter("editId", editId);

		List<Staffs> list = query.list();

		return list;
	}

	public boolean insert(Staffs staff) {

		/*
		 * String id = null; String name = null; boolean gender = false; Date birthday =
		 * null; String photo = null; String email = null; String phone = null; double
		 * salary = 0; String notes = null; Depart depart = null;
		 */

		Session session = factory.openSession();
		if (factory != null)
		{
			try {
				session.beginTransaction();
				session.save(staff);
				session.getTransaction().commit();
				return true;
			} catch (Exception e)

			{
				session.getTransaction().rollback();
			}

		}

		return false;
	}

	public boolean delete(Staffs staff)

	{
		Session session = factory.openSession();
		if (factory != null) {
			try {
				session.beginTransaction();
				session.delete(staff);
				session.beginTransaction().commit();
				return true;
			} catch (Exception e) 
			{
				session.getTransaction().rollback();
			}
		}
		return false;
	}

	public boolean update(Staffs staff) {
		Session session = factory.openSession();
		try {
			session.beginTransaction();
			session.update(staff);
			session.getTransaction().commit();
			
			return true;
		} catch (Exception e) {

			session.getTransaction().rollback();
		}
		return false;
	}

	public boolean deletes(Staffs staff) {
		Session session = factory.openSession();

		try 
		{
			session.beginTransaction();
			session.delete(staff);
			session.getTransaction().commit();
			return true;
		} catch (Exception e)
		{
			session.getTransaction().rollback();
		}
		return false;
	}

}
