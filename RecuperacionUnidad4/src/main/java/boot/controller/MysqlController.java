package boot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.model.Mysql;
import boot.service.MysqlService;



@Controller
public class MysqlController {
	
	@Autowired
	private MysqlService mysqlService;
	
	@GetMapping("/mysqls")
	public String home(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_HOME");
		return "mysqls";
	}
	
	@GetMapping("/all-mysqls")
	public String allMysqls(HttpServletRequest request) {
		request.setAttribute("mysqls", mysqlService.findAll());
		request.setAttribute("mode", "MODE_MYSQLS");
		return "mysqls";
	}
	
	@GetMapping("/new-mysql")
	public String newMysql(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_NEW");
		return "mysqls";
	}

	
	@PostMapping("/save-mysql")
	public String saveMysql(@ModelAttribute Mysql mysql, 
			BindingResult bindingResult, HttpServletRequest request) {
		mysqlService.save(mysql);
		request.setAttribute("mysqls", mysqlService.findAll());
		request.setAttribute("mode", "MODE_MYSQLS");		
		return "mysqls";
	}
	
	@GetMapping("/update-mysql")
	public String updateMysql(@RequestParam int id, HttpServletRequest request) {
	request.setAttribute("mysql", mysqlService.finOne(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "mysqls";
	}	
	
	
	@GetMapping("/delete-mysql")
	public String deleteMysql(@RequestParam int id, HttpServletRequest request) {
		mysqlService.delete(id);
	request.setAttribute("mysqls",mysqlService.findAll());
		request.setAttribute("mode", "MODE_MYSQLS");
		return "mysqls";
	}
}
