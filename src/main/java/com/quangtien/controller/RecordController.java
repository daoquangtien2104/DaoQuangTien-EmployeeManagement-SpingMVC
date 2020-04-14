package com.quangtien.controller;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.sql.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quangtien.dao.Depart_Dao;
import com.quangtien.dao.Record_Dao;
import com.quangtien.dao.Staffs_Dao;
import com.quangtien.model.Record;
import com.quangtien.model.Staffs;
import com.quangtien.sendmail.Mailer;

@Controller
@Transactional
@RequestMapping("/record")
public class RecordController {

	@Autowired
	Record_Dao record_Dao;

	@Autowired
	Depart_Dao depart_Dao;

	@Autowired
	Staffs_Dao staffs_Dao;

	@Autowired
	Mailer mailer;
	
	public static final String FILE_INCLUDE_PATH = "/WEB-INF/views/record/index.jsp";

	@RequestMapping
	public String report() {
		return "redirect:/record/index";
	}

	@RequestMapping("/index")
	public String index(ModelMap model) {
		System.out.println("aaaaaaaaaaaaaaaa--------");
		List<Object[]> list = record_Dao.showRecordStaff();

		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);

		return "trang-chu";
	}

	@RequestMapping("/chitiet")
	public String getstaff(@RequestParam("departId") String departId, ModelMap model) {
		List<Staffs> list = record_Dao.showDetaiListStaff(departId);
		model.addAttribute("detailStaffs", list);
		model.addAttribute("lblDepartDetail", depart_Dao.findByid(departId));

		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		return "trang-chu";

	}

	@RequestMapping("/detailStaff")
	public String getRecordStaff(ModelMap model, @RequestParam("staffId") String staffId,
			@RequestParam("departId") String departId) {
		model.addAttribute("listRecord", record_Dao.showDetailRecord(staffId));

		model.addAttribute("detailStaffs", record_Dao.showDetaiListStaff(departId));
		model.addAttribute("lblDepartDetail", depart_Dao.findByid(departId));
		model.addAttribute("lblStaffDetail", staffs_Dao.findById(staffId));
		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		return "trang-chu";
	}

	@RequestMapping(value = "/index", params = "btnInsert")
	public String insertRecord(ModelMap model,
								@RequestParam("staffId") String staffId,
								@RequestParam("type") boolean type, 
								@RequestParam("reason") String reason ) 
	{
		Staffs staff = staffs_Dao.findById(staffId);
		
		Record record = new Record(1, type, reason, new Date(), staff);
		if (record_Dao.insert(record)) 
		{
			String departId = staffs_Dao.findById(staffId).getDepart().getId();
			
			
			mailer.sendMail(staff.getEmail(), record);
			model.addAttribute("msgSuccess", "gửi email thành công");
			
			model.addAttribute("listRecord", record_Dao.showDetailRecord(staffId));
			model.addAttribute("detailStaffs", record_Dao.showDetaiListStaff(departId));
			model.addAttribute("lblStaffDetail", staffs_Dao.findById(staffId));
			model.addAttribute("lblDepartDetail", depart_Dao.findByid(departId));
			model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		}
		
		return "trang-chu";
	}

	@RequestMapping(value = "/index",params = "btnUpdate")
	public String updateRecord(ModelMap model,
								@RequestParam("id") int id,
								@RequestParam("staffId") String staffId,
								@RequestParam("type") boolean type,
								@RequestParam("reason") String reason)
	{
		Record record = record_Dao.findById(id);
		Staffs staff = staffs_Dao.findById(staffId);
		String departId = staff.getDepart().getId();
		
		if (record != null) 
		{
			record.setType(type);
			record.setReason(reason);
			record.setStaff(staff);
			if (record_Dao.update(record))
			{
				model.addAttribute("msgSuccess", "Cập nhật thành công!");
			}
			else 
			{
				model.addAttribute("msgSuccess", "Cập nhật thành công!");
			}
		}
		 	
		model.addAttribute("listRecord", record_Dao.showDetailRecord(staffId));
		model.addAttribute("detailStaffs", record_Dao.showDetaiListStaff(departId));
		model.addAttribute("lblStaffDetail", staffs_Dao.findById(staffId));
		model.addAttribute("lblDepartDetail", depart_Dao.findByid(departId));
		model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		return "trang-chu";
				
	}
	
	@RequestMapping(value = "/index", params = "btnDelete")
	public String deleteRecord(ModelMap model, @RequestParam("id") int recordId)
	{
		Record record = record_Dao.findById(recordId);
		
		if (record_Dao.delete(record)) 
		{
			String departId = staffs_Dao.findById(record.getStaff().getId()).getDepart().getId();

			model.addAttribute("listRecord", record_Dao.showDetailRecord(record.getStaff().getId()));
			model.addAttribute("detailStaffs", record_Dao.showDetaiListStaff(departId));
			model.addAttribute("lblStaffDetail", staffs_Dao.findById(record.getStaff().getId()));
			model.addAttribute("lblDepartDetail", depart_Dao.findByid(departId));
			model.addAttribute("file_include_path", FILE_INCLUDE_PATH);
		}
		return "trang-chu";
	}
	
	
	

	@ModelAttribute("recordStaff")
	public List<Object[]> listRecord() {
		return record_Dao.showRecordStaff();
	}

	@ModelAttribute("listStaff")
	public List<Staffs> listStaff() {
		return staffs_Dao.getListStaff();
	}

}
