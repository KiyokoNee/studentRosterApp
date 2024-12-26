package com.gearing.studentroster.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.gearing.studentroster.models.Dorm;
import com.gearing.studentroster.services.DormService;

import jakarta.validation.Valid;

@Controller
public class DormController {
	@Autowired
	private DormService dormService;
	
	@GetMapping("/dorms")
	public String allDorms(Model model) {
		List<Dorm> dorms = dormService.allDorms();
		model.addAttribute("dorms", dorms);
		
		return "alldorms.jsp";
	}
	
	@GetMapping("/dorms/new")
	public String dormForm(Model model, @ModelAttribute Dorm dorm) {
		return "dormForm.jsp";
	}
	
	@PostMapping("/dorms/new")
	public String dormFormSubmit(Model model, @Valid @ModelAttribute Dorm dorm, BindingResult result) {
		if(result.hasErrors())
			return "dormForm.jsp";
		
		dormService.createDorm(dorm);
		return "redirect:/dorms";
	}
}
