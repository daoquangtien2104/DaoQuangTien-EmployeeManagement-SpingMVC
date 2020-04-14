package com.quangtien.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.quangtien.dao.User_Dao;
import com.quangtien.model.Users;

@Controller
@Transactional
@RequestMapping("/login")
public class LoginController {
	@Autowired
	User_Dao user_Dao;
	public static final String FILE_INCLUDE_PATH = "/WEB-INF/views/main/index.jsp";

	@RequestMapping
	public String getLoogin(ModelMap model) {
		return "login/index";
	}

	@RequestMapping(value = "/sign", method = RequestMethod.POST)
	public String login(ModelMap model,HttpSession session, @RequestParam("username") String username,
			@RequestParam("password") String password, HttpServletRequest request, HttpServletResponse response) {
		Users users = user_Dao.select(username);
		System.out.println("0");
		if (users != null && username.equals(users.getUsername())) {
			System.out.println("1");
			if (password.equals(users.getPassword())) 
			{
				System.out.println("dn OK");
				session.setAttribute("users", users);
				if (request.getParameter("remember") != null) {
					Cookie cookie_username = new Cookie("user_username", users.getUsername());
					cookie_username.setMaxAge(60*60*24);
					response.addCookie(cookie_username);
					
					Cookie cookie_password = new Cookie("user_password", users.getPassword());
					cookie_password.setMaxAge(60*60*24);
					response.addCookie(cookie_password);
				}
				else 
				{
					Cookie cookie_username = new Cookie("user_username", null);
					cookie_username.setMaxAge(0);
					response.addCookie(cookie_username);
					
					Cookie cookie_password = new Cookie("user_password", null);
					cookie_password.setMaxAge(0);
					response.addCookie(cookie_password);
				}
				
				
				
				return "redirect:/index";
				
			} else {
				System.out.println("2");
				model.addAttribute("messeger", "Mật khẩu không đúng");
			}
		} else {
			System.out.println("3");
			model.addAttribute("messeger", "Tài khoản này không tồn tại");
		}
		return "login/index";
	}
	
	@RequestMapping("/logout")
	public String logOut(HttpSession session)
	{
		session.setAttribute("users",null);
		return "redirect:/login";
	}

}
