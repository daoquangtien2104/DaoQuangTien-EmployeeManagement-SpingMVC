package com.quangtien.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.quangtien.dao.Depart_Dao;
import com.quangtien.dao.Staffs_Dao;
import com.quangtien.model.Depart;
import com.quangtien.model.Staffs;

@Controller
@Transactional
@RequestMapping("/staff")
public class StaffController {
	;

	@Autowired
	Staffs_Dao staffsDAO;
	@Autowired
	Depart_Dao depart_Dao;
	@Autowired
	ServletContext context;
	public static final String FILE_INCLUDE_PATH = "/WEB-INF/views/staff/index.jsp";

	@RequestMapping
	public String redirectIndex(ModelMap model) {

		return "redirect:/staff/index";
	}

	@RequestMapping("/index")
	public String index(ModelMap model) {

		List<Staffs> list = staffsDAO.getListStaff();
		model.addAttribute("staffs", list);

		// Set addtribute cho đường dẫn

		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);

		return "trang-chu";
	}

	@RequestMapping("/search")
	public String search(ModelMap model, @RequestParam("search") String search) {

		List<Staffs> list = staffsDAO.selectStaff(search);
		model.addAttribute("staffs", list);

		// Set addtribute cho đường dẫn
		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		return "trang-chu";
	}

	@RequestMapping("/edit")
	public String getEdit(ModelMap model, @RequestParam("editId") String editId) {

		List<Staffs> list1 = staffsDAO.getListStaff();
		model.addAttribute("staffs", list1);

		List<Staffs> list = staffsDAO.showDetail(editId);
		model.addAttribute("editValue", list.get(0));

		// Set addtribute cho đường dẫn
		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);

		return "trang-chu";
	}

	@PostMapping(value = "/index", params = "btnInsert")
	public String insertStaff(ModelMap model, 
								@RequestParam("id") String id, 
								@RequestParam("name") String name,
								@RequestParam("gender") Boolean gender,
								@RequestParam("birthday") @DateTimeFormat(pattern = "yyyy-MM-dd") Date birthday,
								@RequestParam("photo") MultipartFile photo, @RequestParam("email") String email,
								@RequestParam("phone") String phone, 
								@RequestParam("salary") Double salary,
								@RequestParam("notes") String notes, 
								@RequestParam(name = "departId", required = false) String departId)
			throws IllegalStateException, IOException 
	{
		Staffs staff;
		Depart depart = depart_Dao.findByid(departId);
		
		if (staffsDAO.findById(id) == null)
		{
			if (photo.isEmpty()) 
			{
					staff = new Staffs(id, name, gender, birthday, null, email, phone, salary, notes, depart);
			}
			else 
			{
					String path = context.getRealPath("/WEB-INF/resources/img/" + photo.getOriginalFilename());
					System.out.println(path);
					photo.transferTo(new File(path));
					staff = new Staffs(id, name, gender, birthday, photo.getOriginalFilename(), email, phone, salary, notes,depart);
			}

			if (staffsDAO.insert(staff)) 
			{
					model.addAttribute("msgSuccess", "Thêm nhân viên mới thành công!");
			}
			else 
			{
				model.addAttribute("msgError", "Thêm nhân viên thất bại, đã có lỗi sảy ra!");
			}
		}
		else
		{
			model.addAttribute("msgError", "Mã nhân viên <b> " + id + " </b> nay2 đã tồn tại!");
		}

		
		// Set addtribute cho đường dẫn
		
		
		return index(model);
	}

	@RequestMapping(value = "/index", params = "btnUpdate",method = RequestMethod.POST)
	public String updateStaff(	ModelMap model, 
								@RequestParam("id") String id,
								@RequestParam("name") String name,
								@RequestParam("gender") Boolean gender,
								@RequestParam("birthday") @DateTimeFormat(pattern = "yyyy-MM-dd") Date birthday,
								@RequestParam("photo") MultipartFile photo, @RequestParam("email") String email,
								@RequestParam("phone") String phone, @RequestParam("salary") Double salary,
								@RequestParam("notes") String notes, @RequestParam("departId") String departId)
								throws IllegalStateException, IOException 
	{
		Staffs staff = staffsDAO.findById(id);
		Depart depart = depart_Dao.findByid(departId);

		staff.setName(name);
		staff.setGender(gender);
		staff.setGender(gender);
		staff.setBirthday(birthday);
		staff.setEmail(email);
		staff.setPhone(phone);
		staff.setSalary(salary);
		staff.setDepart(depart);
		staff.setNotes(notes);
		
		//nếu có ảnh thì sẽ ghi đè ảnh lên ảnh của đã lưu trên đối tượng 
		if (photo.isEmpty() == false)
		{
			String path = context.getRealPath("/WEB-INF/resources/img/" + photo.getOriginalFilename());
			photo.transferTo(new File(path));
			staff.setPhoto(photo.getOriginalFilename());
			model.addAttribute("staffs", staffsDAO.getListStaff());
		
		}
		model.addAttribute("msgSuccess", "Cập nhật thành công!");
		return index(model);

	}

	@RequestMapping(value = "/index", params = "btnDelete")
	public String deleteStaff(	ModelMap model, 
								@RequestParam("id") String id, 
								@RequestParam("name") String name,
								@RequestParam("gender") Boolean gender,
								@RequestParam("birthday") @DateTimeFormat(pattern = "yyyy-MM-dd") Date birthday,
								@RequestParam("photo") MultipartFile photo, @RequestParam("email") String email,
								@RequestParam("phone") String phone, @RequestParam("salary") Double salary,
								@RequestParam("notes") String notes, @RequestParam("departId") String departId) 
	{
		Staffs staff = staffsDAO.findById(id);
		if (departId == "") 
		{
			staff = new Staffs(id, name, gender, birthday, photo.getOriginalFilename(), email, phone, salary, notes, null);
			if (staffsDAO.deletes(staff))
			{
				model.addAttribute("staffs", staffsDAO.getListStaff());
			}
		}
		else 
		{
			Depart depart = depart_Dao.findByid(departId);
			
			staff = new Staffs(id, name, gender, birthday, photo.getOriginalFilename(), email, phone, salary, notes, depart);
			if (staffsDAO.deletes(staff))
			{
				model.addAttribute("staffs", staffsDAO.getListStaff());
			}
		}
		
		model.addAttribute("msgSuccess", "Xóa nhân viên thành công!");
		return index(model);
	}

	@ModelAttribute("departList")
	public List<Depart> getlistDepart() {
		return depart_Dao.getListDepart();
	}

	@ModelAttribute("staffs")
	public List<Staffs> getliststaff() {
		return staffsDAO.getListStaff();
	}
}
