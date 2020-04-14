package com.quangtien.controller;

import java.util.List;

import javax.naming.directory.SearchControls;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quangtien.dao.Depart_Dao;
import com.quangtien.model.Depart;

@Controller
@Transactional
@RequestMapping("/depart")
public class DepartController {
	@Autowired
	Depart_Dao depart_Dao;
	public static final String FILE_INCLUDE_PATH = "/WEB-INF/views/depart/index.jsp";

	@RequestMapping
	public String redirectDepart() {
		return "redirect:/depart/index";
	}

	@RequestMapping("/index")
	public String departView(ModelMap model) {
		List<Depart> list = depart_Dao.getListDepart();
		model.addAttribute("departList", list);

		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		return "trang-chu";
	}
	
	@RequestMapping(value = "/index", params = "search")
	public String searchDepart(ModelMap model,@RequestParam("search") String search)
	{
		
		List<Depart> list = depart_Dao.searchDepart(search);
		model.addAttribute("departList", list);
		
		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		return "trang-chu";
	}

	@RequestMapping("/edit")
	public String getitem(ModelMap model, @RequestParam("editId") String editId) {
		List<Depart> list = depart_Dao.showdetail(editId);
		model.addAttribute("editValue", list.get(0));

		List<Depart> listDeparts = depart_Dao.getListDepart();
		model.addAttribute("departList", listDeparts);

		// Set addtribute cho đường dẫn
		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		return "trang-chu";
	}

	@RequestMapping(value = "/index", params = "btnInsert")
	public String insert(ModelMap model, @RequestParam("id") String id, @RequestParam("name") String name) 
	{
		Depart depart = new Depart(id, name);
		
		if (id.length() > 0 && name.length() > 0) 
		{
			if (depart_Dao.findByid(id) == null) 
			{
				if (depart_Dao.insertDepart(depart))
				{
					model.addAttribute("msgSuccess", "Insert thành công");
				}
				else 
				{
					model.addAttribute("msgError", "Insert không thành công!!!!!");
				}
			}
			else 
			{
				model.addAttribute("msgError", "Mã <b>"+ id +"</b> này đã tồn tại");
			}
			
		}
		
		model.addAttribute("departList", depart_Dao.getListDepart());
		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		return "trang-chu";
	}

	@RequestMapping(value = "/index",params = "btnDelete")
	public String deleteDe(ModelMap model, @RequestParam("id") String id, @RequestParam("name") String name) {
		Depart depart = new Depart(id, name);
		if (depart_Dao.deleteDepart(depart))
		{
			model.addAttribute("msgSuccess", "Xóa phòng ban thành công!");
		
		}
		else 
		{
			model.addAttribute("msgError", "Xóa phòng ban thất bại!");	
		}
		
		return departView(model);
	}
	
	@RequestMapping(value = "/index",params = "btnEdit")
	public String updateDepart(ModelMap model,@RequestParam("id") String id,@RequestParam("name") String name)
	{
		Depart depart = new Depart(id, name);
		if (depart_Dao.update(depart)) 
		{
			model.addAttribute("departList", depart_Dao.getListDepart());
			model.addAttribute("msgSuccess", "Cập nhật phòng ban thành công!");
		}
		
		return departView(model);
	}
	
	
	@ModelAttribute("departList")
	public List<Depart> getlist()
	{
		return depart_Dao.getListDepart();
	}
}
