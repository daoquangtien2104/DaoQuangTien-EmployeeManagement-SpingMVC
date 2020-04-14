package com.quangtien.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quangtien.dao.StatisticDAO;

@Controller
@RequestMapping("/index")
@Transactional
public class HomeController 
{
	@Autowired
	StatisticDAO statisticDAO;
	
	public static final String FILE_INCLUDE_PATH = "/WEB-INF/views/main/index.jsp";
	
	@RequestMapping
	public String getIndex(ModelMap model, @RequestParam(name = "statisticMonth", defaultValue = "0") int statisticMonth)
	{
		model.addAttribute("listTopStaff",  statisticDAO.getTop10Staff(statisticMonth));
		model.addAttribute("listTopDepart",  statisticDAO.getTop10SDepart(statisticMonth));
		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		return "trang-chu";
	}
	
	/*
	 * 0: maNV
	 * 1: tenNV
	 * 2: AnhNV
	 * 3: phieuThuong
	 * 4: phieuPhat
	 * 5: tongDiem
	 */
	@ModelAttribute("listTopStaff")
	public List<Object[]> getTopStaff()
	{
		List<Object[]> list = statisticDAO.getTop10Staff(0);
		return list;
	}
	
	/*
	 * 0: maNV
	 * 1: tenNV
	 * 2: AnhNV
	 * 3: phieuThuong
	 * 4: phieuPhat
	 * 5: tongDiem
	 */
	@ModelAttribute("listTopDepart")
	public List<Object[]> getTopDepart()
	{
		List<Object[]> list = statisticDAO.getTop10SDepart(0);
		return list;
	}
	
}
