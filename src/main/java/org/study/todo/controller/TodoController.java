package org.study.todo.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.study.todo.model.Category;
import org.study.todo.model.Criteria;
import org.study.todo.model.PageMaker;
import org.study.todo.model.Todo;
import org.study.todo.service.TodoService;

@Controller
@RequestMapping("/todo/*")
public class TodoController {
	
	@Autowired
	private TodoService service;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		binder.registerCustomEditor(Date.class, "studentDOB", 
				new CustomDateEditor(dateFormat, false));
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void addGet(Model model) throws Exception {
		List<Category> list = service.getCate();
		model.addAttribute("cate", list);
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addPost(@Valid Todo todo, BindingResult result, RedirectAttributes rttr, Principal princ) throws Exception {
		if(result.hasErrors()) {
			return "todo/add";
		}
		if(princ.getName() != null) {
			todo.setUser_id(princ.getName());
			service.add(todo);
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/todo/listPage";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(int idx, Criteria cri, Model model) throws Exception {
		model.addAttribute(service.read(idx));
		model.addAttribute("cri",cri);
		return "todo/read";
	}
	
	@RequestMapping(value = "remove", method = RequestMethod.POST)
	public String remove(int idx, Criteria cri, RedirectAttributes rttr) throws Exception {
		service.remove(idx);
		rttr.addFlashAttribute("result", "success");
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		return "redirect:/todo/listPage";
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public void modifyGet(int idx, Criteria cri, Model model) throws Exception {
		List<Category> list = service.getCate();
		model.addAttribute("cate", list);
		model.addAttribute("cri",cri);
		model.addAttribute(service.read(idx));
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modifyPost(@Valid Todo todo, BindingResult result, Criteria cri, RedirectAttributes rttr, Model model) throws Exception {
		if(result.hasErrors()) {
			List<Category> list = service.getCate();
			model.addAttribute("cate", list);
			model.addAttribute("cri",cri);
			return "todo/modify";
		}
		service.modify(todo);
		rttr.addFlashAttribute("result","success");
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		return "redirect:/todo/listPage";
	}
	
	@RequestMapping(value = "listPage", method = RequestMethod.GET)
	public void listPage(Criteria cri, Model model, Principal princ) throws Exception {
		PageMaker pagemaker = new PageMaker();
		pagemaker.setCri(cri);
		pagemaker.setTotalCount(service.getTotalTodoNum(princ.getName()));
		Map<String, String> params = new HashMap<>();
		params.put("user_id", princ.getName());
		params.put("pageStart", cri.getPageStart()+"");
		params.put("perPageNum", cri.getPerPageNum()+"");
		List<Category> list = service.getCate();
		model.addAttribute("cate", list);
		model.addAttribute("list", service.listCriteria(params));
		model.addAttribute("pageMaker", pagemaker);
	}
	
	
}
