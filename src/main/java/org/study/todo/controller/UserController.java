package org.study.todo.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.study.todo.model.User;
import org.study.todo.service.UserService;


@Controller
public class UserController {

	@Autowired
	UserService service;
	@Autowired
	BCryptPasswordEncoder encoder;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinGet() throws Exception {
		return "/user/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPost(@Valid User user, BindingResult result, RedirectAttributes rttr) throws Exception {
		if(result.hasErrors()) {
			return "/user/join";
		}
		user.setPassword(encoder.encode(user.getPassword()));
		service.saveUser(user);
		rttr.addAttribute("userName", user.getName());
		return "redirect:/welcome";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet() throws Exception {
		return "user/login";
	}
	
	@RequestMapping("/error")
	public String error(Model model) {
		model.addAttribute("error", "로그인 실패, 잘못된 ID/PASSWORD입니다");
		return "user/login";
	}
	
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String welcome(String userName, Model model) throws Exception {
		model.addAttribute("userName", userName);
		return "/user/welcome";
	}
	
	@RequestMapping(value = "/isOverLap", method = RequestMethod.POST)
	public @ResponseBody boolean isOverLap(String id) throws Exception {
		return service.isOverLap(id);
	}
}
