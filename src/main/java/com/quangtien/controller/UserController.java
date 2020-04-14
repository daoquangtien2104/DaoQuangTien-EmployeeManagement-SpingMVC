package com.quangtien.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quangtien.dao.User_Dao;
import com.quangtien.model.Users;

@Controller
@Transactional
@RequestMapping("/user")
public class UserController {
	@Autowired
	User_Dao user_Dao;
	public static final String FILE_INCLUDE_PATH = "/WEB-INF/views/user/index.jsp";

	@RequestMapping
	public String getUser() {
		return "redirect:/user/index";
	}

	@RequestMapping("/index")
	public String viewUser(ModelMap model) {
		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		return "trang-chu";
	}

	@RequestMapping("/search")
	public String searchUser(ModelMap model, @RequestParam("search") String search) {
		List<Users> list = user_Dao.selectUser(search);
		model.addAttribute("users", list);
		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		return "trang-chu";
	}

	@RequestMapping(value = "/index",params = "btnUpdate",method = RequestMethod.POST)
	public String editUser(ModelMap model, @RequestParam("username") String username,@RequestParam("password") String password,@RequestParam("fullname") String fullname) 
	{
		Users user = user_Dao.findById(username);

		if (user != null) 
		{
			user = new Users(username, password, fullname);
			if (user_Dao.update(user))
			{
				model.addAttribute("users", user_Dao.getListUser());
				model.addAttribute("msgSuccess", "Cập nhật thành công!");
			}
			else {
				model.addAttribute("msgError", "Cập nhật thất bại, đã có lỗi sảy ra!");
			}
		}
		else
		{
			model.addAttribute("msgError", "Tài khoản này không tồn tại!");
		}
		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		return "trang-chu";
	}

	@RequestMapping(value = "/index", params = "btnDelete",method = RequestMethod.POST)
	public String deleteUser(ModelMap model, @RequestParam("username") String deleteId) {
		Users user = user_Dao.select(deleteId);

		if (user_Dao.select(deleteId) != null) 
		{
			if (user_Dao.deleteUser(user)) 
			{
				model.addAttribute("users", user_Dao.getListUser());
			}
		}
		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		return "trang-chu";
	}

	@RequestMapping(value = "/index", params = "btnInsert",method = RequestMethod.POST)
	public String insertUser(ModelMap model, @RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("fullname") String fullname) {

		Users user = user_Dao.findById(username);

		if (user == null) 
		{
			Users use = new Users(username, password, fullname);

			if (user_Dao.insert(use)) {
				model.addAttribute("users", user_Dao.getListUser());
				model.addAttribute("msgSuccess", "Thêm tài khoản thành công!");
			}
		} 
		else 
		{
			model.addAttribute("msgError", "Tài khoản này đã tồn tại!");
		}

		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		return "trang-chu";
	}

	@ModelAttribute("users")
	public List<Users> getUsers() {
		return user_Dao.getListUser();
	}

}
