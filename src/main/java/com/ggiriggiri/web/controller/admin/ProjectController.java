package com.ggiriggiri.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/project/")
public class ProjectController {

	@RequestMapping("list")
	public String list() {
		
		return "admin.project.list";
	}
	
	@RequestMapping("detail")
	public String detail() {
		
		return "admin.project.detail";
	}
		
}
