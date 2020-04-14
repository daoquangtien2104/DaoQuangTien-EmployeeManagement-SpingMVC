package com.quangtien.dao;

import java.util.Arrays;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository

public class StatisticDAO {
	@Autowired
	SessionFactory factory;

	// Lấy ra top 10 nhân viên có điểm thưởng cao nhất trong tháng, nếư month = 0
	// thì lấy ra trong năm
	// Lấy ra top 10 phòng ban có điểm thưởng cao nhất trong tháng, nếư month = 0
		// thì lấy ra trong năm
		/*
		 * 0: mã nhân viên
		 * 1: hình nhân viên
		 * 2: tên nhân viên
		 * 3: điểm thưởng
		 * 4: điểm phạt
		 * 5: tổng điểm
		 */
	public List<Object[]> getTop10Staff(int month) {
		Session session = factory.getCurrentSession();
		List<Object[]> listTop10;
		Query query = session.createSQLQuery("{call sp_getTop10StaffWithGoodRecord(:month)}");
		query.setParameter("month", month);
		listTop10 = query.list();
//		System.out.println(listTop10.size());
//		System.out.println(Arrays.toString(listTop10.get(0)));
		return listTop10;
	}

	// Lấy ra top 10 phòng ban có điểm thưởng cao nhất trong tháng, nếư month = 0
	// thì lấy ra trong năm
	/*
	 * 0: mã phòng
	 * 1: tên phòng
	 * 2: tổng số nhân viên
	 * 3: điểm thưởng
	 * 4: điểm phạt
	 * 5: tổng điểm
	 */
	public List<Object[]> getTop10SDepart(int month) {
		Session session = factory.getCurrentSession();
		List<Object[]> listTop10;
		Query query = session.createSQLQuery("{call sp_getTop10DepartWithGoodRecord(:month)}");
		query.setParameter("month", month);
		listTop10 = query.list();
		return listTop10;
	}
}
