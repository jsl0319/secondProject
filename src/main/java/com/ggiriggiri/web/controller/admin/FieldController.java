package com.ggiriggiri.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/category/field/")
public class FieldController {

	@RequestMapping("/")
	public String list() {

		return "admin.category.field";
		
	}
}
