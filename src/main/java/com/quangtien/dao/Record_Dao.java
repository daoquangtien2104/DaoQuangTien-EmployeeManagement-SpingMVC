package com.quangtien.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quangtien.model.Record;
import com.quangtien.model.Staffs;

@Service
public class Record_Dao {
	@Autowired
	SessionFactory factory;

	public List<Record> getlist() {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM Record");
		List<Record> list = query.list();
		return list;
	}

	public List<Object[]> showRecordStaff() {
		Session session = factory.getCurrentSession();
		String hqlString = "SELECT d.id,d.name ,SUM(case when r.type=1 then 1 else 0 end),"
				+ "			SUM(case when r.type=0 then 1 else 0 end)  FROM Depart d ,Staffs s,Record r WHERE d.id = s.depart.id AND r.staff.id = s.id  GROUP BY d.id,d.name";
		Query query = session.createQuery(hqlString);
		List<Object[]> list = query.list();
		return list;
	}
	
	public List<Staffs> showDetaiListStaff(String departId)
	{
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("From Staffs t where t.depart.id = :departid");
		query.setParameter("departid", departId);
		List<Staffs> list = query.list();
		return list;
	}
	
	public List<Record> showDetailRecord(String staffId)
	{
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("From Record r where r.staff.id = :staffId ");
		query.setParameter("staffId", staffId);
		List<Record> list = query.list();
		return list;
	}
	
	public boolean insert(Record r)
	{
		Session session = factory.openSession();
		
		if (factory != null) 
		{
			session.beginTransaction();
			try 
			{
				session.save(r);
				session.getTransaction().commit();
				return true;
			}
			catch (Exception e)
			{
				session.getTransaction().rollback();
			}
		}
		return false;
	}
	
	//Delete RECORD
	public boolean delete(Record r)
	{
		Session session = factory.openSession();
		try 
		{
			session.beginTransaction();
			
			session.delete(r);
			session.getTransaction().commit();
			return true;
			
		}
		catch (Exception e) 
		{
			session.getTransaction().rollback();
		}
		return false;
	}
	
	//Tìm kiếm RECORD theo tên
	public Record findById(int id)
	{
		Session session = factory.getCurrentSession();
		return session.find(Record.class, id);
	}
	
	public boolean update(Record record)
	{
		Session session = factory.openSession();
		try 
		{
			session.beginTransaction();
			session.update(record);
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
