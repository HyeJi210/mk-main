package net.lele.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.lele.domain.Notice;
import net.lele.service.AskService;
import net.lele.service.CategoryService;
import net.lele.service.NoticeService;

@Controller
public class AdminController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	NoticeService noticeService;
	@Autowired
	AskService askService;
	
	@RequestMapping("/admin/index")
	public String index(Model model) {
		
		return "admin/index";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("/admin/notice")
	public String notice(Model model, Notice notice) {
		model.addAttribute("category", categoryService.findAll());
		return "admin/notice";
	}
	
	@RequestMapping(value = "/admin/notice", method = RequestMethod.POST)
	public String notice(Model model, Notice notice, BindingResult bindingResult) {
		if(noticeService.hasErrors(notice, bindingResult)) {
			model.addAttribute("category", categoryService.findAll());
			return "admin/notice";
		}
		noticeService.save(notice);
		return "redirect:/shop/notice";
	}
	
	@RequestMapping("/admin/asklist")
	public String ask(Model model) {
		model.addAttribute("ask", askService.findByOrderByIdDesc());
		
		return "admin/asklist";
	}
}
